#!/usr/bin/env python3
"""Convert ONLY plain EasyList / AdGuard Japanese host and generic cosmetic rules.

No nonstandard parser dependencies. The derived dataset is a compact subset, not
a uBO engine: only bare or $third-party-alone host rules, no paths,
domain-scoped rules, redirects or scriptlets.

Digest protocol (shared with Android AdBlockHelper):
UTF-8 SHA256 of: str(version) + "\n" + generated_at + "\n" +
each lexicographically sorted host + "\n" + "--EXCEPTIONS--\n" +
each sorted exception + "\n" + "--CSS--\n" + css.
The sha256 field itself is excluded.
"""
from __future__ import annotations

import argparse
import datetime as dt
import gzip
import hashlib
import json
import re
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCES = (
    ("EasyList", "https://raw.githubusercontent.com/easylist/easylist/gh-pages/easylist.txt"),
    ("AdGuard Japanese Filter",
     "https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_7_Japanese/filter.txt"),
)
DOMAIN_RULE = re.compile(r"^(@@)?\|\|([a-z0-9.-]+)\^(?:\$third-party)?$", re.I)
HOST = re.compile(
    r"^(?=.{3,253}$)(?!.*\.\.)(?!-)(?!.*\.-)(?!.*-\.)"
    r"[a-z0-9-]+(?:\.[a-z0-9-]+)+$"
)
MIN_HOSTS = 10000
MAX_HOSTS = 100000
MAX_CSS = 30 * 1024
MAX_GZIP = 2 * 1024 * 1024
MAX_SOURCE = 16 * 1024 * 1024


def read_list(path: Path) -> set[str]:
    return {line.strip().lower() for line in path.read_text(encoding="utf-8").splitlines()
            if line.strip() and not line.lstrip().startswith("#")}


def protected(host: str, domains: set[str]) -> bool:
    return any(host == d or host.endswith("." + d) for d in domains)


def canonical(version: int, generated_at: str, hosts: set[str],
              exceptions: set[str], css: str) -> str:
    return (f"{version}\n{generated_at}\n" +
            "".join(host + "\n" for host in sorted(hosts)) +
            "--EXCEPTIONS--\n" +
            "".join(host + "\n" for host in sorted(exceptions)) +
            "--CSS--\n" + css)


def download(url: str) -> str:
    request = urllib.request.Request(url, headers={
        "User-Agent": "HatenaBookmarkMorpheFilters/0.4.0"})
    with urllib.request.urlopen(request, timeout=45) as response:
        data = response.read(MAX_SOURCE + 1)
    if len(data) > MAX_SOURCE:
        raise ValueError(f"upstream source over {MAX_SOURCE} bytes: {url}")
    return data.decode("utf-8-sig")


def convert(sources: list[str], allowed_css: set[str],
            protected_hosts: set[str], generated_at: str) -> tuple[dict, bytes]:
    hosts: set[str] = set()
    exceptions: set[str] = set()
    cosmetic: set[str] = set()
    for source in sources:
        for raw in source.splitlines():
            rule = raw.strip()
            match = DOMAIN_RULE.fullmatch(rule)
            if match:
                host = match.group(2).lower()
                if not HOST.fullmatch(host):
                    continue
                if match.group(1):
                    exceptions.add(host)
                else:
                    hosts.add(host)
                continue
            # Exactly generic "##selector"; domain-scoped and extended syntaxes ignored.
            if not rule.startswith("##") or rule.startswith("#?#"):
                continue
            selector = rule[2:]
            if selector in allowed_css:
                cosmetic.add(selector)
    hosts = {h for h in hosts if not protected(h, protected_hosts)}
    hosts.difference_update(exceptions)
    if not MIN_HOSTS <= len(hosts) <= MAX_HOSTS:
        raise ValueError(
            f"unsafe host count {len(hosts)}; expected {MIN_HOSTS}..{MAX_HOSTS}. "
            "Refusing to replace published snapshot."
        )
    if len(exceptions) > MAX_HOSTS:
        raise ValueError("too many exceptions")
    css = "".join(f"{s}{{display:none!important}}" for s in sorted(cosmetic))
    if len(css.encode("utf-8")) > MAX_CSS:
        raise ValueError("CSS exceeds 30 KiB")
    version = 1
    digest = hashlib.sha256(
        canonical(version, generated_at, hosts, exceptions, css).encode("utf-8")
    ).hexdigest()
    output = {
        "version": version,
        "generated_at": generated_at,
        "hosts": sorted(hosts),
        "exceptions": sorted(exceptions),
        "css": css,
        "sha256": digest,
    }
    encoded = json.dumps(output, ensure_ascii=False, separators=(",", ":")).encode("utf-8")
    zipped = gzip.compress(encoded, mtime=0)
    if len(zipped) > MAX_GZIP:
        raise ValueError("gzip snapshot exceeds 2 MiB")
    return output, zipped


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=Path("filters.json.gz"))
    parser.add_argument("--source-file", action="append", type=Path,
                        help="Offline fixture inputs (one per upstream source)")
    args = parser.parse_args()
    if args.source_file and len(args.source_file) != len(SOURCES):
        parser.error(f"provide exactly {len(SOURCES)} --source-file arguments")
    sources = ([p.read_text(encoding="utf-8") for p in args.source_file]
               if args.source_file else [download(url) for _, url in SOURCES])

    # Small, reviewed anti-adblock additions. Feed them through the SAME
    # converter, protected-host policy, exception precedence and v1 digest.
    extra_hosts = read_list(ROOT / "filter-lists" / "anti-adblock-hosts.txt")
    extra_css = read_list(ROOT / "filter-lists" / "anti-adblock-css.txt")
    if any(not HOST.fullmatch(host) for host in extra_hosts):
        raise ValueError("invalid supplemental anti-adblock host")
    if extra_css != {".ad-blocker-warning", ".main_adbalert", ".pane-emediate"}:
        raise ValueError("unexpected supplemental anti-adblock selector")
    sources.append("\n".join(
        [f"||{host}^" for host in sorted(extra_hosts)] +
        [f"##{selector}" for selector in sorted(extra_css)]
    ))
    generated_at = dt.datetime.now(dt.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    doc, compressed = convert(
        sources,
        read_list(ROOT / "filter-lists" / "css-allowlist.txt") | extra_css,
        read_list(ROOT / "filter-lists" / "protected-hosts.txt"),
        generated_at,
    )
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(compressed)
    print(json.dumps({
        "version": doc["version"],
        "hosts": len(doc["hosts"]),
        "exceptions": len(doc["exceptions"]),
        "css_bytes": len(doc["css"].encode("utf-8")),
        "gzip_bytes": len(compressed),
        "sha256": doc["sha256"],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
