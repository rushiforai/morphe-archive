.class public final Ll/p3n$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o3n;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/p3n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0019\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0005*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0016X\u0096D\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010\u0004\u001a\u0004\u0008\u0005\u0010\u0006R\u001a\u0010\n\u001a\u00020\u00028\u0016X\u0096D\u00a2\u0006\u000c\n\u0004\u0008\u0008\u0010\u0004\u001a\u0004\u0008\t\u0010\u0006R\u001a\u0010\u000f\u001a\u00020\u000b8\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010\r\u001a\u0004\u0008\u0008\u0010\u000e\u00a8\u0006\u0010"
    }
    d2 = {
        "l/p3n$g",
        "Ll/o3n;",
        "",
        "a",
        "Ljava/lang/String;",
        "getLogTag",
        "()Ljava/lang/String;",
        "logTag",
        "b",
        "e",
        "purchaseNavigationFrom",
        "Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;",
        "c",
        "Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;",
        "()Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;",
        "discountEntryTab",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "IntlMeTabVisitorsOldVisitorDiscountEntry"

    .line 5
    .line 6
    iput-object v0, p0, Ll/p3n$g;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "p_intl_visitors_list,e_intl_me_tab_visitors_old_visitor_discount_entry_banner,click"

    .line 9
    .line 10
    iput-object v0, p0, Ll/p3n$g;->b:Ljava/lang/String;

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;->ME_TAB_VISITORS_OLD_VISITOR:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;

    .line 13
    .line 14
    iput-object v0, p0, Ll/p3n$g;->c:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public bridge a(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/o3n;->a(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b()Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p3n$g;->c:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge c(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/o3n;->c(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge d(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/o3n;->d(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p3n$g;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
