"""Exercise generated filter instructions on independent DTO object graphs."""
import re
import tempfile
import unittest
from pathlib import Path
from ad_contracts import MODEL, OWNER, TYPE
from ad_emitted import evaluate, obj
from verify_ad import verify_filters


class AdFilterTests(unittest.TestCase):
    def fixture(self, ads=True, premium=True):
        # This is the generated helper instruction source; actual APK output is
        # independently exercised by verify_ad after Desktop FULL patching.
        source=(Path(__file__).parents[1]/'patches/src/main/kotlin/patches/ad/ContentFiltersPatch.kt').read_text()
        methods=[]
        for name,result,params,locals_,body in re.findall(r'helper\("(morphe\w+)", "([^"]+)", (listOf\([^\n]+?\)|emptyList\(\)), (\d+), """(.*?)"""\)',source,re.S):
            values=re.findall(r'"([^"]+)"',params)
            body=body.replace('${MODEL}','L'+MODEL).replace('$FILTER',TYPE).replace("${'$'}",'$')
            values=[s.replace('${MODEL}','L'+MODEL) for s in values]
            result=result.replace('${MODEL}','L'+MODEL)
            methods.append(f'.method public static {name}('+''.join(values)+')'+result+'\n.locals '+locals_+'\n'+body+'\n.end method')
        for name,value in [('morpheAds',ads),('morphePremium',premium)]:
            methods.append(f'.method public static {name}()Z\n.locals 1\nconst/4 v0, 0x{int(value):x}\nreturn v0\n.end method')
        self.assertGreater(len(methods),5)
        temp=tempfile.TemporaryDirectory();self.addCleanup(temp.cleanup)
        root=Path(temp.name);path=root/'smali'/(OWNER+'.smali');path.parent.mkdir(parents=True)
        path.write_text('.class public '+TYPE+'\n.super Ljava/lang/Object;\n'+'\n'.join(methods))
        return root

    def test_all_four_independent_flag_combinations(self):
        for ads,premium in [(False,False),(False,True),(True,False),(True,True)]:
            with self.subTest(ads=ads,premium=premium):verify_filters(self.fixture(ads,premium),ads,premium)

    def test_wholly_commercial_group_removed_editorial_group_identity_retained(self):
        root=self.fixture()
        paragraph=obj(MODEL+'ParagraphComponent',id='editorial end')
        empty=obj(MODEL+'GroupComponent',d=obj(MODEL+'GroupComponent$Properties',a=[]))
        mixed=obj(MODEL+'GroupComponent',d=obj(MODEL+'GroupComponent$Properties',a=[paragraph]))
        result=evaluate(root,'morpheFilter(Ljava/util/List;)Ljava/util/List;',[[empty,mixed,paragraph]])
        self.assertEqual(result,[mixed,paragraph]);self.assertIs(result[0],mixed)

    def test_mixed_feed_rows_preserve_secondary_articles_and_empty_rows_disappear(self):
        root=self.fixture()
        a=obj('com/popular/core/model/data/ArticleItem',advertorial=False,id='a')
        row=obj(MODEL+'LocalNewsTeaser',e=a,f=[],g=[])
        empty=obj(MODEL+'LocalNewsTeaser',e=None,f=[],g=[])
        self.assertIs(evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[row]),row)
        self.assertFalse(evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[empty]))

    def test_media_top_promotes_editorial_secondary_when_primary_is_ad(self):
        root=self.fixture()
        editorial=obj(MODEL+'ImageComponent',id='image')
        media=obj(MODEL+'MediaTopComponent',d=obj(MODEL+'MediaTopComponent$Properties',a=obj(MODEL+'Advertisement'),b=editorial))
        self.assertIs(evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[media]),editorial)

    def test_original_empty_media_overlay_preserves_identity(self):
        root=self.fixture(ads=False,premium=True)
        empty=obj(MODEL+'MediaOverlayComponent',c='editorial-id',d=obj(MODEL+'MediaOverlayComponent$Properties',a=None,b=None,c=None,d=None))
        self.assertIs(evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[empty]),empty)

    def test_original_null_or_empty_inline_preserves_editorial_read_more(self):
        root=self.fixture(ads=False,premium=True)
        for content in [None,obj(MODEL+'InlineArticleComponent$Content',a=[])]:
            inline=obj(MODEL+'InlineArticleComponent',c='editorial-id',d=obj(MODEL+'InlineArticleComponent$Properties',h=content,i=None,articleId='editorial-id',author='author',readMore=True))
            self.assertIs(evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[inline]),inline)

    def test_mixed_media_overlay_rebuild_preserves_editorial_child_identity(self):
        root=self.fixture()
        editorial=obj(MODEL+'ImageComponent',id='image')
        overlay=obj(MODEL+'MediaOverlayComponent',c='id',d=obj(MODEL+'MediaOverlayComponent$Properties',a=obj(MODEL+'Advertisement'),b=editorial,c=None,d=None))
        clean=evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[overlay])
        self.assertIsNone(clean['d']['a'])
        self.assertIs(clean['d']['b'],editorial)
        self.assertEqual(clean['c'],'id')

    def test_proven_commercial_only_media_overlay_removed(self):
        root=self.fixture()
        overlay=obj(MODEL+'MediaOverlayComponent',c='id',d=obj(MODEL+'MediaOverlayComponent$Properties',a=obj(MODEL+'Advertisement'),b=None,c=None,d=None))
        self.assertFalse(evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[overlay]))

    def test_premium_empty_marketing_placeholders_leave_no_reserved_row(self):
        root=self.fixture(ads=False,premium=True)
        for name in ['MarketingComponent','MarketingPositionTeaser']:
            self.assertFalse(evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[obj(MODEL+name)]))


if __name__=='__main__':unittest.main()
