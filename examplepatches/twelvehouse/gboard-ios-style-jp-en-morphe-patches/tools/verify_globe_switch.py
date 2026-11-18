"""Check that the globe key switches keyboards right after typing on the English keyboard.

Open a text field with the English keyboard shown and a second language enabled. Each trial taps
the letter keys and the globe key in one adb command, checks that the keyboard changed, then
taps the globe key again to come back to English. Key centers depend on the device, e.g.:
python -I tools/verify_globe_switch.py --letters 58,1715 165,1715 272,1715 --globe 70,2180
"""

import argparse
import re
import subprocess
import time


def point(value):
    if not re.fullmatch(r"\d+,\d+", value):
        raise argparse.ArgumentTypeError("Expected x,y coordinates")
    return value.replace(",", " ")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--adb", default="adb")
    parser.add_argument("--letters", type=point, nargs="+", required=True)
    parser.add_argument("--globe", type=point, required=True)
    parser.add_argument("--trials", type=int, default=5)
    args = parser.parse_args()

    def shell(command):
        return subprocess.run([args.adb, "shell", command], check=True,
                              capture_output=True, encoding="utf-8").stdout

    def keyboard():
        match = re.search(r"currentInputBundle id:\s*(\S+)", shell("dumpsys input_method"))
        if not match:
            raise RuntimeError("Gboard is not the current keyboard")
        return match.group(1)

    english = keyboard()
    switched = 0
    for trial in range(1, args.trials + 1):
        shell("; ".join(f"input tap {key}" for key in [*args.letters, args.globe]))
        time.sleep(0.8)
        after = keyboard()
        print(f"trial {trial}: {after}")
        if after != english:
            switched += 1
            shell(f"input tap {args.globe}")
        time.sleep(2)
        if keyboard() != english:
            raise RuntimeError("Could not return to the English keyboard")
    print(f"switched {switched}/{args.trials}")
    raise SystemExit(switched != args.trials)


if __name__ == "__main__":
    main()
