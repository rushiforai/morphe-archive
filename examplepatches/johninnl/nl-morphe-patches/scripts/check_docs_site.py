#!/usr/bin/env python3
"""Check translations and all rendered local links after the strict site build."""
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urlsplit, urljoin
import argparse

ROOT = Path(__file__).resolve().parents[1]
SITE_URL = 'https://johninnl.github.io/nl-morphe-patches/'


class Document(HTMLParser):
    def __init__(self, text):
        super().__init__(convert_charrefs=True)
        self.ids = set()
        self.links = []
        self.external_resources = []
        self.alternates = {}
        self.canonical = None
        self.feed(text)

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if 'id' in attrs:
            self.ids.add(attrs['id'])
        if tag == 'a' and 'href' in attrs:
            self.links.append(attrs['href'])
        if tag == 'link' and attrs.get('rel') == 'alternate':
            self.alternates[attrs.get('hreflang')] = attrs.get('href')
        if tag == 'link' and attrs.get('rel') == 'canonical':
            self.canonical = attrs.get('href')
        if tag in {'script', 'img', 'iframe', 'link'}:
            resource = attrs.get('src') if tag != 'link' else (attrs.get('href') if attrs.get('rel') == 'stylesheet' else None)
            if resource and urlsplit(resource).netloc:
                self.external_resources.append(resource)


def check(site):
    source = ROOT / 'docs/site'
    translated = {lang: {p.relative_to(source / lang) for p in (source / lang).rglob('*.md')} for lang in ('nl', 'en')}
    assert translated['nl'] == translated['en'], f'Missing translations: {translated["nl"] ^ translated["en"]}'
    assert not (source / 'CNAME').exists(), 'GitHub Pages must use its default domain'
    assert not (site / 'CNAME').exists(), 'Stale custom-domain CNAME in built site'
    site_url = urlsplit(SITE_URL)
    documents = {p.resolve(): Document(p.read_text()) for p in site.rglob('*.html')}
    assert all('data-md-component="source"' not in path.read_text() for path in documents), 'Background repository statistics must stay disabled'
    failures = []
    for path, doc in documents.items():
        if path.name == '404.html':
            continue
        for href in doc.links:
            page_url = urljoin(SITE_URL, path.relative_to(site).as_posix())
            url = urlsplit(urljoin(page_url, href))
            if url.scheme not in {'http', 'https'} or url.netloc != site_url.netloc:
                continue
            if not url.path.startswith(site_url.path):
                failures.append(f'{path.relative_to(site)} -> {href}: outside Pages project path')
                continue
            target = (site / unquote(url.path[len(site_url.path):])).resolve()
            if target.is_dir():
                target /= 'index.html'
            if not target.exists():
                failures.append(f'{path.relative_to(site)} -> {href}: missing file')
            elif url.fragment and target in documents and unquote(url.fragment) not in documents[target].ids:
                failures.append(f'{path.relative_to(site)} -> {href}: missing anchor')
        if doc.external_resources:
            failures.append(f'{path.relative_to(site)}: third-party resources {doc.external_resources}')
    for lang, prefix in [('nl', ''), ('en', 'en/')]:
        for path in translated[lang]:
            relative = path.with_suffix('')
            output = site / prefix / (relative.parent if relative.name == 'index' else relative) / 'index.html'
            assert output.exists(), f'Missing rendered translation: {output}'
            document = documents[output.resolve()]
            expected_canonical = urljoin(SITE_URL, output.relative_to(site).as_posix().removesuffix('index.html'))
            assert document.canonical == expected_canonical, f'Wrong canonical URL: {output}'
            alternates = document.alternates
            assert {'nl', 'en'} <= alternates.keys(), f'Missing language switch: {output}'
            for code in ('nl', 'en'):
                resolved = urlsplit(urljoin(document.canonical, alternates[code]))
                expected = site / ('en' if code == 'en' else '') / (relative.parent if relative.name == 'index' else relative) / 'index.html'
                assert resolved.scheme == site_url.scheme and resolved.netloc == site_url.netloc, f'Wrong canonical host: {output}'
                assert resolved.path.startswith(site_url.path), f'Missing Pages project path: {output}'
                assert (site / resolved.path[len(site_url.path):] / 'index.html').resolve() == expected.resolve(), f'Wrong language counterpart: {output}'
    assert not failures, '\n'.join(failures[:30])
    print(f'PASS: {len(translated["nl"])} matched page pairs; {len(documents)} rendered HTML files; local links/anchors, project-path canonicals, language alternates, no CNAME and no external page resources')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--site-dir', type=Path, default=ROOT / 'build/docs-site')
    args = parser.parse_args()
    check(args.site_dir.resolve())


if __name__ == '__main__':
    main()
