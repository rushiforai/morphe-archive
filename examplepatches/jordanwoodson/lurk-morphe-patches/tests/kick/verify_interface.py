#!/usr/bin/env python3
"""Execute the Interface patches' emitted Hermes edits, switch off and on.

Usage (hermes-dec Python): verify_interface.py stock.bundle patched.apk
Or: verify_interface.py stock.bundle patched.bundle manifest.json

For each edit in the APK's manifest the switch's bytes are applied to the stock bundle and the edited code runs
in a small interpreter with boundary doubles (the translation function, environments, memo caches); unknown
instructions fail the run. Covered, when the APK has them:
- Hide Clips: the Browse and channel tab lists lose their Clips entry with no hole, Chat moves up; the category
  header's screen list keeps Live only; the register the edits overwrite holds undefined there in stock code; the
  PopularClipsRow element becomes null.
- Hide subscription upsells: ChannelSubButton's unsubscribed path returns null, its subscribed path still jumps to
  the subscribed icon; the gift and leaderboard prompts return null at entry.
- Hide KICKs tipping, Hide Home sections, Block update prompts: each component returns null at entry when on, and
  runs its own first instruction when off.
- AMOLED black: the Colors.surface.default object literal, built by the actual instruction from the edited value
  buffer, for each choice.
- Hide mature-content warning: the preferences selector state => state.isOver18 returns true when on, the stored
  value when off.
- Lurk in account menu: AccountScreen's developer settings row, run from its role check for an account without
  staff roles, is drawn when on as an AccountMenuItem labelled "Lurk" whose href is Lurk's link, one expo-router
  hands to Linking.openURL; when off nothing is drawn, as in stock.
This doesn't run React Native; the device and the on-screen result are checked separately (docs/kick.md).
"""
import argparse
import ast
from io import BytesIO
import json
from pathlib import Path
import re
import struct
import sys
from zipfile import is_zipfile, ZipFile

from hermes_dec.parsers.hbc_bytecode_parser import parse_hbc_bytecode
from hermes_dec.parsers.hbc_file_parser import HBCReader
from hermes_dec.parsers.serialized_literal_parser import unpack_slp_array

sys.path.insert(0, str(Path(__file__).resolve().parent))  # Also under python -I.
from test_hermes import footer, selected_bytes, verify as structural  # noqa: E402

UNDEFINED = object()
HOLE = object()


class Returned(Exception):
    def __init__(self, value):
        super().__init__("returned")
        self.value = value


