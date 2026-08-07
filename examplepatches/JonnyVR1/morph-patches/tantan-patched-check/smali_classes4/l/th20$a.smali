.class public final Ll/th20$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pg20$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/th20;->G()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u001f\u0010\t\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\t\u0010\u0008\u00a8\u0006\n"
    }
    d2 = {
        "l/th20$a",
        "Ll/pg20$b;",
        "Lcom/p1/mobile/putong/data/User;",
        "user",
        "",
        "pos",
        "",
        "a",
        "(Lcom/p1/mobile/putong/data/User;I)V",
        "b",
        "member_intlGmsRelease"
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
.field public final synthetic a:Ll/th20;


# direct methods
.method public constructor <init>(Ll/th20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th20$a;->a:Ll/th20;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/data/User;Ll/th20;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/f4a;->s3(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/th20;->p()Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;->Y4()Ll/pg20;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p0}, Ll/pg20;->L(Lcom/p1/mobile/putong/data/User;)Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ll/th20;->p()Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;->Y4()Ll/pg20;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/pg20;->K()Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/th20;->q()Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;->Q0()V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/th20$a;->a:Ll/th20;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/th20;->q()Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;->z0(Lcom/p1/mobile/putong/data/User;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/User;I)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/th20$a;->a:Ll/th20;

    .line 5
    .line 6
    invoke-virtual {p2}, Ll/th20;->p()Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;->pageId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    const-string v0, "e_odiamond_sayhi"

    .line 15
    .line 16
    invoke-static {v0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 20
    .line 21
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iget-object v0, p0, Ll/th20$a;->a:Ll/th20;

    .line 26
    .line 27
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Ll/th20$a;->a:Ll/th20;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/th20;->q()Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;->P0()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object p0, p0, Ll/th20$a;->a:Ll/th20;

    .line 42
    .line 43
    new-instance v2, Ll/sh20;

    .line 44
    .line 45
    invoke-direct {v2, p1, p0}, Ll/sh20;-><init>(Lcom/p1/mobile/putong/data/User;Ll/th20;)V

    .line 46
    .line 47
    .line 48
    invoke-interface {p2, v0, p1, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Dl(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
