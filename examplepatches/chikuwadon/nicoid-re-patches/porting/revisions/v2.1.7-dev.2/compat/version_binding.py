"""Bind standard mode run history to the model's actual VERSION field.

The original v1.4.3 RecordsPane hardcodes both the Best 10 filter and its
subtitle. The standard clone previously inherited those old strings even when
the title showed v1.5.0-dev.16. The Track also embedded a stale release string
when saving runs. Use a single runtime source instead of manually maintaining
three separate version strings; do not relabel historic records.
"""
import re


def patch_standard_track(content):
    model = "Le/e/a/internal/standard150/BikeRunModel;"
    pattern = re.compile(r'(?m)^(    )const-string (v\d+|p\d+), "1\.4\.3"$')
    def bind(match):
        return (match.group(1) + "sget-object " + match.group(2) + ", "
                + model + "->VERSION:Ljava/lang/String;")
    content, count = pattern.subn(bind, content)
    # Track best initialization, onDraw rank, recordsText, saveResult Entry,
    # and saveResult best-refresh all used separate hardcoded constants.
    if count != 5:
        raise ValueError("Expected exactly 5 record-version literals in standard Track, got %d" % count)
    return content


def patch_standard_pane(content):
    model = "Le/e/a/internal/standard150/BikeRunModel;"
    # Exact active version instead of an always-v1.4.3 best-score filter.
    content, count = re.subn(
        r'(?m)^    const-string v2, "1\.4\.3"$',
        "    sget-object v2, " + model + "->VERSION:Ljava/lang/String;",
        content)
    if count != 1:
        raise ValueError("Expected one best-10 version literal; got %d" % count)

    # Subtitle: "Ranked within the same version · v" + Model.VERSION
    # Use the existing builder and v6 register without modifying other UI.
    subtitle = (
        '    const-string v6, " \\u00b7 v1.4.3"\n\n'
        '    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;'
    )
    replacement = (
        '    const-string v6, " \\u00b7 v"\n\n'
        '    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;\n\n'
        '    sget-object v6, ' + model + '->VERSION:Ljava/lang/String;\n\n'
        '    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;'
    )
    if content.count(subtitle) != 1:
        raise ValueError("Best-10 subtitle insertion site ambiguous: %d" % content.count(subtitle))
    return content.replace(subtitle, replacement, 1)
