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
    expected_masks = 256 if 'notes_review' in matrix else 128
    if set(masks) != {str(mask) for mask in range(expected_masks)}:
        raise ValueError(f'Source matrix must contain exactly {expected_masks} selections')
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
    if expected_masks == 256:
        notes = matrix['notes_review']
        notes_aggregate = git(repo, 'rev-parse', 'refs/heads/' + notes['source_ref'] + '^{commit}')
        if notes_aggregate != notes['source_ref_commit']:
            raise ValueError('Notes source ref does not match its immutable pin')
        notes_parents = git(repo, 'show', '-s', '--format=%P', notes_aggregate).split()
        expected_notes = [masks[str(mask)]['commit'] for mask in range(128, 256)]
        previous = notes.get('previous_source_ref_commit')
        expected_parents = ([previous] if previous else []) + expected_notes
        if notes_parents != expected_parents or len(set(notes_parents)) != len(expected_parents):
            raise ValueError('Notes source ref must retain every new selection exactly once in mask order')
        previous_selections = git(repo, 'show', '-s', '--format=%P', previous).split() if previous else None
        if previous_selections is not None and len(previous_selections) != 128:
            raise ValueError('Previous notes ref must retain all prior selections')
        for mask in range(128, 256):
            entry = masks[str(mask)]
            if entry['branch'] != notes['source_ref']:
                raise ValueError(f'Unexpected notes source ref for mask {mask}')
            if git(repo, 'rev-parse', entry['commit'] + '^{tree}') != entry['tree']:
                raise ValueError(f'Source tree mismatch for mask {mask}')
            parent = previous_selections[mask - 128] if previous_selections else masks[str(mask - 128)]['commit']
            if git(repo, 'rev-parse', entry['commit'] + '^') != parent:
                raise ValueError(f'Wrong original selection parent for mask {mask}')
            if previous_selections and git(repo, 'rev-parse', parent + '^') != masks[str(mask - 128)]['commit']:
                raise ValueError(f'Wrong prior selection parent for mask {mask}')
    return {'source_ref': review['source_ref'], 'source_ref_commit': aggregate,
            'verified_masks': expected_masks, 'verified_diffs': 64 if source_diff is not None else 0}


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
