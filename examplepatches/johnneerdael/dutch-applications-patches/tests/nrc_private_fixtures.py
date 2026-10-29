"""Validate private original premium bodies and emit prose-free DOM equivalents."""
from html.parser import HTMLParser
from html import escape
import hashlib
import json
import os
from pathlib import Path

SUMMARY = [
 # Exact counts/order digests are pinned from anonymous original appview HTML.
 # The final substantive paragraph hashes predate patch implementation.
 {'id':'a4939599','order_sha256':'e9d85d5fb04c04c8026f4ff0bdac551e40b65d1e6867d42ff52fd594e319a7e7','paragraphs':17,'final_words':61,'final_sha256':'dc5b33e740faba555749c4475a7f4ea2c3edaa27ef30cd5739f32c2b9e2d02d0'},
 {'id':'a4939839','order_sha256':'9107cc3acc701834169b3202a8aa2895d092859ba73c06b469ce6e54798dcca7','paragraphs':15,'final_words':67,'final_sha256':'9203782a123222d1688356341da1e35295b31ca0d8c992e98ef0de9272c8f6e3'},
 {'id':'a4939576','order_sha256':'c989485103fd07a652f937b2177b8438ac7809221d5cbbf47bc1f84113ace02f','paragraphs':11,'final_words':54,'final_sha256':'9880e3d795af7c666880a26e5eb1eefc662ed83c4ad018d04604f8665f9b6fbd'},
]
FOOTER = '097ab740c1a12c97674d460145c3f31640f8d000e20896628370292f601ab2db'
VOID={'area','base','br','col','embed','hr','img','input','link','meta','param','source','track','wbr'}


def sha(value):return hashlib.sha256(value.encode()).hexdigest()


class BodyParser(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True);self.stack=[];self.active=False;self.root_depth=0;self.tokens=[];self.paragraphs=[];self.current=None;self.premium=False;self.json=False;self.json_parts=[]
    def handle_starttag(self,tag,attrs):
        values=dict(attrs)
        if tag=='script' and values.get('type')=='application/ld+json':self.json=True;self.json_parts=[]
        if not self.active and {'vorm__article-content','googlebot-article-content'}<=set(values.get('class','').split()):self.active=True;self.root_depth=len(self.stack)
        if self.active:
            safe={k:v for k,v in attrs if k=='class' or k in {'data-banner-position','data-page-type'}}
            if tag=='p':self.current=[];safe['data-original-paragraph']=str(len(self.paragraphs));self.paragraphs.append(self.current)
            self.tokens.append('<'+tag+''.join(' '+k+'="'+escape(v or '',quote=True)+'"' for k,v in safe.items())+'>')
        if tag not in VOID:self.stack.append(tag)
    def handle_endtag(self,tag):
        if tag=='script' and self.json:
            self.json=False
            try:
                data=json.loads(''.join(self.json_parts))
                self.premium=self.premium or '"isAccessibleForFree": false' in json.dumps(data)
            except json.JSONDecodeError:pass
        if self.active:
            self.tokens.append('</'+tag+'>')
            if tag=='p':self.current=None
        if tag in self.stack:
            while self.stack:
                found=self.stack.pop()
                if found==tag:break
        if self.active and len(self.stack)==self.root_depth:self.active=False
    def handle_data(self,data):
        if self.json:self.json_parts.append(data)
        if self.active and self.current is not None:self.current.append(data)
        # Original prose never enters the sanitized HTML. Preserve text-node
        # positions with a fixed placeholder; hash original paragraphs separately.
        if self.active and data.strip():self.tokens.append('text')


def fixtures():
    explicit=os.environ.get('NRC_PRIVATE_FIXTURES')
    root=Path(explicit) if explicit else Path(os.environ.get('TMPDIR','/tmp'))/'re/expanded-nrc'
    if not all((root/f'article-{i}-appview').is_file() for i in range(3)):
        assert os.environ.get('NRC_REQUIRE_PRIVATE')!='1','NRC private bodies required; set NRC_PRIVATE_FIXTURES'
        print('SKIP NRC private premium-body fixtures: set NRC_PRIVATE_FIXTURES');return []
    result=[]
    for i,expected in enumerate(SUMMARY):
        parser=BodyParser();raw=(root/f'article-{i}-appview').read_text();parser.feed(raw)
        paragraphs=[' '.join(''.join(parts).split()) for parts in parser.paragraphs]
        hashes=[sha(value) for value in paragraphs]
        assert parser.premium and expected['id'] in raw,'Genuine restricted premium fixture '+expected['id']
        assert len(paragraphs)==expected['paragraphs'],(expected['id'],len(paragraphs))
        assert hashes[-1]==FOOTER and len(paragraphs[-2].split())==expected['final_words'] and hashes[-2]==expected['final_sha256'],'Final supplied substantive paragraph '+expected['id']
        order=sha(json.dumps(hashes,separators=(',',':')))
        if 'order_sha256' in expected:assert order==expected['order_sha256'],'Complete paragraph order '+expected['id']
        # Convert only the synthetic paragraph identifiers to their independent
        # original hash tags; the browser asserts their order/object identity.
        body=''.join(parser.tokens)
        for n,digest in enumerate(hashes):body=body.replace('data-original-paragraph="'+str(n)+'"','data-original-paragraph="'+str(n)+'" data-original-sha256="'+digest+'"')
        result.append(dict(id=expected['id'],html=body,hashes=hashes,order=order,final=expected['final_sha256']))
    return result


if __name__=='__main__':
    for row in fixtures():print(json.dumps({k:v for k,v in row.items() if k not in {'html','hashes'}}))
