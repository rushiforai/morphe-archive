import os

p = os.path.join('temp_smali', 'smali', 'com', 'akshaykadam', 'pixelboard', 'extension', 'R$string.smali')
print('Path exists:', os.path.exists(p))
if os.path.exists(p):
    print('Size:', os.path.getsize(p))
    with open(p, 'r', encoding='utf-8') as f:
        fields = [l.strip() for l in f if '.field public static' in l]
    print(f'Total fields in R$string.smali: {len(fields)}')
    print('First 5 fields:', fields[:5])