class Bundle:
    def __init__(self, stock, embedded, manifest):
        self.stock, self.embedded, self.manifest = stock, embedded, manifest
        self.reader = HBCReader()
        self.reader.read_whole_file(BytesIO(stock))
        self.strings = self.reader.strings
        self.literal_start = stock.find(bytes(self.reader.literal_values))
        assert self.literal_start > 0, "literal value buffer not found"

    def keys(self):
        return {edit["key"] for edit in self.manifest["edits"]}

    def state(self, values):
        """The bundle with each edit's bytes for its setting's value ("true"/"false" or a choice number); else off."""
        data = bytearray(self.stock)
        for edit in self.manifest["edits"]:
            value = values.get(edit["key"], "-7" if "values" in edit else "false")
            chosen = selected_bytes(edit, value)
            data[edit["offset"]:edit["offset"] + len(chosen)] = chosen
        return footer(data)

    def named(self, name):
        found = [h for h in self.reader.function_headers if self.strings[h.functionName] == name]
        assert len(found) == 1, f"expected one function named {name}"
        return found[0]

    def loading(self, *texts):
        """The one function that loads every string in [texts] (LoadConstString), for anonymous functions."""
        ids = [self.strings.index(text) for text in texts]
        patterns = [bytes([0x90]) + b"\x00" + struct.pack("<H", i) for i in ids]
        found = []
        for header in self.reader.function_headers:
            body = self.stock[header.offset:header.offset + header.bytecodeSizeInBytes]
            if not all(self._has_load(body, pattern) for pattern in patterns):
                continue
            loaded = {i.arg2 for i in self.code(header, self.stock).values() if i.inst.name == "LoadConstString"}
            if set(ids) <= loaded:
                found.append(header)
        unique = {h.offset: h for h in found}
        assert len(unique) == 1, f"expected one function loading {texts}, found {len(unique)}"
        return next(iter(unique.values()))

    @staticmethod
    def _has_load(body, pattern):
        # LoadConstString rX, id: any destination register.
        start = 0
        while True:
            at = body.find(pattern[:1], start)
            if at < 0 or at + 4 > len(body):
                return False
            if body[at + 2:at + 4] == pattern[2:]:
                return True
            start = at + 1

    def code(self, header, data):
        self.reader.file_buffer = BytesIO(data)
        return {i.original_pos: i for i in parse_hbc_bytecode(header, self.reader)}

    def literal(self, value):
        if value == "undefined":
            return UNDEFINED
        if value in ("null", "true", "false"):
            return {"null": None, "true": True, "false": False}[value]
        return ast.literal_eval(value)

    def run(self, header, data, registers=None, environments=(), start=0, stop=(), params=()):
        """Executes from [start] until Ret (raises Returned) or until the next instruction is in [stop] (returns its
        offset and the registers)."""
        code = self.code(header, data)
        r = dict(registers or {})
        pc = start
        for _ in range(500):
            if pc in stop:
                return pc, r
            i = code[pc]
            op = i.inst.name
            a = [getattr(i, f"arg{j}") for j in range(1, len(i.inst.operands) + 1)]
            pc = i.next_pos
            if op == "GetParentEnvironment":
                r[a[0]] = environments[a[1]]
            elif op == "LoadParam":
                r[a[0]] = params[a[1] - 1]
            elif op == "LoadFromEnvironment":
                r[a[0]] = r[a[1]][a[2]]
            elif op == "LoadConstUndefined":
                r[a[0]] = UNDEFINED
            elif op == "LoadConstNull":
                r[a[0]] = None
            elif op in ("LoadConstTrue", "LoadConstFalse"):
                r[a[0]] = op == "LoadConstTrue"
            elif op in ("LoadConstString", "LoadConstStringLongIndex"):
                r[a[0]] = self.strings[a[1]]
            elif op in ("Call1", "Call2", "Call3"):
                r[a[0]] = r[a[1]](*[r[x] for x in a[2:]])  # this, then the arguments
            elif op in ("GetById", "GetByIdShort"):
                r[a[0]] = r[a[1]].get(self.strings[a[3]], UNDEFINED)
            elif op == "GetByIndex":
                r[a[0]] = r[a[1]][a[2]]
            elif op in ("NewObjectWithBuffer", "NewObjectWithBufferLong"):
                keys = self.reader.object_shape_keys[a[1]]
                values = data[self.literal_start + a[2]:self.literal_start + len(self.reader.literal_values)]
                parsed = unpack_slp_array(values, len(keys), 99).to_strings(self.strings)
                r[a[0]] = {self.literal(k): self.literal(v) for k, v in zip(keys, parsed)}
            elif op == "PutOwnBySlotIdx":
                r[a[0]][list(r[a[0]])[a[2]]] = r[a[1]]
            elif op == "NewArray":
                r[a[0]] = [HOLE] * a[1]
            elif op == "DefineOwnInDenseArray":
                array = r[a[0]]
                array.extend([HOLE] * (a[2] + 1 - len(array)))
                array[a[2]] = r[a[1]]
            elif op == "Mov":
                r[a[0]] = r[a[1]]
            elif op in ("JmpTrue", "JmpTrueLong", "JmpFalse", "JmpFalseLong"):
                truth = r[a[1]] is not UNDEFINED and bool(r[a[1]])
                if truth == op.startswith("JmpTrue"):
                    pc = i.original_pos + a[0]
            elif op == "Ret":
                raise Returned(r[a[0]])
            else:
                raise AssertionError(f"Unsupported executed instruction {op} at {i.original_pos:#x}")
        raise AssertionError("Unexpected bytecode loop")


