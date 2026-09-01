package defpackage;

import com.medium.android.graphql.AllSuggestionsQuery;
import com.medium.android.graphql.fragment.CollectionPreviewData;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kc5 {
    public final zk2 a;
    public final r6c b;

    public kc5(zk2 zk2Var) {
        zk2Var.getClass();
        this.a = zk2Var;
        this.b = k40.x(0, 7, null);
    }

    public static ec5 a(AllSuggestionsQuery.Data data, u1d u1dVar, u1d u1dVar2, u1d u1dVar3, u1d u1dVar4) {
        List<AllSuggestionsQuery.Edge3> edges;
        AllSuggestionsQuery.MatchedContactsConnection matchedContactsConnection;
        AllSuggestionsQuery.OnMatchedContactsConnection onMatchedContactsConnection;
        int i;
        Object objInvoke;
        CollectionPreviewData collectionPreviewData;
        CreatorPreviewData creatorPreviewData;
        List<AllSuggestionsQuery.Edge> edges2 = data.getWriters().getEdges();
        ArrayList arrayList = new ArrayList();
        Iterator<T> it2 = edges2.iterator();
        int i2 = 0;
        while (true) {
            edges = null;
            objInvoke = null;
            Object objInvoke2 = null;
            edges = null;
            edges = null;
            if (!it2.hasNext()) {
                break;
            }
            AllSuggestionsQuery.OnUser onUser = ((AllSuggestionsQuery.Edge) it2.next()).getNode().getOnUser();
            if (onUser != null && (creatorPreviewData = onUser.getCreatorPreviewData()) != null) {
                objInvoke2 = u1dVar.invoke(creatorPreviewData, Integer.valueOf(i2));
                i2++;
            }
            if (objInvoke2 != null) {
                arrayList.add(objInvoke2);
            }
        }
        int size = arrayList.size();
        List<AllSuggestionsQuery.Edge1> edges3 = data.getPublications().getEdges();
        ArrayList arrayList2 = new ArrayList();
        Iterator<T> it3 = edges3.iterator();
        int i3 = size;
        while (it3.hasNext()) {
            AllSuggestionsQuery.OnCollection onCollection = ((AllSuggestionsQuery.Edge1) it3.next()).getNode().getOnCollection();
            if (onCollection == null || (collectionPreviewData = onCollection.getCollectionPreviewData()) == null) {
                i = i3;
                objInvoke = null;
            } else {
                i = i3 + 1;
                objInvoke = u1dVar2.invoke(collectionPreviewData, Integer.valueOf(i3));
            }
            if (objInvoke != null) {
                arrayList2.add(objInvoke);
            }
            i3 = i;
        }
        int size2 = arrayList2.size() + size;
        List<AllSuggestionsQuery.Edge2> edges4 = data.getRecommendedTags().getEdges();
        ArrayList arrayList3 = new ArrayList(cu1.k0(edges4, 10));
        Iterator<T> it4 = edges4.iterator();
        int i4 = size2;
        while (it4.hasNext()) {
            arrayList3.add(u1dVar3.invoke(((AllSuggestionsQuery.Edge2) it4.next()).getNode().getTagData(), Integer.valueOf(i4)));
            i4++;
        }
        List listG1 = bu1.g1(arrayList3, 10);
        int size3 = listG1.size() + size2;
        AllSuggestionsQuery.Viewer viewer = data.getViewer();
        if (viewer != null && (matchedContactsConnection = viewer.getMatchedContactsConnection()) != null && (onMatchedContactsConnection = matchedContactsConnection.getOnMatchedContactsConnection()) != null) {
            edges = onMatchedContactsConnection.getEdges();
        }
        if (edges == null) {
            edges = ey3.a;
        }
        ArrayList arrayList4 = new ArrayList(cu1.k0(edges, 10));
        Iterator<T> it5 = edges.iterator();
        while (it5.hasNext()) {
            arrayList4.add(u1dVar4.invoke(((AllSuggestionsQuery.Edge3) it5.next()).getNode().getCreatorPreviewData(), Integer.valueOf(size3)));
            size3++;
        }
        return new ec5(arrayList, arrayList2, listG1, arrayList4, false);
    }
}
