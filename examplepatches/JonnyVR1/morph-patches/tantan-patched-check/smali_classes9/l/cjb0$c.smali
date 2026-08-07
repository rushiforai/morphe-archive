.class public final Ll/cjb0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cjb0;->p()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "l/cjb0$c",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$a;",
        "Lcom/p1/mobile/putong/data/PayMethod;",
        "payMethod",
        "",
        "a",
        "(Lcom/p1/mobile/putong/data/PayMethod;)V",
        "pay_intlGmsRelease"
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
.field public final synthetic a:Ll/cjb0;


# direct methods
.method public constructor <init>(Ll/cjb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cjb0$c;->a:Ll/cjb0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/cjb0$c;->a:Ll/cjb0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/cjb0;->f(Ll/cjb0;)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/cjb0$c;->a:Ll/cjb0;

    .line 13
    .line 14
    invoke-static {p0}, Ll/cjb0;->h(Ll/cjb0;)Lcom/p1/mobile/putong/core/ui/purchase/PurchaseUpgradeIntroView;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->n()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseUpgradeIntroView;->n0(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
