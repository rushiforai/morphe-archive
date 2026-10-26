#!/usr/bin/env python3
"""Build the open data bundle consumed by the Flightradar24 "Open data for premium fields" patch.

Produces two files in the output directory:

  aircraft.db.gz  SQLite database with one row per airframe: registration, Mode S hex,
                  manufacturer serial number and build date, merged from the OpenSky
                  Network aircraft database and the tar1090-db registration table.
  firs.json.gz    Flight information region boundaries from the VATSpy Data Project,
                  reduced to outer rings with three decimal places.

Run with --cache-dir to reuse previously downloaded source files.
"""

import argparse
import csv
import gzip
import io
import json
import os
import shutil
import sqlite3
import sys
import time
import urllib.request

OPENSKY_URL = "https://opensky-network.org/datasets/metadata/aircraftDatabase.csv"
TAR1090_URL = "https://raw.githubusercontent.com/wiedehopf/tar1090-db/csv/aircraft.csv.gz"
VATSPY_BOUNDARIES_URL = "https://raw.githubusercontent.com/vatsimnetwork/vatspy-data-project/master/Boundaries.geojson"
VATSPY_DAT_URL = "https://raw.githubusercontent.com/vatsimnetwork/vatspy-data-project/master/VATSpy.dat"
FLAGS_JS_URL = "https://raw.githubusercontent.com/wiedehopf/tar1090/master/html/flags.js"
FR24_COUNTRIES = os.path.join(os.path.dirname(os.path.abspath(__file__)), "fr24_countries.json")
USER_AGENT = "fr24-open-data build script (+https://github.com/jagjordi/morphe-patches)"


def log(message):
    print(message, file=sys.stderr, flush=True)


def fetch(url, cache_dir, name, refresh):
    path = os.path.join(cache_dir, name)
    if os.path.exists(path) and not refresh:
        log(f"using cached {name}")
        return path
    log(f"downloading {url}")
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(request, timeout=600) as response, open(path + ".part", "wb") as out:
        shutil.copyfileobj(response, out)
    os.replace(path + ".part", path)
    return path


def normalize_reg(value):
    value = (value or "").strip().upper().replace(" ", "")
    return value or None


def normalize_hex(value):
    value = (value or "").strip().lower()
    if len(value) != 6:
        return None
    try:
        int(value, 16)
    except ValueError:
        return None
    return value


def normalize_built(value):
    """Return YYYY-MM-DD, or YYYY-00-00 when only the year is known."""
    value = (value or "").strip()
    if not value:
        return None
    year = value[:4]
    if not year.isdigit() or not 1900 <= int(year) <= 2100:
        return None
    if len(value) >= 10 and value[4] == "-" and value[7] == "-":
        month, day = value[5:7], value[8:10]
        if month.isdigit() and day.isdigit() and 1 <= int(month) <= 12 and 1 <= int(day) <= 31:
            return f"{year}-{month}-{day}"
    return f"{year}-00-00"


