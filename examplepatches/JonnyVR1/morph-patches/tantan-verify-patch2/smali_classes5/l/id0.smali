.class public final Ll/id0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tol;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\r\n\u0002\u0008\r\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0017\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010\u0012\u001a\u0004\u0008\u0013\u0010\u0014R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\r\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0018\u0010\u0019\u001a\u0004\u0008\u001a\u0010\u001b\u00a8\u0006\u001c"
    }
    d2 = {
        "Ll/id0;",
        "Ll/tol;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "",
        "from",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V",
        "Ll/bd0;",
        "requestData",
        "",
        "b",
        "(Ll/bd0;)Z",
        "",
        "a",
        "(Ll/bd0;)Ljava/lang/CharSequence;",
        "Lcom/p1/mobile/android/app/Act;",
        "getAct",
        "()Lcom/p1/mobile/android/app/Act;",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "getPurchaseType",
        "()Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "c",
        "Ljava/lang/String;",
        "getFrom",
        "()Ljava/lang/String;",
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
.field public final a:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/core/data/PurchaseType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/id0;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iput-object p2, p0, Ll/id0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    iput-object p3, p0, Ll/id0;->c:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(Ll/bd0;)Ljava/lang/CharSequence;
    .locals 3
    .param p1    # Ll/bd0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_PICKS_MEMBERSHIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 5
    .line 6
    iget-object v1, p0, Ll/id0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-static {v1, p0}, Ll/bn60;->G(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "svipPicksMembership"

    .line 27
    .line 28
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "lowPriceSVIPPicks"

    .line 33
    .line 34
    invoke-static {v0, v1, v2}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object p0, p0, Ll/id0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    invoke-static {v0, p0, p1}, Ll/bn60;->H(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iget-object p0, p0, Ll/id0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/bd0;->d()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    invoke-static {p0, p1}, Ll/bn60;->G(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    return-object p0
.end method

.method public b(Ll/bd0;)Z
    .locals 0
    .param p1    # Ll/bd0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/id0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 5
    .line 6
    invoke-static {p0}, Ll/wib0;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/bd0;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method
