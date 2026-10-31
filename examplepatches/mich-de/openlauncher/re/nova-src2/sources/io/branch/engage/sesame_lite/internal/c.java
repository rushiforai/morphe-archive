package io.branch.engage.sesame_lite.internal;

import io.branch.engage.sesame_lite.internal.SesameLiteImpl;
import java.util.Comparator;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61781a;

    public /* synthetic */ c(int i5) {
        this.f61781a = i5;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f61781a) {
            case 0:
                return SesameLiteImpl$searchMore$searchMoreActions$1.m331invoke$lambda2((SesameLiteImpl.SearchMoreJoinedResult) obj, (SesameLiteImpl.SearchMoreJoinedResult) obj2);
            default:
                return SesameLiteImpl.m330getSuggestedLinkResults$lambda10((SesameLiteImpl.JoinedResult) obj, (SesameLiteImpl.JoinedResult) obj2);
        }
    }
}
