.class public final Ll/au5;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0003\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0003\u00a2\u0006\u0004\u0008\u0007\u0010\u0008JT\u0010\u0014\u001a\u00020\u00122\u000e\u0010\n\u001a\n\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030\t2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000c\u001a\u00020\u000b2#\u0010\u0013\u001a\u001f\u0012\u0015\u0012\u0013\u0018\u00010\u000e\u00a2\u0006\u000c\u0008\u000f\u0012\u0008\u0008\u0010\u0012\u0004\u0008\u0008(\u0011\u0012\u0004\u0012\u00020\u00120\rH\u0007\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0015\u0010\u0016\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0016\u0010\u0008J\u0017\u0010\u0019\u001a\u00020\u00122\u0006\u0010\u0018\u001a\u00020\u0017H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001a\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/au5;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
        "giftItem",
        "",
        "d",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z",
        "Ll/y8s;",
        "presenter",
        "",
        "receiverId",
        "Lkotlin/Function1;",
        "Ll/stj;",
        "Lkotlin/ParameterName;",
        "name",
        "interceptorWrapperData",
        "",
        "sendGiftAction",
        "f",
        "(Ll/y8s;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V",
        "e",
        "",
        "throwable",
        "c",
        "(Ljava/lang/Throwable;)V",
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


# static fields
.field public static final INSTANCE:Ll/au5;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/au5;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/au5;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/au5;->INSTANCE:Ll/au5;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/y8s;Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 1

    .line 1
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;->data:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->confessionRelationship:Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 4
    .line 5
    iget-boolean p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;->isMatched:Z

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    new-instance p3, Ll/nu5;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-direct {p3, p0, v0}, Ll/nu5;-><init>(Ll/ner;Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Ll/au5$a;

    .line 22
    .line 23
    invoke-direct {p0, p1, p2}, Ll/au5$a;-><init>(Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p3, p0}, Ll/nu5;->f0(Ll/nu5$a;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string v0, "NetWork failed."

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/muj;->b0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ll/au5;->INSTANCE:Ll/au5;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/au5;->c(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static final d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    check-cast v0, Ljava/util/Collection;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 15
    .line 16
    const-string v0, "confession"

    .line 17
    .line 18
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static final f(Ll/y8s;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .locals 2
    .param p0    # Ll/y8s;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y8s<",
            "**>;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ll/stj;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Ll/muj;->a0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->n2:I

    .line 29
    .line 30
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 31
    .line 32
    .line 33
    const-string p0, "You cannot express love to yourself"

    .line 34
    .line 35
    invoke-static {p1, p0}, Ll/muj;->b0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    sget-object v0, Ll/bv5;->INSTANCE:Ll/bv5;

    .line 40
    .line 41
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1, p2}, Ll/bv5;->d(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p0, p2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    new-instance v0, Ll/yt5;

    .line 59
    .line 60
    invoke-direct {v0, p0, p3, p1}, Ll/yt5;-><init>(Ll/y8s;Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 61
    .line 62
    .line 63
    new-instance p0, Ll/zt5;

    .line 64
    .line 65
    invoke-direct {p0, p1}, Ll/zt5;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/au5;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method
