"""Compare stock XP Hero 27.0.0 with a Morphe-patched APK/XAPK (or raw reward asset)."""
import argparse
from collections import defaultdict
from io import BytesIO
import json
from pathlib import Path
from zipfile import ZipFile

DATA = "assets/bin/Data/"
STAGES = "13bf84e053a954861b270b22d3c74e19"
DROPS = "0dbcfca3374434d098924e93b5c44354"
REWARDS = "24e543787512040e4b28b9c0b61c2286"
RUNES = "415ce751b3f4f4c9996ebbe10e6c3030"
GRADES = "1e43ef81efee749c6b3fb4918e4bb823"
EXPECTED = {1: (4, "Epic"), 2: (5, "Legendary"), 3: (7, "Mythic"), 4: (8, "Exotic")}


def assets(path, names):
    with ZipFile(path) as archive:
        if DATA + REWARDS in archive.namelist():
            return {n: archive.read(DATA + n) for n in names}
        base = next(n for n in ("io.supercent.weaponrpg.apk", "base.apk") if n in archive.namelist())
        with ZipFile(BytesIO(archive.read(base))) as apk:
            return {n: apk.read(DATA + n) for n in names}


def rows(asset):
    offset = int.from_bytes(asset[32:40], "big")
    name_size = int.from_bytes(asset[offset:offset + 4], "little")
    size_offset = offset + 4 + ((name_size + 3) & ~3)
    size = int.from_bytes(asset[size_offset:size_offset + 4], "little")
    return json.loads(asset[size_offset + 4:size_offset + 4 + size])[1:]


def verify(stock, patched):
    original = assets(stock, (STAGES, DROPS, REWARDS, RUNES, GRADES))
    if patched.suffix == ".bin":
        edited_asset = patched.read_bytes()
    else:
        actual = assets(patched, original)
        edited_asset = actual.pop(REWARDS)
        assert all(original[k] == v for k, v in actual.items()), "A read-only Tomb table changed"

    grades = {r["id"]: r for r in rows(original[GRADES])}
    runes = rows(original[RUNES])
    stages = {r["difficulty"]: r for r in rows(original[STAGES])}
    assert len(stages) == 20
    assert {(int(r["display_grade"]), int(r["display_roman"])) for r in stages.values()} == {
        (tier, phase) for tier in EXPECTED for phase in range(1, 6)
    }
    before = rows(original[REWARDS])
    after = rows(edited_asset)
    by_group = defaultdict(list)
    for row in before:
        by_group[row["Group"]].append(row)

    drops_by_phase = defaultdict(list)
    tops = {}
    for drop in rows(original[DROPS]):
        phase = drop["difficulty"]
        drops_by_phase[phase].append(drop["enemy_type"])
        stage = stages[phase]
        grade, name = EXPECTED[int(stage["display_grade"])]
        assert stage["ticket_cost"] == "1"
        assert grades[str(grade)]["rarity"] == str(grade)
        assert "_" + name + "_" in grades[str(grade)]["hero_icon_back_frame"]
        assert {r["type_id"] for r in runes if r["grade_id"] == str(grade)} == {"1", "101", "102", "103"}
        for group in (drop["reward_id"], drop["gacha_reward_id"]):
            pool = by_group[group]
            assert {r["RewardType"] for r in pool} <= {"0", "1", "102"}
            eligible = [int(r["RewardParam"]) for r in pool if r["RewardType"] == "102" and int(r["Rate"]) > 0]
            assert max(eligible) == grade
            assert tops.setdefault(group, str(grade)) == str(grade)
    assert drops_by_phase.keys() == stages.keys()
    assert all(sorted(types) == ["Boss", "Elite", "Normal", "Unique"] for types in drops_by_phase.values())
    assert len(tops) == 8

    # Check every selectable row and every field, including rows with no rune.
    # Original intervals and counts are identical, so repeating any roll cannot expose a lower grade.
    touched = slots = 0
    for prior, result in zip(before, after, strict=True):
        if prior["Group"] in tops and prior["RewardType"] == "102":
            slots += 1
            expected = {**prior, "RewardParam": tops[prior["Group"]]}
            touched += expected != prior
        else:
            expected = prior
        assert result == expected, f"Unexpected reward row {prior['id']}"
    assert (slots, touched) == (42, 34)
    assert len(edited_asset) == len(original[REWARDS])
    assert sum(a != b for a, b in zip(original[REWARDS], edited_asset)) == touched
    print("Verified all 20 phases, 80 enemy drop rows, 8 pools and 42 rune slots. Only 34 grade bytes differ.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stock", type=Path)
    parser.add_argument("patched", type=Path)
    args = parser.parse_args()
    verify(args.stock, args.patched)
