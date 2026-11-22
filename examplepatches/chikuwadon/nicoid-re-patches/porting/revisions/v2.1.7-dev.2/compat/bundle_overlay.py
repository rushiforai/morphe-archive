#!/usr/bin/env python3
"""Assemble the reviewed optional compatibility runtime for the current MPP.

Requires a known-good nicoid Re MPP supplied with --baseline. Rewrites only
the hidden BikeRun launcher to start the latest standard automatically,
adds 22 relocated classic-1.3.1 classes and 22 current-standard classes,
and reveals a mode picker only when tapping a game's top-left title. Integrated into a development-only candidate.
"""
import argparse
from copy import copy
import hashlib
import os
from pathlib import Path
import subprocess
import sys
from tempfile import TemporaryDirectory
from zipfile import ZipFile

import patch_rules

ROOT = Path(__file__).resolve().parent
HELPER = "nicoid/helpers.mpe"
OWNER = Path("e/e/a")
ANCHOR = "Le/e/a/BikeRun;->open(Landroid/app/Activity;)V"
NEW_HOOK = "Le/e/a/BikeRunSelector;->open(Landroid/app/Activity;)V"
SELECTOR = ("BikeRunSelector.smali", "BikeRunSelector$Choice.smali")


def require(condition, message):
    if not condition:
        raise ValueError(message)


def run(*args):
    subprocess.run([str(a) for a in args], check=True)


def tool_classpath(folder):
    supplied = os.environ.get("SMALI_CLASSPATH")
    if supplied:
        return supplied
    tools = folder / "tools"
    tools.mkdir()
    run("mvn", "-q", "-B", "-f", ROOT / "tools/smali/pom.xml",
        "org.apache.maven.plugins:maven-dependency-plugin:3.7.1:copy-dependencies",
        "-DoutputDirectory=" + str(tools))
    return str(tools / "*")


def disassemble(dex, directory, classpath):
    run("java", "-cp", classpath, "org.jf.baksmali.Main",
        "disassemble", "--sequential-labels", dex, "-o", directory)
    return {p.relative_to(directory): p.read_bytes() for p in directory.rglob("*.smali")}