def build_aircraft_db(opensky_csv, tar1090_csv_gz, out_path):
    csv.field_size_limit(1 << 24)
    rows = {}

    with open(opensky_csv, newline="", encoding="utf-8", errors="replace") as handle:
        reader = csv.DictReader(handle)
        for record in reader:
            reg = normalize_reg(record.get("registration"))
            hexcode = normalize_hex(record.get("icao24"))
            msn = (record.get("serialnumber") or "").strip() or None
            built = normalize_built(record.get("built"))
            if built is None:
                built = normalize_built(record.get("firstflightdate"))
            if (reg is None and hexcode is None) or (msn is None and built is None):
                continue
            key = reg or hexcode
            rows[key] = [reg, hexcode, msn, built]

    added_years = 0
    with gzip.open(tar1090_csv_gz, "rt", encoding="utf-8", errors="replace") as handle:
        for line in handle:
            parts = line.rstrip("\n").split(";")
            if len(parts) < 6:
                continue
            hexcode = normalize_hex(parts[0])
            reg = normalize_reg(parts[1])
            built = normalize_built(parts[5])
            if built is None or (reg is None and hexcode is None):
                continue
            key = reg or hexcode
            row = rows.get(key)
            if row is None:
                rows[key] = [reg, hexcode, None, built]
                added_years += 1
            elif row[3] is None:
                row[3] = built
                added_years += 1

    if os.path.exists(out_path):
        os.remove(out_path)
    db = sqlite3.connect(out_path)
    db.execute("PRAGMA journal_mode=OFF")
    db.execute("PRAGMA synchronous=OFF")
    db.execute("CREATE TABLE aircraft (reg TEXT, hex TEXT, msn TEXT, built TEXT)")
    db.execute("CREATE TABLE meta (key TEXT PRIMARY KEY, value TEXT)")
    db.executemany("INSERT INTO aircraft VALUES (?, ?, ?, ?)", rows.values())
    db.execute("CREATE INDEX aircraft_reg ON aircraft (reg)")
    db.execute("CREATE INDEX aircraft_hex ON aircraft (hex)")
    generated = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
    db.executemany(
        "INSERT INTO meta VALUES (?, ?)",
        [
            ("generated", generated),
            ("sources", "OpenSky Network aircraft database; wiedehopf/tar1090-db"),
            ("rows", str(len(rows))),
        ],
    )
    db.commit()
    db.execute("VACUUM")
    db.close()
    with_msn = sum(1 for row in rows.values() if row[2])
    with_built = sum(1 for row in rows.values() if row[3])
    log(f"aircraft rows {len(rows)}, with msn {with_msn}, with build date {with_built}, years from tar1090 {added_years}")
    return len(rows)


def fir_names(vatspy_dat):
    names = {}
    section = None
    with open(vatspy_dat, encoding="utf-8", errors="replace") as handle:
        for line in handle:
            line = line.strip()
            if line.startswith("["):
                section = line
                continue
            if section != "[FIRs]" or not line or line.startswith(";"):
                continue
            parts = line.split("|")
            if len(parts) < 4 or not parts[3]:
                continue
            boundary, name = parts[3], parts[1].strip()
            if not name:
                continue
            current = names.get(boundary)
            if current is None or len(name) < len(current):
                names[boundary] = name
    return names


def build_firs(boundaries_geojson, vatspy_dat, out_path):
    names = fir_names(vatspy_dat)
    with open(boundaries_geojson, encoding="utf-8") as handle:
        collection = json.load(handle)
    firs = []
    for feature in collection["features"]:
        props = feature["properties"]
        fir_id = props.get("id")
        geometry = feature["geometry"]
        if not fir_id or geometry["type"] not in ("Polygon", "MultiPolygon"):
            continue
        polygons = geometry["coordinates"] if geometry["type"] == "MultiPolygon" else [geometry["coordinates"]]
        rings = []
        for polygon in polygons:
            if not polygon:
                continue
            outer = polygon[0]
            flat = []
            for point in outer:
                flat.append(round(float(point[0]), 3))
                flat.append(round(float(point[1]), 3))
            if len(flat) >= 6:
                rings.append(flat)
        if not rings:
            continue
        firs.append(
            {
                "id": fir_id,
                "name": names.get(fir_id, ""),
                "oceanic": 1 if str(props.get("oceanic", "0")) == "1" else 0,
                "rings": rings,
            }
        )
    payload = {
        "generated": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        "source": "VATSpy Data Project (vatsimnetwork/vatspy-data-project)",
        "firs": firs,
    }
    with gzip.open(out_path, "wt", encoding="utf-8", compresslevel=9) as handle:
        json.dump(payload, handle, separators=(",", ":"))
    log(f"fir features {len(firs)}")
    return len(firs)


def normalize_name(value):
    return "".join(ch for ch in value.lower() if ch.isalpha())


