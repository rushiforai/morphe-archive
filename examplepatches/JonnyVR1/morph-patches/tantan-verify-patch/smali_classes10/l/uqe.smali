.class public final Ll/uqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qsl;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J#\u0010\t\u001a\u00020\u00082\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u0003J\u000f\u0010\u000c\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\u0003J\u0017\u0010\u000f\u001a\u00020\u00082\u0006\u0010\u000e\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u000e\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0010J#\u0010\u0013\u001a\u00020\u00082\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00120\u0004H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\nJ#\u0010\u0014\u001a\u00020\u00082\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00120\u0004H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\nJ+\u0010\u0017\u001a\u00020\u00082\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00120\u00042\u0006\u0010\u0016\u001a\u00020\u0015H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018R\u001b\u0010\u001d\u001a\u00020\u00198BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0017\u0010\u001a\u001a\u0004\u0008\u001b\u0010\u001c\u00a8\u0006\u001e"
    }
    d2 = {
        "Ll/uqe;",
        "Ll/qsl;",
        "<init>",
        "()V",
        "Landroid/util/Pair;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;",
        "pair",
        "",
        "d",
        "(Landroid/util/Pair;)V",
        "f",
        "i",
        "",
        "hidden",
        "e",
        "(Z)V",
        "h",
        "Ll/xxj;",
        "g",
        "j",
        "",
        "roomType",
        "a",
        "(Landroid/util/Pair;Ljava/lang/String;)V",
        "Ll/aqe;",
        "Lkotlin/Lazy;",
        "c",
        "()Ll/aqe;",
        "currentDownloadPlan",
        "livingroom_intlGmsRelease"
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
.field public final a:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tqe;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/tqe;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/uqe;->a:Lkotlin/Lazy;

    .line 14
    .line 15
    return-void
.end method

.method public static b()Ll/sqe;
    .locals 1

    .line 1
    new-instance v0, Ll/sqe;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/sqe;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a(Landroid/util/Pair;Ljava/lang/String;)V
    .locals 0
    .param p1    # Landroid/util/Pair;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;",
            "Ll/xxj;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
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
    invoke-virtual {p0}, Ll/uqe;->c()Ll/aqe;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0, p1, p2}, Ll/qsl;->a(Landroid/util/Pair;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final c()Ll/aqe;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uqe;->a:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/aqe;

    .line 8
    .line 9
    return-object p0
.end method

.method public d(Landroid/util/Pair;)V
    .locals 0
    .param p1    # Landroid/util/Pair;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/uqe;->c()Ll/aqe;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Ll/aqe;->d(Landroid/util/Pair;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uqe;->c()Ll/aqe;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/aqe;->e(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uqe;->c()Ll/aqe;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/aqe;->f()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public g(Landroid/util/Pair;)V
    .locals 0
    .param p1    # Landroid/util/Pair;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;",
            "Ll/xxj;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/uqe;->c()Ll/aqe;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Ll/aqe;->g(Landroid/util/Pair;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uqe;->c()Ll/aqe;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/aqe;->h(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uqe;->c()Ll/aqe;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/aqe;->i()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public j(Landroid/util/Pair;)V
    .locals 0
    .param p1    # Landroid/util/Pair;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;",
            "Ll/xxj;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/uqe;->c()Ll/aqe;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Ll/aqe;->j(Landroid/util/Pair;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
