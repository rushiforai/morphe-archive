package io.branch.search.internal;

import android.content.Context;
import io.branch.search.internal.X1;
import io.branch.search.ui.BranchEntity;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.wf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3441wf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f66250a;

    public C3441wf(@NotNull F4 contextDelegate) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        this.f66250a = contextDelegate;
    }

    public final boolean a(@NotNull BranchEntity entity) {
        Intrinsics.g(entity, "entity");
        if (entity instanceof BranchEntity.App) {
            return a(entity, X1.a.f63610a);
        }
        if (entity instanceof BranchEntity.Shortcut) {
            return a(entity, X1.h.f63620a);
        }
        if (entity instanceof BranchEntity.HeroAd) {
            return a(entity, X1.d.f63616a);
        }
        if (entity instanceof BranchEntity.SuggestedInstalls) {
            return a(entity, X1.i.f63621a);
        }
        if (entity instanceof BranchEntity.Contact) {
            return a(entity, X1.c.f63615a);
        }
        if (entity instanceof BranchEntity.AppStore) {
            BranchEntity.AppStore appStore = (BranchEntity.AppStore) entity;
            return a(entity, new X1.b(appStore.f66402f, appStore.f66403g, appStore.f66404h, appStore.f66405i));
        }
        if (entity instanceof BranchEntity.HeroV2) {
            return a(entity, X1.d.f63616a);
        }
        if (entity instanceof BranchEntity.RelatedApp) {
            return a(entity, X1.e.f63617a);
        }
        if (entity instanceof BranchEntity.RichContent) {
            return a(entity, X1.f.f63618a);
        }
        if (entity instanceof BranchEntity.SearchMore) {
            return a(entity, X1.g.f63619a);
        }
        if (entity instanceof BranchEntity.AutoSuggestion) {
            return true;
        }
        throw new NoWhenBranchMatchedException();
    }

    public final boolean a(BranchEntity branchEntity, X1 entityType) {
        InterfaceC3331q6 f66462a = branchEntity.getF66462a();
        Context context = this.f66250a.f62438a;
        Intrinsics.g(f66462a, "<this>");
        Intrinsics.g(context, "context");
        Intrinsics.g(entityType, "entityType");
        return f66462a.a(context, entityType);
    }
}