def build_countries(flags_js, out_path):
    """ICAO 24-bit address blocks mapped to the country ids the Flightradar24 app uses for flags."""
    import re

    with open(FR24_COUNTRIES, encoding="utf-8") as handle:
        table = json.load(handle)
    fr24_ids = {normalize_name(name): cid for name, cid in table["fr24CountryIds"].items()}
    aliases = {normalize_name(k): normalize_name(v) for k, v in table["aliases"].items()}
    with open(flags_js, encoding="utf-8") as handle:
        source = handle.read()
    pattern = re.compile(r'start:\s*(0x[0-9A-Fa-f]+),\s*end:\s*(0x[0-9A-Fa-f]+),\s*country:\s*"([^"]+)"')
    ranges = []
    unmatched = set()
    for start, end, name in pattern.findall(source):
        key = normalize_name(name)
        key = aliases.get(key, key)
        cid = fr24_ids.get(key)
        if cid is None:
            unmatched.add(name)
            continue
        ranges.append([int(start, 16), int(end, 16), cid, name])
    # Blocks nest (Bermuda sits inside the United Kingdom block), so flatten them into
    # disjoint intervals where the smallest enclosing block wins.
    points = sorted({r[0] for r in ranges} | {r[1] + 1 for r in ranges})
    flat = []
    for lo, hi in zip(points, points[1:]):
        covering = [r for r in ranges if r[0] <= lo and hi - 1 <= r[1]]
        if not covering:
            continue
        best = min(covering, key=lambda r: r[1] - r[0])
        if flat and flat[-1][2] == best[2] and flat[-1][1] + 1 == lo:
            flat[-1][1] = hi - 1
        else:
            flat.append([lo, hi - 1, best[2], best[3]])
    ranges = flat
    payload = {
        "generated": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        "source": "ICAO 24-bit address allocations from wiedehopf/tar1090 flags.js; ids from the Flightradar24 airport table",
        "ranges": ranges,
    }
    with open(out_path, "w", encoding="utf-8") as handle:
        json.dump(payload, handle, separators=(",", ":"))
    log(f"country blocks {len(ranges)}, unmatched names {sorted(unmatched)}")
    return len(ranges)


def gzip_file(src, dst):
    with open(src, "rb") as handle, gzip.open(dst, "wb", compresslevel=9) as out:
        shutil.copyfileobj(handle, out)


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--out-dir", default="dist")
    parser.add_argument("--cache-dir", default="cache")
    parser.add_argument("--refresh", action="store_true", help="download sources again even when cached")
    args = parser.parse_args()

    os.makedirs(args.out_dir, exist_ok=True)
    os.makedirs(args.cache_dir, exist_ok=True)

    opensky = fetch(OPENSKY_URL, args.cache_dir, "aircraftDatabase.csv", args.refresh)
    tar1090 = fetch(TAR1090_URL, args.cache_dir, "tar1090-aircraft.csv.gz", args.refresh)
    boundaries = fetch(VATSPY_BOUNDARIES_URL, args.cache_dir, "Boundaries.geojson", args.refresh)
    vatspy_dat = fetch(VATSPY_DAT_URL, args.cache_dir, "VATSpy.dat", args.refresh)
    flags_js = fetch(FLAGS_JS_URL, args.cache_dir, "flags.js", args.refresh)

    db_path = os.path.join(args.out_dir, "aircraft.db")
    rows = build_aircraft_db(opensky, tar1090, db_path)
    if rows < 300000:
        log("aircraft table is unexpectedly small, refusing to publish")
        return 1
    gzip_file(db_path, os.path.join(args.out_dir, "aircraft.db.gz"))
    os.remove(db_path)

    firs = build_firs(boundaries, vatspy_dat, os.path.join(args.out_dir, "firs.json.gz"))
    if firs < 1000:
        log("fir list is unexpectedly small, refusing to publish")
        return 1

    countries = build_countries(flags_js, os.path.join(args.out_dir, "countries.json"))
    if countries < 150:
        log("country block list is unexpectedly small, refusing to publish")
        return 1

    for name in ("aircraft.db.gz", "firs.json.gz", "countries.json"):
        size = os.path.getsize(os.path.join(args.out_dir, name))
        log(f"{name}: {size / 1048576:.1f} MB")
    return 0


if __name__ == "__main__":
    sys.exit(main())
