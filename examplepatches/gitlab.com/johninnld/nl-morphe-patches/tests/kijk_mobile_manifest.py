"""Verify KIJK privacy manifest policy against original functional declarations."""
import argparse
import xml.etree.ElementTree as ET
from pathlib import Path
from npo_manifest import A, AD_PERMISSIONS, FLAGS, digest


def verify(before, after, tracking=True):
    if not tracking:
        assert digest(before) == digest(after), "Unselected KIJK manifest changed"
        return
    permissions = lambda root: {n.get(A + 'name') for n in root.findall('uses-permission')}
    assert AD_PERMISSIONS <= permissions(before), 'KIJK original ad permission inventory changed'
    assert permissions(after) == permissions(before) - AD_PERMISSIONS, 'KIJK permission policy changed'
    original, patched = before.find('application'), after.find('application')
    assert original is not None and patched is not None
    components = lambda app: {(n.tag, n.get(A + 'name')): digest(n) for n in app
                             if n.tag in {'provider', 'activity', 'activity-alias', 'service', 'receiver'}}
    assert components(original) == components(patched), 'KIJK functional components changed'
    metadata = {}
    for node in patched.findall('meta-data'):
        name = node.get(A + 'name')
        assert name not in metadata, 'Duplicate KIJK metadata: ' + str(name)
        metadata[name] = node.get(A + 'value')
    for key, value in FLAGS.items():
        assert metadata.get(key) == value, 'Missing KIJK privacy flag: ' + key
    for node in original.findall('meta-data'):
        name = node.get(A + 'name')
        if name not in FLAGS:
            matches = [n for n in patched.findall('meta-data') if n.get(A + 'name') == name]
            assert len(matches) == 1 and digest(matches[0]) == digest(node), 'Functional metadata changed: ' + name
    print('KIJK manifest policy and functional declarations passed')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--original', required=True, type=Path)
    parser.add_argument('--patched', required=True, type=Path)
    args = parser.parse_args()
    verify(ET.parse(args.original).getroot(), ET.parse(args.patched).getroot())
