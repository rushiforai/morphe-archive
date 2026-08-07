.class public final Ll/r3n$a;
.super Landroid/os/CountDownTimer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r3n;->m(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "l/r3n$a",
        "Landroid/os/CountDownTimer;",
        "",
        "millisUntilFinished",
        "",
        "onTick",
        "(J)V",
        "onFinish",
        "()V",
        "b_core_base"
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
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;


# direct methods
.method public constructor <init>(JLcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)V
    .locals 2

    .line 1
    iput-object p3, p0, Ll/r3n$a;->a:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    const-wide/16 v0, 0x3e8

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, v0, v1}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 4

    .line 1
    sget-object v0, Ll/r3n;->INSTANCE:Ll/r3n;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-static {v0, v1, v2}, Ll/r3n;->b(Ll/r3n;J)V

    .line 6
    .line 7
    .line 8
    iget-object v3, p0, Ll/r3n$a;->a:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 9
    .line 10
    invoke-static {v0, v3, v1, v2}, Ll/r3n;->c(Ll/r3n;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {v0}, Ll/r3n;->d(Landroid/os/CountDownTimer;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 20
    .line 21
    iget-object p0, p0, Ll/r3n$a;->a:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 22
    .line 23
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->o4(J)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onTick(J)V
    .locals 1

    .line 1
    sget-object v0, Ll/r3n;->INSTANCE:Ll/r3n;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Ll/r3n;->b(Ll/r3n;J)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/r3n$a;->a:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 7
    .line 8
    invoke-static {v0, p0, p1, p2}, Ll/r3n;->c(Ll/r3n;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
