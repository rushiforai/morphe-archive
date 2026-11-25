"""Independent full-method comparison for decoded Android TV patch outputs."""
from pathlib import Path
import re


def graph(body):
    labels, rows, annotations, payload = {}, [], 0, None
    keep = ('.locals ', '.registers ', '.catch ', '.catchall ', '.packed-switch ',
            '.sparse-switch', '.array-data ', '.end packed-switch', '.end sparse-switch', '.end array-data')
    for raw in body.splitlines():
        line = raw.strip()
        if line.startswith('.annotation'):
            annotations += 1
        if line.startswith('.end annotation'):
            annotations -= 1
            continue
        if annotations or not line or line.startswith('#'):
            continue
        if line.startswith('.') and not line.startswith(keep):
            continue
        line = line.split('    #')[0].replace('const-string/jumbo ', 'const-string ')
        if payload:
            rows.append(line)
            if line == '.end ' + payload:
                payload = None
        elif line.startswith(':'):
            labels[line] = len(rows)
        else:
            rows.append(line)
            if line.startswith('.packed-switch '):
                payload = 'packed-switch'
            elif line == '.sparse-switch':
                payload = 'sparse-switch'
            elif line.startswith('.array-data '):
                payload = 'array-data'
    def normalize(line):
        parts = re.split(r'("(?:\\.|[^"\\])*")', line)
        return ''.join(p if i % 2 else re.sub(r':[a-zA-Z0-9_]+',
            lambda m: '@' + str(labels[m[0]]) if m[0] in labels else m[0], p)
            for i, p in enumerate(parts))
    return alignment([normalize(row) for row in rows])


def alignment(rows):
    # DEX payloads require even code-unit alignment. A prefix can add/remove the
    # single unreachable padding NOP immediately preceding a payload.
    result = list(rows)
    for index in range(len(result) - 2, -1, -1):
        if result[index] != 'nop' or not result[index + 1].startswith(('.packed-switch', '.sparse-switch', '.array-data')):
            continue
        del result[index]
        adjusted = []
        for line in result:
            parts = re.split(r'("(?:\\.|[^"\\])*")', line)
            adjusted.append(''.join(p if i % 2 else re.sub(r'@(\d+)',
                lambda m: '@' + str(int(m[1]) - (int(m[1]) > index)), p) for i, p in enumerate(parts)))
        result = adjusted
    return result


def methods(root):
    result = {}
    for path in classes(root).values():
        result.update(class_methods(path))
    return result


def classes(root):
    result = {}
    for path in Path(root).glob('smali*/**/*.smali'):
        if path.name.startswith('._'):
            continue
        with path.open() as stream:
            owner = re.search(r'^\.class[^\n]* (L[^;]+;)', stream.readline())[1]
        assert owner not in result, 'Duplicate class: ' + owner
        result[owner] = path
    return result


def class_methods(path):
    text = Path(path).read_text()
    owner = re.search(r'^\.class[^\n]* (L[^;]+;)', text, re.M)[1]
    result = {}
    for match in re.finditer(r'^\.method[^\n]* (\S+)\n(.*?)^\.end method', text, re.M | re.S):
        key = owner + '->' + match[1]
        assert key not in result, 'Duplicate declaration: ' + key
        result[key] = graph(match[2])
    return result


def instructions(rows):
    return [row for row in rows if re.match(r'^[a-z][a-z0-9/-]*(?:\s|$)', row)]


def without_prefix(rows, count):
    assert rows[0].startswith(('.locals ', '.registers '))
    remainder = rows[:1] + rows[1 + count:]
    def rebase(line):
        parts = re.split(r'("(?:\\.|[^"\\])*")', line)
        return ''.join(p if i % 2 else re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) - count), p)
                       for i, p in enumerate(parts))
    return [rebase(row) for row in remainder]