def make_candidate(baseline, output):
    require(baseline.is_file(), "Baseline MPP not found")
    require(baseline.resolve() != output.resolve(), "Never overwrite the baseline")
    original_digest = hashlib.sha256(baseline.read_bytes()).hexdigest()
    with TemporaryDirectory(prefix="private-bikerun-mpp-") as name:
        tmp = Path(name)
        classpath = tool_classpath(tmp)
        with ZipFile(baseline, "r") as archive:
            require(HELPER in archive.namelist(), "Not a supported MPP: helper DEX missing")
            require("META-INF/MANIFEST.MF" in archive.namelist(), "MPP manifest missing")
            dex = tmp / "baseline.dex"
            dex.write_bytes(archive.read(HELPER))
            source = tmp / "smali"
            original = disassemble(dex, source, classpath)
            modern = OWNER / "ModernShorts.smali"
            game = OWNER / "BikeRun.smali"
            require(modern in original and game in original,
                    "Hidden launcher or verified v1.4.3 runtime missing")
            require(original[modern].count(ANCHOR.encode("ascii")) == 1,
                    "Hidden hook missing or ambiguous; refusing to modify app")

            selected = ROOT / "entry/e/e/a"
            for file in SELECTOR:
                target = source / OWNER / file
                require(not target.exists(), "Selector class collision: " + file)
                target.write_bytes((selected / file).read_bytes())
            modern_file = source / modern
            modern_file.write_bytes(original[modern].replace(ANCHOR.encode(), NEW_HOOK.encode()))

            # Preserve v1.4.3 as v1.4.3; only add down-swiping to its wheelie
            # gesture and a hidden title tap. Never bump its version.
            original_game_names = sorted(
                p for p in original if p.parent == OWNER and p.name.startswith("BikeRun")
            )
            require(len(original_game_names) == 22, "Expected 22 verified current game classes")
            for game_path in (OWNER / "BikeRun.smali", OWNER / "BikeRun$Track.smali",
                              OWNER / "BikeRunRecords$Entry.smali", OWNER / "BikeRunRecords.smali",
                              OWNER / "BikeRunRecords$2.smali", OWNER / "BikeRun$RecordsPane.smali"):
                transformed = patch_rules.transform_original(
                    original[game_path].decode("utf-8"), game_path.name)
                (source / game_path).write_text(transformed, encoding="utf-8")

            # The v1.5.0 engine is a separately namespaced copy of
            # verified 1.4.3 behavior, with vector-only speed streaks.
            standard_root = Path("e/e/a/internal/standard150")
            for game_path in original_game_names:
                destination = source / standard_root / game_path.name
                require(not destination.exists(), "Standard class already exists")
                destination.parent.mkdir(parents=True, exist_ok=True)
                converted = patch_rules.transform_standard(
                    original[game_path].decode("utf-8"), game_path.name)
                destination.write_text(converted, encoding="utf-8")

            # No original classic class may be renamed or lost.
            classic_src = tmp / "classic/e/e/a/internal/classic131"
            run(sys.executable, ROOT / "relocate_legacy.py",
                "--output", classic_src)
            for file in classic_src.glob("BikeRun*.smali"):
                relative = Path("e/e/a/internal/classic131") / file.name
                destination = source / relative
                require(not destination.exists(), "Relocated class already exists")
                destination.parent.mkdir(parents=True, exist_ok=True)
                destination.write_text(patch_rules.transform_classic131(
                    file.read_text(encoding="utf-8"), file.name), encoding="utf-8")
            require(len(list(classic_src.glob("BikeRun*.smali"))) == 22,
                    "Missing classic v1.3.1 classes")
            rebuilt = tmp / "helpers.dex"
            run("java", "-cp", classpath, "org.jf.smali.Main", "assemble",
                source, "-o", rebuilt)
            require(rebuilt.is_file() and rebuilt.stat().st_size > 0,
                    "Smali assembly failed")

            checked = disassemble(rebuilt, tmp / "checked", classpath)
            extras = {OWNER / filename for filename in SELECTOR}
            extras.update(Path("e/e/a/internal/classic131") / p.name
                          for p in classic_src.glob("BikeRun*.smali"))
            extras.update(standard_root / p.name for p in original_game_names)
            require(len(extras) == 46, "Unexpected new class set")
            require(set(checked) == set(original) | extras,
                    "Unrelated classes removed or extra classes injected")
            modified = {modern, OWNER / "BikeRun.smali", OWNER / "BikeRun$Track.smali",
                        OWNER / "BikeRunRecords$Entry.smali", OWNER / "BikeRunRecords.smali",
                        OWNER / "BikeRunRecords$2.smali", OWNER / "BikeRun$RecordsPane.smali"}
            for path in original:
                if path == modern:
                    require(NEW_HOOK.encode() in checked[path],
                            "Latest-version launcher redirection missing")
                elif path in modified:
                    require(checked[path] != original[path],
                            "Expected game input overlay missing: " + str(path))
                else:
                    require(checked[path] == original[path],
                            "Unrelated base class changed: " + str(path))
            # All 3 engines use the same legacy history; record format already
            # contains a version for filtering the combined recent/best lists.
            for root in (OWNER, Path("e/e/a/internal/classic131"), standard_root):
                entry = checked[root / "BikeRun$Track.smali"]
                require(b'"bike_run_records_v1"' in entry,
                        "Shared history key missing from " + str(root))
                require(b'"bike_run_records_classic131_v1"' not in entry,
                        "Deprecated isolated classic record key found")
            require(b'v1.4.3' in checked[OWNER / "BikeRunModel.smali"],
                    "Classic v1.4.3 version was unexpectedly changed")
            require(b'v1.5.0' in checked[standard_root / "BikeRunModel.smali"],
                    "New standard version marker missing")
            standard_model = checked[standard_root / "BikeRunModel.smali"]
            standard_track = checked[standard_root / "BikeRun$Track.smali"]
            require(b'->lives:I' in standard_model and
                    b'->damageCooldown:F' in standard_model and
                    b'stepLegacy(F)V' in standard_model,
                    "Three-life gameplay implementation missing")
            require(b'drawLives' in standard_track,
                    "Health HUD missing")
            require(b'drawSpeedLines' not in standard_track,
                    "Stray speed-streak lines still present")
            require(b'->pickupDistance:F' in standard_model and
                    b'updatePickup()V' in standard_model and
                    b'drawRecovery' in standard_track,
                    "Collectible recovery item missing")
            require(b'drawWeather' in standard_track and
                    b'drawDistantShapes' not in standard_track and
                    b'drawSkyOrb' not in standard_track and
                    b'drawEnemyMark' not in standard_track,
                    "Floating strokes, duplicate eye or extra celestial object remains")
            require(b'drawEnemySpecies' in standard_track and
                    b'clipPath(Landroid/graphics/Path;)Z' in standard_track,
                    "50 clipped polygon enemy species missing")
            # No orange polygon overlay on the legacy spike obstacle: the
            # new renderer must explicitly skip Hazard.spikes before fill.
            polygon_method = standard_track.split(b'.method private drawEnemySpecies', 1)
            require(len(polygon_method) == 2 and
                    b'->spikes:Z' in polygon_method[1].split(b'.end method', 1)[0],
                    "Spike enemy must retain the plain outline-only shape")
            require(b'drawGapOnlyScenery' not in standard_track,
                    "Cliff gap still has the special background renderer")

            # The hole must be *absent from the filled ground*, NOT painted
            # over afterward with a background-colored rectangle.
            require(b'->drawTerrainWithoutHoles(' in standard_track and
                    b'.method private drawTerrainWithoutHoles(' in standard_track and
                    b'clipOutRect(FFFF)Z' in standard_track and
                    b'->terrainGapAt(F)Z' in standard_track and
                    b'->hazards:Ljava/util/ArrayList;' in standard_track,
                    "True negative terrain fill mask missing from v1.5.0")
            require(b'cliffGapMinGround' not in standard_track and
                    b'fillCliffBackdrop' not in standard_track and
                    b'drawDeepScenery' not in standard_track,
                    "Old cliff background repaint strategy is still installed")
            def scenery_method(raw):
                marker = b'.method scenery(Landroid/graphics/Canvas;F)V'
                require(raw.count(marker) == 1, "Unexpected scenery method structure")
                return raw.split(marker, 1)[1].split(b'.end method', 1)[0]
            standard_scenery = scenery_method(standard_track)
            baseline_scenery = scenery_method(original[OWNER / "BikeRun$Track.smali"])
            require(standard_scenery.count(b'Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V')
                    == baseline_scenery.count(b'Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V') - 2,
                    "Opaque color erasers still paint into the two cliff-gap paths")
            require(standard_scenery.count(b'Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V')
                    == baseline_scenery.count(b'Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V') - 1,
                    "Continuous road fill did not become mask-based terrain fill")
            require(b'->VERSION:Ljava/lang/String;' in standard_track and
                    b'"1.4.3"' not in standard_track,
                    "Standard run history still uses a stale version marker")
            pane = checked[standard_root / "BikeRun$RecordsPane.smali"]
            require(pane.count(b'->VERSION:Ljava/lang/String;') >= 2 and
                    b'v1.4.3' not in pane,
                    "Best 10 subtitle/filter does not match active game version")
            species = checked[standard_root / "BikeRunModel$Hazard.smali"]
            require(b'->nextSpecies:I' in species and
                    b'->species:I' in species and
                    b'0x32' in species,
                    "50 deterministic rotating species missing")
            require(b'gentleSpawnSpan(FF)Z' in standard_model and
                    b'0x17c' in standard_model,
                    "Gentle slope spawning / flat pacing missing")
            require(b'clipOutPath' in standard_track and
                    b'0x46cb2000' in standard_track,
                    "Terrain-clipped weather with long storms missing")
            require(b'0x30' in standard_track and b'0x44b40000' in standard_track,
                    "Full-height weather sampling missing")
            require(b'rem-int/lit8 v4, v4, 0x7' in standard_model,
                    "Seven early hazard shape families missing")
            require(b'->flyerDistance:F' in standard_model and
                    b'updateFlyer()V' in standard_model and
                    b'drawFlyer' in standard_track,
                    "Flying enemy collision and renderer missing")
            standard_profile = checked[standard_root / "BikeRunModel$Profile.smali"]
            require(b'atLegacy(F)F' in standard_profile and
                    b'at(F)F' in standard_profile,
                    "New ridge/valley terrain variants missing")


            # All modes must support safe deletion from both shared history lists.
            for root in (OWNER, Path("e/e/a/internal/classic131"), standard_root):
                records = checked[root / "BikeRunRecords.smali"]
                pane = checked[root / "BikeRun$RecordsPane.smali"]
                require(b'removeId(Ljava/lang/String;)Z' in records,
                        "Per-record delete method missing: " + str(root))
                require(b'OnLongClickListener;' in pane and
                        b'onLongClick(Landroid/view/View;)Z' in pane and
                        b'OnDismissListener;' in pane and
                        b'bike_run_records_v1' in pane,
                        "Long press, confirmation or persistence missing: " + str(root))

            for root in (OWNER, Path("e/e/a/internal/classic131"), standard_root):
                sorter = checked[root / "BikeRunRecords$2.smali"]
                require(b'numericPart(Ljava/lang/String;I)' in sorter and
                        b'replaceFirst' in sorter,
                        "Prerelease-safe high score version comparator missing: " + str(root))

            # Game-over crash regression: prerelease version rejected by Entry.
            # All modes must accept the shared history's prerelease versions.
            for root in (OWNER, Path("e/e/a/internal/classic131"), standard_root):
                entry = checked[root / "BikeRunRecords$Entry.smali"]
                require(b'(-[a-zA-Z0-9.-]+)?' in entry,
                        "Prerelease record validator missing: " + str(root))

            # Bytecode-level contracts for hidden selection, shared history,
            # preserved classic version and upward/downward wheelie.
            selector = checked[OWNER / "BikeRunSelector.smali"]
            require(b'Le/e/a/internal/standard150/BikeRun;->open' in selector,
                    "The hidden entry point does not launch the latest version")
            for root in (OWNER, Path("e/e/a/internal/classic131"), standard_root):
                track = checked[root / "BikeRun$Track.smali"]
                game_dialog = checked[root / "BikeRun.smali"]
                require(b'Le/e/a/BikeRunSelector;->isTitleHit' in track and
                        b'Le/e/a/BikeRunSelector;->showFor' in track,
                        "Title selection hook is missing: " + str(root))
                require(b'Landroid/view/View;->setTag' in game_dialog,
                        "Dialog lifecycle link missing: " + str(root))
            for root in (OWNER, standard_root):
                track = checked[root / "BikeRun$Track.smali"]
                require(b'const/16 v3, -0x56' in track and
                        b'const/16 v3, 0x56' in track,
                        "Up/down wheelie threshold missing: " + str(root))


            output.parent.mkdir(parents=True, exist_ok=True)
            with ZipFile(output, "w") as candidate:
                for info in archive.infolist():
                    data = rebuilt.read_bytes() if info.filename == HELPER else archive.read(info.filename)
                    candidate.writestr(copy(info), data)

            with ZipFile(output, "r") as candidate:
                require(candidate.namelist() == archive.namelist(),
                        "MPP entries unexpectedly changed")
                for info in archive.infolist():
                    if info.filename != HELPER:
                        require(candidate.read(info.filename) == archive.read(info.filename),
                                "Non-game MPP entry changed: " + info.filename)
            require(hashlib.sha256(baseline.read_bytes()).hexdigest() == original_digest,
                    "Baseline MPP was modified")

            growth = output.stat().st_size - baseline.stat().st_size
            helper_growth = rebuilt.stat().st_size - len(archive.read(HELPER))
            print("PASS: optional runtime integrated; 46 new classes")
            print("Baseline MPP SHA256:", original_digest)
            print("Candidate MPP SHA256:", hashlib.sha256(output.read_bytes()).hexdigest())
            print("MPP growth:", growth, "bytes; helper DEX growth:", helper_growth, "bytes")
            print("Caution: Android installation and patched APK size require validation")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--baseline", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    make_candidate(args.baseline, args.output)