def check(condition, what):
    if not condition:
        raise AssertionError(what)
    print(f"ok  {what}")


def returns(bundle, header, data, **kwargs):
    try:
        outcome = bundle.run(header, data, **kwargs)
    except Returned as returned:
        return returned.value
    raise AssertionError(f"{bundle.strings[header.functionName] or 'function'} didn't return: {outcome[0]:#x}")


def entry_returns_null(bundle, key, names):
    """Each component returns null as its first instruction with [key] on, and runs its own first one with it off."""
    on, off = bundle.state({key: "true"}), bundle.state({key: "false"})
    for name in names:
        header = bundle.named(name)
        check(returns(bundle, header, on) is None, f"{key}: {name} returns null at entry when on")
        first = bundle.code(header, off)[0]
        check(first.inst.name in ("GetParentEnvironment", "CreateFunctionEnvironment", "LoadParam", "LoadThisNS"),
              f"{key}: {name} starts its own code when off ({first.inst.name})")


def hide_clips(bundle):
    on, off = bundle.state({"hide_clips": "true"}), bundle.state({"hide_clips": "false"})
    translate = lambda this, key: key  # noqa: E731  The t() the producers call: the message key is enough.
    lists = [
        ("Browse", ("categories.title.message", "browse.tabs.livechannels.title.message", "clips.title.message"), 0,
         ["categories", "livestreams", "clips"]),
        ("channel", ("channel.tabs.home.message", "channel.tabs.clips.message", "channel.tabs.chat.message"), 2,
         ["home", "about", "videos", "clips", "chat"]),
    ]
    for what, texts, slot, names in lists:
        header = bundle.loading(*texts)
        environment = [{slot: translate}]
        stock = returns(bundle, header, off, environments=environment)
        check([tab["name"] for tab in stock] == names, f"Hide Clips off: the {what} tab list is stock")
        hidden = returns(bundle, header, on, environments=environment)
        check([tab["name"] for tab in hidden] == [n for n in names if n != "clips"] and HOLE not in hidden,
              f"Hide Clips on: the {what} tab list drops Clips with no hole")
        # The edits write undefined over r0; in stock code r0 is undefined wherever the edits run.
        code = bundle.code(header, off)
        for offset, instruction in code.items():
            if instruction.inst.name == "DefineOwnInDenseArray" and offset > 0:
                _, registers = bundle.run(header, off, environments=environment, stop={offset})
                check(registers.get(0, UNDEFINED) is UNDEFINED, f"{what} list: r0 is undefined at {offset:#x}")

    # BrowseCategoriesHeader builds [Live, Clips] in the middle of the component: run just that window.
    header = bundle.named("BrowseCategoriesHeader")
    edit = next(e for e in bundle.manifest["edits"] if e["key"] == "hide_clips" and
                header.offset <= e["offset"] < header.offset + header.bytecodeSizeInBytes)
    start = edit["offset"] - header.offset
    end = start + len(bytes.fromhex(edit["original"]))
    seeded = {12: None, 16: "live", 21: "clips", 1: UNDEFINED}
    _, registers = bundle.run(header, off, registers=seeded, start=start, stop={end})
    check(registers[12] == ["live", "clips"], "Hide Clips off: the category header lists Live and Clips")
    _, registers = bundle.run(header, on, registers=seeded, start=start, stop={end})
    check(registers[12] == ["live"] and registers[1] is UNDEFINED,
          "Hide Clips on: the category header lists Live only and r1 stays undefined")
    # r1 really is undefined there in stock code: the component's only writes to it load undefined.
    writes = [i for i in bundle.code(header, off).values() if len(i.inst.operands) and i.inst.operands[0].operand_type.name == "Reg8"
              and i.arg1 == 1 and i.inst.name not in ("Ret",)]
    check(writes and all(i.inst.name == "LoadConstUndefined" for i in writes),
          "category header: every instruction naming r1 first loads undefined")

    # ChannelHomeContent: jsx(PopularClipsRow, {channelSlug}) becomes null in the call's result register.
    edits = [e for e in bundle.manifest["edits"] if e["key"] == "hide_clips"]
    homes = [h for h in bundle.reader.function_headers if bundle.strings[h.functionName] == "ChannelHomeContent"
             and any(h.offset <= e["offset"] < h.offset + h.bytecodeSizeInBytes for e in edits)]
    check(len(homes) == 1, "one ChannelHomeContent carries the PopularClipsRow edit")
    home = homes[0]
    edit = next(e for e in edits if home.offset <= e["offset"] < home.offset + home.bytecodeSizeInBytes)
    start = edit["offset"] - home.offset
    call = bundle.code(home, off)[start]
    check(call.inst.name == "Call3", "the edit replaces the PopularClipsRow jsx call")
    seeded = {call.arg2: lambda *args: "element", call.arg3: UNDEFINED, call.arg4: "row", call.arg5: {}}
    _, registers = bundle.run(home, off, registers=seeded, start=start, stop={call.next_pos})
    check(registers[call.arg1] == "element", "Hide Clips off: the PopularClipsRow element is made")
    _, registers = bundle.run(home, on, registers=seeded, start=start, stop={call.next_pos})
    check(registers[call.arg1] is None, "Hide Clips on: the PopularClipsRow element is null")


