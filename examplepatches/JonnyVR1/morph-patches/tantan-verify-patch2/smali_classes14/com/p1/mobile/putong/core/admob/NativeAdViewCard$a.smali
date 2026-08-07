.class public final Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\n\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J3\u0010\u000e\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0006\u0012\u0004\u0018\u00010\r\u0012\u0004\u0012\u00020\t0\u000c0\u000b2\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\tH\u0007\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0017\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u0010H\u0007\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R\"\u0010\u0015\u001a\u00020\t8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0015\u0010\u0016\u001a\u0004\u0008\u0017\u0010\u0018\"\u0004\u0008\u0019\u0010\u001aR(\u0010\u001b\u001a\u00020\r8\u0006@\u0006X\u0087.\u00a2\u0006\u0018\n\u0004\u0008\u001b\u0010\u001c\u0012\u0004\u0008!\u0010\u0003\u001a\u0004\u0008\u001d\u0010\u001e\"\u0004\u0008\u001f\u0010 R0\u0010#\u001a\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\"8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0018\n\u0004\u0008#\u0010$\u0012\u0004\u0008)\u0010\u0003\u001a\u0004\u0008%\u0010&\"\u0004\u0008\'\u0010(R(\u0010+\u001a\u0008\u0012\u0004\u0012\u00020\u00040*8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008+\u0010,\u001a\u0004\u0008-\u0010.\"\u0004\u0008/\u00100R\u0016\u00101\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00081\u00102R\u0014\u00103\u001a\u00020\t8\u0006X\u0086T\u00a2\u0006\u0006\n\u0004\u00083\u0010\u0016\u00a8\u00064"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;",
        "",
        "<init>",
        "()V",
        "",
        "e",
        "()Z",
        "Landroid/content/Context;",
        "context",
        "",
        "appId",
        "Lrx/c;",
        "Landroid/util/Pair;",
        "Ll/md20;",
        "j",
        "(Landroid/content/Context;Ljava/lang/String;)Lrx/c;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "",
        "l",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "APP_ID",
        "Ljava/lang/String;",
        "f",
        "()Ljava/lang/String;",
        "setAPP_ID",
        "(Ljava/lang/String;)V",
        "currentNativeAd",
        "Ll/md20;",
        "h",
        "()Ll/md20;",
        "n",
        "(Ll/md20;)V",
        "getCurrentNativeAd$annotations",
        "Ll/y20;",
        "clickAction",
        "Ll/y20;",
        "g",
        "()Ll/y20;",
        "m",
        "(Ll/y20;)V",
        "getClickAction$annotations",
        "Lrx/subjects/b;",
        "nativeAdNotifyPS",
        "Lrx/subjects/b;",
        "i",
        "()Lrx/subjects/b;",
        "setNativeAdNotifyPS",
        "(Lrx/subjects/b;)V",
        "isLoading",
        "Z",
        "TAG",
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


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;-><init>()V

    return-void
.end method

.method public static a(Landroid/util/Pair;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->Companion:Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;->h()Ll/md20;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;->h()Ll/md20;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/md20;->a()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v1, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 27
    .line 28
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    check-cast p0, Ll/md20;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;->n(Ll/md20;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;->h()Ll/md20;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;->i()Lrx/subjects/b;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->NativeAdViewCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->A8(Lcom/p1/mobile/putong/core/data/VirtualCardType;)V

    .line 68
    .line 69
    .line 70
    :goto_0
    const/4 p0, 0x0

    .line 71
    invoke-static {p0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->o(Z)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public static synthetic b(Ljava/lang/String;Ll/gcg0;Ll/md20;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;->k(Ljava/lang/String;Ll/gcg0;Ll/md20;)V

    return-void
.end method

.method public static c(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->o(Z)V

    .line 3
    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->NativeAdViewCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->A8(Lcom/p1/mobile/putong/core/data/VirtualCardType;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static d(Landroid/content/Context;Ljava/lang/String;Ll/gcg0;)V
    .locals 3

    .line 1
    new-instance v0, Ll/f70$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/f70$a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ll/be20;

    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Ll/be20;-><init>(Ljava/lang/String;Ll/gcg0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/f70$a;->b(Ll/md20$c;)Ll/f70$a;

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/kfl0$a;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/kfl0$a;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {p0, v1}, Ll/kfl0$a;->b(Z)Ll/kfl0$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/kfl0$a;->a()Ll/kfl0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/qd20$a;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/qd20$a;-><init>()V

    .line 34
    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {v1, v2}, Ll/qd20$a;->c(I)Ll/qd20$a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1, p0}, Ll/qd20$a;->h(Ll/kfl0;)Ll/qd20$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/qd20$a;->a()Ll/qd20;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    new-instance v1, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a$a;

    .line 53
    .line 54
    invoke-direct {v1, p1, p2}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a$a;-><init>(Ljava/lang/String;Ll/gcg0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/f70$a;->c(Ll/d70;)Ll/f70$a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1, p0}, Ll/f70$a;->d(Ll/qd20;)Ll/f70$a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/f70$a;->a()Ll/f70;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    new-instance p1, Ll/s70$a;

    .line 73
    .line 74
    invoke-direct {p1}, Ll/s70$a;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {v2}, Ll/u2n;->g(Z)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p1, p2}, Ll/r6;->e(Ljava/util/List;)Ll/r6;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Ll/s70$a;

    .line 86
    .line 87
    invoke-virtual {p1}, Ll/s70$a;->i()Ll/s70;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p0, p1}, Ll/f70;->a(Ll/s70;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public static final k(Ljava/lang/String;Ll/gcg0;Ll/md20;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/Pair;

    .line 5
    .line 6
    invoke-direct {v0, p2, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final e()Z
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->r:Ll/md20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final f()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->j()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final g()Ll/y20;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->k()Ll/y20;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final h()Ll/md20;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->r:Ll/md20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "currentNativeAd"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final i()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->l()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j(Landroid/content/Context;Ljava/lang/String;)Lrx/c;
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ll/md20;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance p0, Ll/ae20;

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Ll/ae20;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public final l(Lcom/p1/mobile/android/app/Act;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->m()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->o(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;->f()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard$a;->j(Landroid/content/Context;Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance p1, Ll/yd20;

    .line 27
    .line 28
    invoke-direct {p1}, Ll/yd20;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/zd20;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/zd20;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final m(Ll/y20;)V
    .locals 0
    .param p1    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->n(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n(Ll/md20;)V
    .locals 0
    .param p1    # Ll/md20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sput-object p1, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->r:Ll/md20;

    .line 5
    .line 6
    return-void
.end method
