.class public final Ll/d3n$b;
.super Landroid/os/CountDownTimer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d3n;->j(JLkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)V
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
        "l/d3n$b",
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
.field public final synthetic a:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Long;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic b:Ll/d3n;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;


# direct methods
.method public constructor <init>(JLkotlin/jvm/functions/Function1;Ll/d3n;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Lkotlin/Unit;",
            ">;",
            "Ll/d3n;",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p3, p0, Ll/d3n$b;->a:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    iput-object p4, p0, Ll/d3n$b;->b:Ll/d3n;

    .line 4
    .line 5
    iput-object p5, p0, Ll/d3n$b;->c:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 6
    .line 7
    const-wide/16 p3, 0x3e8

    .line 8
    .line 9
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d3n$b;->a:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    invoke-interface {v0, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/d3n$b;->b:Ll/d3n;

    .line 13
    .line 14
    iget-object v3, p0, Ll/d3n$b;->c:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 15
    .line 16
    invoke-static {v0, v3, v1, v2}, Ll/d3n;->d(Ll/d3n;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/d3n$b;->b:Ll/d3n;

    .line 20
    .line 21
    iget-object v3, p0, Ll/d3n$b;->c:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 22
    .line 23
    invoke-static {v0, v3}, Ll/d3n;->b(Ll/d3n;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/d3n$b;->b:Ll/d3n;

    .line 27
    .line 28
    invoke-static {v0}, Ll/d3n;->a(Ll/d3n;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/d3n$b;->b:Ll/d3n;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-static {v0, v3}, Ll/d3n;->e(Ll/d3n;Landroid/os/CountDownTimer;)V

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 40
    .line 41
    iget-object p0, p0, Ll/d3n$b;->c:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 42
    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 46
    .line 47
    :cond_0
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->o4(J)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public onTick(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d3n$b;->a:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/d3n$b;->b:Ll/d3n;

    .line 11
    .line 12
    iget-object v1, p0, Ll/d3n$b;->c:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 13
    .line 14
    invoke-static {v0, v1, p1, p2}, Ll/d3n;->d(Ll/d3n;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/d3n$b;->b:Ll/d3n;

    .line 18
    .line 19
    iget-object p0, p0, Ll/d3n$b;->c:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 20
    .line 21
    invoke-static {v0, p1, p2, p0}, Ll/d3n;->c(Ll/d3n;JLcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