def hide_upsells(bundle):
    key = "hide_subscription_upsells"
    on, off = bundle.state({key: "true"}), bundle.state({key: "false"})
    header = bundle.named("ChannelSubButton")
    edit = next(e for e in bundle.manifest["edits"] if e["key"] == key and
                header.offset <= e["offset"] < header.offset + header.bytecodeSizeInBytes)
    index = edit["offset"] - header.offset
    code = bundle.code(header, off)
    positions = sorted(code)
    jump = code[positions[positions.index(index) - 1]]
    read = code[positions[positions.index(index) - 2]]
    check(read.inst.name == "GetById" and bundle.strings[read.arg4] == "subscription" and jump.inst.name == "JmpTrueLong",
          "ChannelSubButton: the edit follows the subscription read and its branch")
    subscribed_at = jump.original_pos + jump.arg1
    after = code[index].next_pos
    memo = [f"memo{n}" for n in range(64)]
    for subscribed in (True, False):
        seeded = {read.arg2: {"subscription": {"id": 1} if subscribed else None}, code[index].arg2: memo}
        for data, state in ((off, "off"), (on, "on")):
            try:
                pc, _ = bundle.run(header, data, registers=seeded, start=read.original_pos, stop={subscribed_at, after})
                outcome = "subscribed icon" if pc == subscribed_at else "Subscribe button"
            except Returned as returned:
                outcome = "null" if returned.value is None else repr(returned.value)
            expected = "subscribed icon" if subscribed else ("null" if state == "on" else "Subscribe button")
            check(outcome == expected, f"Hide subscription upsells {state}, "
                  f"{'subscribed' if subscribed else 'not subscribed'}: {expected}")
    entry_returns_null(bundle, key, ["ChannelGiftSubButton", "LeaderboardSubsFooter"])


