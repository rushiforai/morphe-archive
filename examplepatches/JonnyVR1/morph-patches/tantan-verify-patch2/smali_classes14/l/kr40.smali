.class public final Ll/kr40;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\r\u0018\u00002\u00020\u0001B\u001b\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ\r\u0010\u000b\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\nJ\r\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\r\u0010\u0010\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R$\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000b\u0010\u0012\u001a\u0004\u0008\u0013\u0010\u0014\"\u0004\u0008\u0015\u0010\u0016R$\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0010\u0010\u0017\u001a\u0004\u0008\u0018\u0010\u0019\"\u0004\u0008\u001a\u0010\u001b\u00a8\u0006\u001c"
    }
    d2 = {
        "Ll/kr40;",
        "",
        "Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;",
        "niceNumberDetail",
        "Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;",
        "niceNumberList",
        "<init>",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;)V",
        "",
        "e",
        "()Z",
        "a",
        "",
        "f",
        "()V",
        "",
        "b",
        "()I",
        "Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;",
        "c",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;",
        "setNiceNumberDetail",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;",
        "d",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;",
        "setNiceNumberList",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;)V",
        "external_intlGmsRelease"
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
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kr40;->a:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kr40;->b:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kr40;->a:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;->remainTimes:I

    .line 9
    .line 10
    if-lez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public final b()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kr40;->a:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;->remainTimes:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public final c()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kr40;->a:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kr40;->b:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kr40;->a:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;->qualified:Z

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public final f()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kr40;->a:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;->remainTimes:I

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    add-int/lit8 v0, v0, -0x1

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;->remainTimes:I

    .line 12
    .line 13
    :cond_0
    return-void
.end method
