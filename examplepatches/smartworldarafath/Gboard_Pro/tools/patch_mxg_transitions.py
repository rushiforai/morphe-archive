path = r'temp_decompiled\smali_classes2\mxg.smali'
with open(path, 'r', encoding='utf-8') as f:
    code = f.read()

# Replace fade animations with exact m3_slide animations
# 0x7f01004c = m3_slide_in_right
# 0x7f01004d = m3_slide_out_left
# 0x7f01004e = m3_slide_in_left
# 0x7f01004f = m3_slide_out_right

target_block = """    const p0, 0x010a0000

    iput p0, v0, Lbg;->e:I

    const p0, 0x010a0001

    iput p0, v0, Lbg;->f:I

    const p0, 0x010a0000

    iput p0, v0, Lbg;->g:I

    const p0, 0x010a0001

    iput p0, v0, Lbg;->h:I"""

replacement_block = """    const p0, 0x7f01004c

    iput p0, v0, Lbg;->e:I

    const p0, 0x7f01004d

    iput p0, v0, Lbg;->f:I

    const p0, 0x7f01004e

    iput p0, v0, Lbg;->g:I

    const p0, 0x7f01004f

    iput p0, v0, Lbg;->h:I"""

count = code.count(target_block)
if count > 0:
    code = code.replace(target_block, replacement_block)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(code)
    print(f"Patched {count} instances in mxg.smali to exact M3 slide transitions successfully!")
else:
    print("Warning: target_block not found in mxg.smali")