def amoled(bundle):
    edits = [e for e in bundle.manifest["edits"] if e["key"] == "amoled_black"]
    # The object literal (keys highest, base, lowest, ...) whose values start right before the edited string IDs.
    first = min(e["offset"] for e in edits) - bundle.literal_start
    found = []
    shapes = [n for n, keys in enumerate(bundle.reader.object_shape_keys) if list(keys[:3]) == ["'highest'", "'base'", "'lowest'"]]
    check(shapes, "Colors.surface shapes exist")
    for header in bundle.reader.function_headers:
        body = bundle.stock[header.offset:header.offset + header.bytecodeSizeInBytes]
        if not body:
            continue
        for shape in shapes:
            for opcode, encoded in ((0x01, struct.pack("<H", shape)), (0x02, struct.pack("<I", shape))):
                at = body.find(bytes([opcode]))
                while at >= 0:
                    if body[at + 2:at + 2 + len(encoded)] == encoded:
                        start = struct.unpack_from("<H" if opcode == 1 else "<I", body, at + 2 + len(encoded))[0]
                        if start <= first < start + 16:
                            found.append((header, at))
                    at = body.find(bytes([opcode]), at + 1)
    unique = {(h.offset, at): (h, at) for h, at in found}
    check(len(unique) == 1, "one Colors.surface.default literal reads the edited values")
    header, at = next(iter(unique.values()))
    expected = {"0": ("#1C1E20", "#141517", "#090A0B"), "1": ("#1C1E20", "#141517", "#000000"),
                "2": ("#1C1E20", "#0B0B0C", "#000000")}
    others = None
    for value, colours in expected.items():
        data = bundle.state({"amoled_black": value})
        instruction = bundle.code(header, data)[at]
        _, registers = bundle.run(header, data, start=at, stop={instruction.next_pos})
        surface = registers[instruction.arg1]
        check((surface["highest"], surface["base"], surface["lowest"]) == colours,
              f"AMOLED black {value}: highest, base, lowest = {', '.join(colours)}")
        rest = {k: v for k, v in surface.items() if k not in ("highest", "base", "lowest")}
        others = rest if others is None else others
        check(rest == others, f"AMOLED black {value}: the object's other values are unchanged")


def mature(bundle):
    """Hide mature-content warning: the preferences selector `state => state.isOver18` says true when on."""
    key = "hide_mature_warning"
    edit = next(e for e in bundle.manifest["edits"] if e["key"] == key)
    found = [h for h in bundle.reader.function_headers if h.offset <= edit["offset"] < h.offset + h.bytecodeSizeInBytes]
    check(len(found) == 1, "one function carries the mature warning edit")
    header = found[0]
    code = list(bundle.code(header, bundle.stock).values())
    check([i.inst.name for i in code] == ["LoadParam", "GetById", "Ret"] and bundle.strings[code[1].arg4] == "isOver18",
          "it is the selector state => state.isOver18")
    on, off = bundle.state({key: "true"}), bundle.state({key: "false"})
    for stored in (False, True):
        state = {"isOver18": stored}
        check(returns(bundle, header, off, params=(state,)) is stored, f"off: the selector returns the stored {stored}")
        check(returns(bundle, header, on, params=(state,)) is True, f"on: the selector returns true over a stored {stored}")


