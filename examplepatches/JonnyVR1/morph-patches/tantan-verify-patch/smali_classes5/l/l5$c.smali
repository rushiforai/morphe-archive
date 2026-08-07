.class public final Ll/l5$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/l5;->register()V
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
        "l/l5$c",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final synthetic a:Ll/l5;


# direct methods
.method public constructor <init>(Ll/l5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l5$c;->a:Ll/l5;

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
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/l5$c;->a:Ll/l5;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/l5;->L(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/l5$c;->a:Ll/l5;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/l5;->H()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/l5$c;->a:Ll/l5;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/l5;->l()Lcom/p1/mobile/putong/data/PayMethod;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1, v0}, Ll/l5;->G(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/l5$c;->a:Ll/l5;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/l5;->n()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Ll/l5$c;->a:Ll/l5;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/l5;->l()Lcom/p1/mobile/putong/data/PayMethod;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0, p1}, Ll/l5;->I(Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method
