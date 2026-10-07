#!/usr/bin/env python3
"""Bind the comment paint once, before comment measurements, in both renderers."""
import pathlib
import re
import sys

def apply(decoded):
    for name in ("t", "u"):
        path = decoded / "smali/e/e/a" / (name + ".smali")
        source = path.read_text()
        def constructor(match):
            block = match.group(0)
            if "Le/e/a/CommentStyle;->bind" in block:
                return block
            return re.sub(r"(    iput-object [^\n]+:Landroid/graphics/Paint;\n)",
                r"\1\n    invoke-static/range {p0 .. p0}, Le/e/a/CommentStyle;->bind(Landroid/view/View;)V\n", block)
        updated = re.sub(r"\.method[^\n]* <init>\([^\n]+\n.*?\.end method", constructor, source, flags=re.S)
        assert updated.count("CommentStyle;->bind") == 2, name
        path.write_text(updated)

if __name__ == "__main__":
    apply(pathlib.Path(sys.argv[1]))
