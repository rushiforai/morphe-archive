package defpackage;

import com.medium.android.core.models.HighlightType;
import com.medium.android.domain.post.models.Highlight;
import com.medium.android.domain.post.models.Markup;
import com.medium.android.graphql.fragment.HighlightData;
import com.medium.android.graphql.fragment.HighlightDataWithGroup;
import com.medium.android.graphql.fragment.HighlightGroupData;
import com.medium.android.graphql.fragment.HighlightsData;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class el5 {
    public static final Highlight a(HighlightData highlightData) {
        Integer startOffset;
        String text;
        highlightData.getClass();
        HighlightData.Post post = highlightData.getPost();
        if (post != null && (startOffset = highlightData.getStartOffset()) != null) {
            int iIntValue = startOffset.intValue();
            Integer endOffset = highlightData.getEndOffset();
            if (endOffset != null) {
                int iIntValue2 = endOffset.intValue();
                HighlightData.Paragraph paragraph = (HighlightData.Paragraph) bu1.z0(highlightData.getParagraphs());
                if (paragraph != null && (text = paragraph.getText()) != null && iIntValue >= 0 && iIntValue2 >= 0 && iIntValue <= iIntValue2 && iIntValue <= text.length() && iIntValue2 <= text.length()) {
                    String id = highlightData.getId();
                    String name = paragraph.getName();
                    if (name == null) {
                        return null;
                    }
                    List<HighlightData.Markup> markups = paragraph.getMarkups();
                    ArrayList arrayList = new ArrayList();
                    Iterator<T> it2 = markups.iterator();
                    while (it2.hasNext()) {
                        Markup markupO = bgf.O(((HighlightData.Markup) it2.next()).getMarkupData());
                        if (markupO != null) {
                            arrayList.add(markupO);
                        }
                    }
                    az5 az5VarF0 = bo.f0(arrayList);
                    String userId = highlightData.getUserId();
                    if (userId == null) {
                        return null;
                    }
                    HighlightData.User user = highlightData.getUser();
                    return new Highlight(id, post.getId(), null, null, iIntValue, iIntValue2, name, text, az5VarF0, userId, user != null ? user.getName() : null, HighlightType.STANDARD);
                }
            }
        }
        return null;
    }

    public static final Highlight b(HighlightDataWithGroup highlightDataWithGroup) {
        HighlightGroupData highlightGroupData;
        highlightDataWithGroup.getClass();
        HighlightDataWithGroup.HighlightGroup highlightGroup = highlightDataWithGroup.getHighlightGroup();
        if (highlightGroup == null || (highlightGroupData = highlightGroup.getHighlightGroupData()) == null || highlightGroupData.getResponseCount() <= 0) {
            highlightGroupData = null;
        }
        if (highlightGroupData == null) {
            return a(highlightDataWithGroup.getHighlightData());
        }
        Highlight highlightA = a(highlightDataWithGroup.getHighlightData());
        if (highlightA != null) {
            return Highlight.copy$default(highlightA, null, null, highlightGroupData.getId(), Integer.valueOf(highlightGroupData.getResponseCount()), 0, 0, null, null, null, null, null, HighlightType.RESPONSE, 2035, null);
        }
        return null;
    }

    public static final ArrayList c(List list) {
        ArrayList arrayList = new ArrayList();
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            HighlightData highlightData = ((HighlightsData.Highlight) it2.next()).getHighlightDataWithGroup().getHighlightData();
            Integer startOffset = highlightData.getStartOffset();
            String str = null;
            if (startOffset != null) {
                int iIntValue = startOffset.intValue();
                Integer endOffset = highlightData.getEndOffset();
                if (endOffset != null) {
                    int iIntValue2 = endOffset.intValue();
                    StringBuilder sb = new StringBuilder();
                    int i = 0;
                    for (Object obj : highlightData.getParagraphs()) {
                        int i2 = i + 1;
                        if (i < 0) {
                            d46.i0();
                            throw null;
                        }
                        String text = ((HighlightData.Paragraph) obj).getText();
                        if (text != null) {
                            if (iIntValue <= text.length()) {
                                if (iIntValue2 > text.length()) {
                                    text = text.substring(iIntValue, text.length());
                                } else if (iIntValue <= iIntValue2) {
                                    if (i == 0 && highlightData.getParagraphs().size() == 1) {
                                        text = text.substring(iIntValue, iIntValue2);
                                    } else if (i == 0) {
                                        text = text.substring(iIntValue, text.length());
                                    } else if (i == highlightData.getParagraphs().size() - 1) {
                                        text = text.substring(0, iIntValue2);
                                    }
                                }
                            }
                            sb.append(text);
                        }
                        i = i2;
                    }
                    String string = sb.toString();
                    if (!muc.b0(string)) {
                        str = string;
                    }
                }
            }
            if (str != null) {
                arrayList.add(str);
            }
        }
        return arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x00bb  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.util.ArrayList d(com.medium.android.graphql.fragment.TopHighlightResponseGroupsData r16) {
        /*
            java.util.List r0 = r16.getTopHighlightResponseGroups()
            java.util.ArrayList r1 = new java.util.ArrayList
            r1.<init>()
            java.util.Iterator r0 = r0.iterator()
        Ld:
            boolean r2 = r0.hasNext()
            if (r2 == 0) goto L28
            java.lang.Object r2 = r0.next()
            r3 = r2
            com.medium.android.graphql.fragment.TopHighlightResponseGroupsData$TopHighlightResponseGroup r3 = (com.medium.android.graphql.fragment.TopHighlightResponseGroupsData.TopHighlightResponseGroup) r3
            com.medium.android.graphql.fragment.HighlightGroupData r3 = r3.getHighlightGroupData()
            int r3 = r3.getResponseCount()
            if (r3 <= 0) goto Ld
            r1.add(r2)
            goto Ld
        L28:
            java.util.ArrayList r0 = new java.util.ArrayList
            r0.<init>()
            java.util.Iterator r1 = r1.iterator()
        L31:
            boolean r2 = r1.hasNext()
            if (r2 == 0) goto Lc3
            java.lang.Object r2 = r1.next()
            com.medium.android.graphql.fragment.TopHighlightResponseGroupsData$TopHighlightResponseGroup r2 = (com.medium.android.graphql.fragment.TopHighlightResponseGroupsData.TopHighlightResponseGroup) r2
            com.medium.android.graphql.fragment.HighlightGroupData r2 = r2.getHighlightGroupData()
            java.lang.String r4 = r2.getId()
            java.lang.String r6 = r2.getId()
            java.lang.Integer r3 = r2.getStartOffset()
            r5 = 0
            if (r3 == 0) goto Lbb
            int r8 = r3.intValue()
            java.lang.Integer r3 = r2.getEndOffset()
            if (r3 == 0) goto Lbb
            int r9 = r3.intValue()
            r3 = r5
            java.lang.String r5 = r16.getId()
            com.medium.android.graphql.fragment.HighlightGroupData$Paragraph r7 = r2.getParagraph()
            java.lang.String r10 = r7.getName()
            if (r10 != 0) goto L6f
        L6d:
            r5 = r3
            goto Lbc
        L6f:
            com.medium.android.graphql.fragment.HighlightGroupData$Paragraph r7 = r2.getParagraph()
            java.lang.String r11 = r7.getText()
            if (r11 != 0) goto L7a
            goto L6d
        L7a:
            com.medium.android.graphql.fragment.HighlightGroupData$Paragraph r3 = r2.getParagraph()
            java.util.List r3 = r3.getMarkups()
            java.util.ArrayList r7 = new java.util.ArrayList
            r7.<init>()
            java.util.Iterator r3 = r3.iterator()
        L8b:
            boolean r12 = r3.hasNext()
            if (r12 == 0) goto La5
            java.lang.Object r12 = r3.next()
            com.medium.android.graphql.fragment.HighlightGroupData$Markup r12 = (com.medium.android.graphql.fragment.HighlightGroupData.Markup) r12
            com.medium.android.graphql.fragment.MarkupData r12 = r12.getMarkupData()
            com.medium.android.domain.post.models.Markup r12 = defpackage.bgf.O(r12)
            if (r12 == 0) goto L8b
            r7.add(r12)
            goto L8b
        La5:
            az5 r12 = defpackage.bo.f0(r7)
            int r2 = r2.getResponseCount()
            com.medium.android.core.models.HighlightType r15 = com.medium.android.core.models.HighlightType.RESPONSE
            com.medium.android.domain.post.models.Highlight r3 = new com.medium.android.domain.post.models.Highlight
            java.lang.Integer r7 = java.lang.Integer.valueOf(r2)
            r13 = 0
            r14 = 0
            r3.<init>(r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15)
            goto L6d
        Lbb:
            r3 = r5
        Lbc:
            if (r5 == 0) goto L31
            r0.add(r5)
            goto L31
        Lc3:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.el5.d(com.medium.android.graphql.fragment.TopHighlightResponseGroupsData):java.util.ArrayList");
    }
}
