#!/usr/bin/env python3
"""Verify the aggregate ref retains every exact Finamp selection source."""
import argparse
import json
from pathlib import Path
import subprocess


def git(repo, *args):
    return subprocess.check_output(['git', '-C', str(repo), *args], text=True).strip()


def verify(repo, matrix, source_diff=None):
    review = matrix['asyncvalue_review']
    ref = 'refs/heads/' + review['source_ref']
    aggregate = git(repo, 'rev-parse', ref + '^{commit}')
    if aggregate != review['source_ref_commit']:
        raise ValueError('Aggregate source ref does not match its immutable pin')
    masks = matrix['masks']
    if set(masks) != {str(mask) for mask in range(128)}:
        raise ValueError('Source matrix must contain exactly 128 selections')
    parents = git(repo, 'show', '-s', '--format=%P', aggregate).split()
    expected = [masks[str(mask)]['commit'] for mask in range(128)]
    if parents != expected or len(set(parents)) != 128:
        raise ValueError('Aggregate ref must retain every selection exactly once in mask order')
    for mask in range(128):
        entry = masks[str(mask)]
        if entry['branch'] != review['source_ref']:
            raise ValueError(f'Unexpected source ref for mask {mask}')
        if git(repo, 'rev-parse', entry['commit'] + '^{tree}') != entry['tree']:
            raise ValueError(f'Source tree mismatch for mask {mask}')
        if mask & 4 and source_diff is not None:
            actual = git(repo, 'diff', '--binary', entry['commit'] + '^', entry['commit'])
            if actual != source_diff:
                raise ValueError(f'AsyncValue source diff mismatch for mask {mask}')
    return {'source_ref': review['source_ref'], 'source_ref_commit': aggregate,
            'verified_masks': len(parents), 'verified_diffs': 64 if source_diff is not None else 0}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo', type=Path, required=True)
    parser.add_argument('--source-matrix', type=Path, required=True)
    parser.add_argument('--source-diff', type=Path,
                        help='Verify the exact AsyncValue diff on every Artist selection')
    args = parser.parse_args()
    source_diff = args.source_diff.read_text().strip() if args.source_diff else None
    print(json.dumps(verify(args.repo, json.loads(args.source_matrix.read_text()), source_diff)))


if __name__ == '__main__':
    main()
