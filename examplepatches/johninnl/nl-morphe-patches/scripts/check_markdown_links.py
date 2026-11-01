#!/usr/bin/env python3
"""Check Markdown file links against the fresh repository snapshot."""
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urlsplit
import subprocess

import markdown

ROOT = Path(__file__).resolve().parents[1]
REPOSITORY = '/johninnl/nl-morphe-patches/'


class Document(HTMLParser):
    def __init__(self, path):
        super().__init__(convert_charrefs=True)
        self.links = []
        self.ids = set()
        self.feed(markdown.markdown(path.read_text(), extensions=[
            'toc', 'attr_list', 'md_in_html', 'tables', 'pymdownx.superfences']))

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if 'id' in attrs:
            self.ids.add(attrs['id'])
        if tag == 'a' and 'href' in attrs:
            self.links.append(attrs['href'])
        if tag in {'img', 'script'} and 'src' in attrs:
            self.links.append(attrs['src'])


def main():
    # Validate this checkout's publishable files, excluding local APK research
    # and nested comparison checkouts according to the repository's gitignore.
    names = subprocess.check_output(
        ['git', 'ls-files', '--cached', '--others', '--exclude-standard', '-z'], cwd=ROOT).decode().split('\0')
    paths = sorted(ROOT / name for name in names if name.endswith('.md') and (ROOT / name).is_file())
    documents = {path.resolve(): Document(path) for path in paths}
    failures = []
    checked = 0
    for path, document in documents.items():
        for href in document.links:
            url = urlsplit(href)
            if url.netloc == 'github.com' and url.path.startswith(REPOSITORY):
                parts = url.path[len(REPOSITORY):].split('/', 2)
                if parts[0] not in {'blob', 'tree'}:
                    continue
                if len(parts) != 3 or parts[1] != 'main':
                    failures.append(f'{path.relative_to(ROOT)} -> {href}: unavailable historical ref')
                    continue
                target = ROOT / unquote(parts[2])
            elif not url.scheme and not url.netloc:
                target = path.parent / unquote(url.path) if url.path else path
            else:
                continue
            checked += 1
            target = target.resolve()
            if not target.exists():
                failures.append(f'{path.relative_to(ROOT)} -> {href}: missing file')
            elif url.fragment and target in documents and unquote(url.fragment) not in documents[target].ids:
                failures.append(f'{path.relative_to(ROOT)} -> {href}: missing anchor')
    if failures:
        raise SystemExit('\n'.join(failures))
    print(f'PASS: {len(documents)} Markdown files; {checked} file and anchor links; repository targets use main')


if __name__ == '__main__':
    main()
