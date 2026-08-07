.class public final Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;->c0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001d\u0010\u0006\u001a\u00020\u00052\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\u0016\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/purchase/mediator/d$d",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;",
        "",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "sections",
        "",
        "a",
        "(Ljava/util/List;)V",
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
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$d;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$d;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;->M(Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;)Ll/lib0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/lib0;->C(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$d;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;->N(Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$d;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;->O(Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$d;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    .line 30
    .line 31
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;->L(Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method