def lurk_menu(bundle):
    """Lurk in account menu: the developer settings row of AccountScreen, from its role check to the element."""
    key = "lurk_menu_entry"
    header = bundle.named("AccountScreen")
    stock = bundle.code(header, bundle.stock)
    order = sorted(stock)
    rows = []
    for position in order:
        i = stock[position]
        if i.inst.name not in ("NewObjectWithBuffer", "NewObjectWithBufferLong"):
            continue
        keys = [k.strip("'\"") for k in bundle.reader.object_shape_keys[i.arg2]]
        if keys != ["href", "icon", "label", "testID", "gaEvent"]:
            continue
        values = bundle.stock[bundle.literal_start + i.arg3:bundle.literal_start + len(bundle.reader.literal_values)]
        if bundle.literal(unpack_slp_array(values, 5, 99).to_strings(bundle.strings)[0]) == "/dev-settings":
            rows.append(position)
    check(len(rows) == 1, "one developer settings row in AccountScreen")
    index = order.index(rows[0])
    guards = [p for p in order[max(0, index - 12):index] if stock[p].inst.name == "JmpFalse"]
    check(len(guards) == 1, "one role check before the row")
    guard = stock[guards[0]]
    tested, skip = guard.arg2, guard.original_pos + guard.arg1
    translate = next(stock[p] for p in order[index:index + 4] if stock[p].inst.name == "Call2")

    def jsx(this, kind, props):
        return {"type": kind, "props": props}

    class Module(dict):
        def get(self, name, default=None):
            return jsx if name in ("jsx", "jsxs") else name

    class Environment:
        def __getitem__(self, slot):
            return Module()

    for value in ("true", "false"):
        data = bundle.state({key: value})
        edited = Bundle(data, data, bundle.manifest)
        registers = {n: Environment() for n in range(256)}
        registers[translate.arg2] = lambda this, message: "t:" + message
        registers[tested] = False  # An account without staff roles.
        _, r = edited.run(edited.named("AccountScreen"), data, registers=registers, start=guard.original_pos,
                          stop={skip})
        element = r[tested]
        if value == "false":
            check(element is False, "off: no row for an account without staff roles, as in stock")
            continue
        row = element["props"]["children"]
        props = row["props"]
        check(element["type"] == "Fragment" and row["type"] == "AccountMenuItem", "on: an AccountMenuItem is drawn")
        check(props["label"] == "Lurk" and props["testID"] == "Lurk", "on: labelled Lurk, not translated")
        check(props["href"] == "lurk://settings" and EXTERNAL_LINK.match(props["href"]) is not None,
              "on: its href is lurk://settings, an external link for expo-router (Linking.openURL)")


# expo-router's hasUrlProtocolPrefix, which shouldLinkExternally checks first.
EXTERNAL_LINK = re.compile(r"^([\w\d_+.-]+:)?//")


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("stock", type=Path)
    parser.add_argument("patched", type=Path)
    parser.add_argument("manifest", nargs="?", type=Path)
    args = parser.parse_args()
    if is_zipfile(args.patched):
        with ZipFile(args.patched) as apk:
            embedded = apk.read("assets/index.android.bundle")
            manifest = json.loads(apk.read("assets/lurk-hermes.json"))
    else:
        embedded = args.patched.read_bytes()
        manifest = json.loads(args.manifest.read_text())
    stock = args.stock.read_bytes()
    structural(stock, embedded, manifest)
    bundle = Bundle(stock, embedded, manifest)
    keys = bundle.keys()
    covered = []
    if "hide_clips" in keys:
        hide_clips(bundle)
        covered.append("Hide Clips")
    if "hide_subscription_upsells" in keys:
        hide_upsells(bundle)
        covered.append("Hide subscription upsells")
    for key, names, what in (
        ("hide_kicks", ["KicksShopButton", "GetKicksButton", "LeaderboardKicksFooter"], "Hide KICKs tipping"),
        ("hide_home_featured", ["FeaturedStreamsRow"], "Hide Home sections"),
        ("hide_home_recommended", ["RecommendedStreamsRow"], "Hide Home sections"),
        ("hide_home_categories", ["CategoriesRow"], "Hide Home sections"),
        ("block_update_prompts", ["AppUpdateHandler"], "Block update prompts"),
    ):
        if key in keys:
            entry_returns_null(bundle, key, names)
            covered.append(what)
    if "amoled_black" in keys:
        amoled(bundle)
        covered.append("AMOLED black")
    if "hide_mature_warning" in keys:
        mature(bundle)
        covered.append("Hide mature-content warning")
    if "lurk_menu_entry" in keys:
        lurk_menu(bundle)
        covered.append("Lurk in account menu")
    assert covered, "the APK has none of the Interface patches this checks"
    print("PASS: executed " + ", ".join(dict.fromkeys(covered)))


if __name__ == "__main__":
    try:
        main()
    except AssertionError as e:
        sys.exit(f"FAIL: {e}")
