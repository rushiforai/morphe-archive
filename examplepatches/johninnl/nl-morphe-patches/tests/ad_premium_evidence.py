"""Private genuine premium payload checks; only count/order/content hashes are tracked."""
import hashlib
import html
import json
import re
from ad_contracts import MODEL
from ad_emitted import evaluate, obj

EVIDENCE = {
    'ca43152': (48,20,'a324b1bef95d721ded21307a93694539665c398724ee717605bbec4716feed45','bc0569f682b3d240fe6cec468df2542327f876e4bfd412d4192da63cec0ae437',19,28,'a27710a8aa4bf88bda5d212f87034986d0b13af56017b1b340c7cd11a846609a'),
    'd8d624f': (33,9,'8db4a6a4e53109ce43158522df61f1a0735d3232e667d914fee9e87e97005f7d','24b71ad8e2159392de1dfed4c1773af817e8de84ec53f60372593f222fa5b979',5,79,'fe454eeb64ff21eb1e7f2f5993acdac3da1c52e0734ceb3d06d7cc4483b5eeca'),
}


def sha(value):return hashlib.sha256(value.encode()).hexdigest()

def verify_private_premium(root, fixture_root, ads, premium):
    # The object graph retains the real immutable payload objects. No copied
    # prose or substitute paragraph can satisfy the identity assertions.
    def mapped(raw):
        kind=raw['type'];p=raw.get('properties',{})
        name={'ADVERTISEMENT':'Advertisement','PREMIUM_LABEL':'PremiumLabelComponent','PREMIUM_INDICATOR':'PremiumIndicatorComponent'}.get(kind,''.join(w.title() for w in kind.split('_'))+'Component')
        fields={'raw':raw}
        if kind=='GROUP':fields['d']=obj(MODEL+'GroupComponent$Properties',a=filtered([mapped(c) for c in p['content']]))
        elif kind=='VIDEO_NEWS':fields['d']=obj(MODEL+'VideoNewsComponent$Properties',a=filtered([mapped(c) for c in p['teasers']]))
        elif kind=='MEDIA_TOP':fields['d']=obj(MODEL+'MediaTopComponent$Properties',a=mapped(p['media']),b=mapped(p['caption']) if isinstance(p.get('caption'),dict) else None)
        elif kind=='URL_TEASER':fields['d']=obj(MODEL+'UrlTeaserComponent$Properties',h=bool(p.get('advertorial',False)))
        return obj(MODEL+name,**fields)
    def filtered(values):
        return evaluate(root,'morpheFilter(Ljava/util/List;)Ljava/util/List;',[values]) if ads or premium else values
    for key,(count,paragraphs,order,body,end_index,words,end_hash) in EVIDENCE.items():
        full=json.loads((fixture_root/f'article-{key}-false.json').read_text())
        reduced=json.loads((fixture_root/f'article-{key}-true.json').read_text())
        assert full['metadata']['premium'] is True and reduced['metadata']['premium'] is True, 'Genuine premium metadata required'
        original=full['components'];original_json=json.dumps(original,sort_keys=True,separators=(',',':'),ensure_ascii=False)
        assert len(original)==count and sha(original_json)==body, 'Private complete publisher fixture integrity'
        assert sha(json.dumps([c['type'] for c in original],separators=(',',':')))==order, 'Private original complete component order'
        assert not any(c['type']=='PARAGRAPH' for c in reduced['components']), 'The reduced response must actually omit the premium body'
        prose=[c for c in original if c['type']=='PARAGRAPH'];assert len(prose)==paragraphs
        final=html.unescape(re.sub('<[^>]+>','',prose[end_index]['properties']['content']))
        assert len(final.split())==words and sha(final)==end_hash, 'Independently pinned substantive final paragraph'
        values=[mapped(c) for c in original];actual=filtered(values)
        removed=({'ADVERTISEMENT'} if ads else set()) | ({'PREMIUM_LABEL','PREMIUM_INDICATOR','MARKETING'} if premium else set())
        expected=[c for c in original if c['type'] not in removed]
        actual_raw=[v['raw'] for v in actual]
        assert len(actual_raw)==len(expected) and all(a is b for a,b in zip(actual_raw,expected)), 'All genuine editorial body/media/links retain identity and order'
        actual_prose=[c for c in actual_raw if c['type']=='PARAGRAPH']
        assert len(actual_prose)==paragraphs and all(a is b for a,b in zip(actual_prose,prose)), 'Never truncate or replace received paragraphs'
        assert actual_prose[end_index] is prose[end_index] and actual_prose[-1] is prose[-1], 'Retain final substantive paragraph and subsequent short editorial/link paragraphs'
        for v in actual:
            if v['raw']['type'] in {'GROUP','VIDEO_NEWS'}:
                raw_children=v['raw']['properties'].get('content',v['raw']['properties'].get('teasers'))
                actual_children=[child['raw'] for child in v['d']['a']]
                assert len(actual_children)==len(raw_children) and all(a is b for a,b in zip(actual_children,raw_children)), 'Retain genuine nested editorial children'
        assert json.dumps(original,sort_keys=True,separators=(',',':'),ensure_ascii=False)==original_json, 'Never mutate the input fixture'
