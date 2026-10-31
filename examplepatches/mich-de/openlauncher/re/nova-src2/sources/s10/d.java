package s10;

import android.content.Context;
import android.graphics.drawable.Drawable;
import io.branch.search.ui.BranchEntity;
import io.branch.search.ui.Image;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes.dex */
public final class d extends ga.a {
    public final BranchEntity F;

    public d(BranchEntity branchEntity, ga.a aVar) {
        super(aVar);
        this.F = branchEntity;
    }

    public final Drawable R0(Context context) {
        try {
            int f66466e = this.F.getF66466e();
            int i5 = f66466e == 0 ? -1 : c.f86571a[b.c0.F(f66466e)];
            if (i5 == -1) {
                return null;
            }
            if (i5 == 1) {
                return context.getDrawable(2131231508);
            }
            if (i5 == 2) {
                return context.getDrawable(2131231538);
            }
            throw new NoWhenBranchMatchedException();
        } catch (Exception e3) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("BranchAppInfo");
            bVar.f(e3, "Failed to get custom badge for BranchAppInfo", new Object[0]);
            return null;
        }
    }

    public final boolean S0() {
        BranchEntity branchEntity = this.F;
        if (branchEntity instanceof BranchEntity.App) {
            return ((BranchEntity.App) branchEntity).getF66391c() instanceof Image.AppIcon;
        }
        if (branchEntity instanceof BranchEntity.AppStore) {
            return ((BranchEntity.AppStore) branchEntity).getF66400d() instanceof Image.AppIcon;
        }
        if ((branchEntity instanceof BranchEntity.AutoSuggestion) || (branchEntity instanceof BranchEntity.Contact)) {
            return false;
        }
        if (branchEntity instanceof BranchEntity.HeroAd) {
            return ((BranchEntity.HeroAd) branchEntity).getF66421d() instanceof Image.AppIcon;
        }
        if (branchEntity instanceof BranchEntity.HeroV2) {
            return ((BranchEntity.HeroV2) branchEntity).getF66430d() instanceof Image.AppIcon;
        }
        if (branchEntity instanceof BranchEntity.RelatedApp) {
            return ((BranchEntity.RelatedApp) branchEntity).getF66438d() instanceof Image.AppIcon;
        }
        if ((branchEntity instanceof BranchEntity.RichContent) || (branchEntity instanceof BranchEntity.SearchMore) || (branchEntity instanceof BranchEntity.Shortcut)) {
            return false;
        }
        if (branchEntity instanceof BranchEntity.SuggestedInstalls) {
            return ((BranchEntity.SuggestedInstalls) branchEntity).getF66465d() instanceof Image.AppIcon;
        }
        throw new NoWhenBranchMatchedException();
    }

    public final void T0(Context context) {
        BranchEntity branchEntity = this.F;
        if (branchEntity instanceof BranchEntity.App) {
            ((BranchEntity.App) branchEntity).m(context);
            return;
        }
        if (branchEntity instanceof BranchEntity.AppStore) {
            ((BranchEntity.AppStore) branchEntity).a0(context);
            return;
        }
        if (branchEntity instanceof BranchEntity.RelatedApp) {
            ((BranchEntity.RelatedApp) branchEntity).m(context);
            return;
        }
        if (branchEntity instanceof BranchEntity.SearchMore) {
            ((BranchEntity.SearchMore) branchEntity).m(context);
            return;
        }
        if (branchEntity instanceof BranchEntity.HeroV2) {
            ((BranchEntity.HeroV2) branchEntity).p(context);
            return;
        }
        if (branchEntity instanceof BranchEntity.HeroAd) {
            ((BranchEntity.HeroAd) branchEntity).p(context);
            return;
        }
        if (branchEntity instanceof BranchEntity.RichContent) {
            ((BranchEntity.RichContent) branchEntity).f(context);
            return;
        }
        if (branchEntity instanceof BranchEntity.Shortcut) {
            ((BranchEntity.Shortcut) branchEntity).m(context);
        } else if (branchEntity instanceof BranchEntity.SuggestedInstalls) {
            ((BranchEntity.SuggestedInstalls) branchEntity).m(context);
        } else {
            if (!(branchEntity instanceof BranchEntity.Contact) && !(branchEntity instanceof BranchEntity.AutoSuggestion)) {
                throw new NoWhenBranchMatchedException();
            }
            throw new IllegalArgumentException("Unsupported BranchEntity type: ".concat(branchEntity.getClass().getName()));
        }
    }

    public d(q9.p pVar, BranchEntity.App app, ja.h hVar) {
        this(app, b.a(pVar, app, app.getF66391c(), app.l(), hVar));
    }
}
