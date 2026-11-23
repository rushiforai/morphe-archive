import os

def trace_super(cls_name):
    # cls_name like Lqpm;
    simple = cls_name.strip('L;').split('/')[-1] + '.smali'
    for s in ['smali', 'smali_classes2', 'smali_classes3', 'smali_classes4', 'smali_classes5']:
        for root, dirs, files in os.walk(os.path.join('temp_decompiled', s)):
            if simple in files:
                p = os.path.join(root, simple)
                with open(p, 'r', encoding='utf-8') as sf:
                    for line in sf:
                        if line.startswith('.class'):
                            c = line.strip()
                        elif line.startswith('.super'):
                            sup = line.strip()
                            print(f"{c} -> {sup} (in {p})")
                            return sup.split()[1]
    print(f"Could not find {cls_name}")
    return None

cur = 'Lqpm;'
while cur and not cur.startswith('Landroid/'):
    cur = trace_super(cur)
