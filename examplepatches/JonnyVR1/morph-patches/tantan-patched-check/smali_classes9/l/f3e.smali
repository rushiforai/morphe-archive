.class public final Ll/f3e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0006\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u001f\u0010\u000e\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\u000bH\u0007\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u001f\u0010\u0012\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\u0010H\u0007\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J+\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00180\u00142\u000c\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u00142\u0006\u0010\u0017\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ#\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u00020\u00180\u00142\u000c\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u0014H\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ+\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u00142\u000c\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u00142\u0006\u0010\u000c\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u001d\u0010\u001a\u00a8\u0006\u001e"
    }
    d2 = {
        "Ll/f3e;",
        "",
        "<init>",
        "()V",
        "Ll/uoe0;",
        "requestInfo",
        "",
        "a",
        "(Ll/uoe0;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
        "giftItem",
        "",
        "giftCount",
        "",
        "d",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;I)D",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
        "brief",
        "f",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V",
        "",
        "Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;",
        "discountList",
        "needCount",
        "Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;",
        "c",
        "(Ljava/util/List;I)Ljava/util/List;",
        "e",
        "(Ljava/util/List;)Ljava/util/List;",
        "b",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final INSTANCE:Ll/f3e;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/f3e;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/f3e;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/f3e;->INSTANCE:Ll/f3e;

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

.method public static final a(Ll/uoe0;)V
    .locals 5
    .param p0    # Ll/uoe0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    check-cast v0, Ljava/lang/Iterable;

    .line 15
    .line 16
    new-instance v1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    move-object v3, v2

    .line 36
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 37
    .line 38
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->remain:I

    .line 39
    .line 40
    if-lez v3, :cond_1

    .line 41
    .line 42
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    :goto_1
    return-void

    .line 53
    :cond_3
    iget v0, p0, Ll/uoe0;->f:I

    .line 54
    .line 55
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const/4 v3, 0x0

    .line 60
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    if-eqz v4, :cond_4

    .line 65
    .line 66
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 71
    .line 72
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->remain:I

    .line 73
    .line 74
    add-int/2addr v3, v4

    .line 75
    goto :goto_2

    .line 76
    :cond_4
    if-ge v0, v3, :cond_5

    .line 77
    .line 78
    sget-object v2, Ll/f3e;->INSTANCE:Ll/f3e;

    .line 79
    .line 80
    invoke-virtual {v2, v1, v0}, Ll/f3e;->c(Ljava/util/List;I)Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    goto :goto_3

    .line 85
    :cond_5
    sget-object v0, Ll/f3e;->INSTANCE:Ll/f3e;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ll/f3e;->e(Ljava/util/List;)Ljava/util/List;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    :goto_3
    new-instance v1, Ll/g3e;

    .line 92
    .line 93
    invoke-direct {v1, v0}, Ll/g3e;-><init>(Ljava/util/List;)V

    .line 94
    .line 95
    .line 96
    iput-object v1, p0, Ll/uoe0;->F:Ll/g3e;

    .line 97
    .line 98
    return-void
.end method

.method public static final d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;I)D
    .locals 12
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    invoke-static {}, Ll/u8n;->a()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 15
    .line 16
    iget-wide v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;->purchasePrice:J

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 20
    .line 21
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isSupportDiscountGift()Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-nez v4, :cond_1

    .line 26
    .line 27
    int-to-long p0, p1

    .line 28
    mul-long/2addr v0, p0

    .line 29
    long-to-double p0, v0

    .line 30
    return-wide p0

    .line 31
    :cond_1
    sget-object v0, Ll/f3e;->INSTANCE:Ll/f3e;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p0, p1}, Ll/f3e;->b(Ljava/util/List;I)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    .line 47
    .line 48
    const-wide/16 v6, 0x0

    .line 49
    .line 50
    if-le p1, v0, :cond_3

    .line 51
    .line 52
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 67
    .line 68
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->discount:I

    .line 69
    .line 70
    int-to-double v8, v1

    .line 71
    div-double/2addr v8, v4

    .line 72
    long-to-double v10, v2

    .line 73
    mul-double/2addr v10, v8

    .line 74
    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    .line 75
    .line 76
    .line 77
    move-result-wide v8

    .line 78
    add-double/2addr v6, v8

    .line 79
    goto :goto_1

    .line 80
    :cond_2
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    sub-int/2addr p1, p0

    .line 85
    int-to-long p0, p1

    .line 86
    mul-long/2addr v2, p0

    .line 87
    long-to-double p0, v2

    .line 88
    add-double/2addr v6, p0

    .line 89
    return-wide v6

    .line 90
    :cond_3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 105
    .line 106
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->discount:I

    .line 107
    .line 108
    int-to-double v0, p1

    .line 109
    div-double/2addr v0, v4

    .line 110
    long-to-double v8, v2

    .line 111
    mul-double/2addr v8, v0

    .line 112
    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    .line 113
    .line 114
    .line 115
    move-result-wide v0

    .line 116
    add-double/2addr v6, v0

    .line 117
    goto :goto_2

    .line 118
    :cond_4
    return-wide v6
.end method

.method public static final f(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 5
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 8
    .line 9
    check-cast v0, Ljava/util/Collection;

    .line 10
    .line 11
    if-eqz v0, :cond_7

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_3

    .line 20
    .line 21
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 22
    .line 23
    check-cast v0, Ljava/util/Collection;

    .line 24
    .line 25
    if-eqz v0, :cond_7

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    goto :goto_3

    .line 34
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_7

    .line 45
    .line 46
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    check-cast v1, Ljava/lang/Iterable;

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_3

    .line 68
    .line 69
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    move-object v3, v2

    .line 74
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 75
    .line 76
    iget v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->id:I

    .line 77
    .line 78
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->id:I

    .line 79
    .line 80
    if-ne v4, v3, :cond_2

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    const/4 v2, 0x0

    .line 84
    :goto_1
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 85
    .line 86
    if-eqz v2, :cond_4

    .line 87
    .line 88
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->remain:I

    .line 89
    .line 90
    iput v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->remain:I

    .line 91
    .line 92
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    check-cast v0, Ljava/lang/Iterable;

    .line 98
    .line 99
    new-instance v1, Ljava/util/ArrayList;

    .line 100
    .line 101
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    :cond_5
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-eqz v2, :cond_6

    .line 113
    .line 114
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    move-object v3, v2

    .line 119
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 120
    .line 121
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->remain:I

    .line 122
    .line 123
    if-lez v3, :cond_5

    .line 124
    .line 125
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_6
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_7
    :goto_3
    return-void
.end method


# virtual methods
.method public final b(Ljava/util/List;I)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;",
            ">;I)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 21
    .line 22
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->remain:I

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    if-gt v2, v1, :cond_0

    .line 26
    .line 27
    :goto_0
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    if-eq v2, v1, :cond_0

    .line 31
    .line 32
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-lt p2, p1, :cond_2

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_2
    const/4 p1, 0x0

    .line 43
    invoke-interface {p0, p1, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public final c(Ljava/util/List;I)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;",
            ">;I)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 21
    .line 22
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->remain:I

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    if-gt v2, v1, :cond_0

    .line 26
    .line 27
    move v3, v2

    .line 28
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    iget v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->id:I

    .line 33
    .line 34
    iput v5, v4, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;->id:I

    .line 35
    .line 36
    iput v2, v4, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;->cnt:I

    .line 37
    .line 38
    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    if-eq v3, v1, :cond_0

    .line 42
    .line 43
    add-int/lit8 v3, v3, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 p1, 0x0

    .line 47
    invoke-interface {p0, p1, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance p2, Ljava/util/HashSet;

    .line 52
    .line 53
    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;

    .line 71
    .line 72
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;->id:I

    .line 73
    .line 74
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 92
    .line 93
    .line 94
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_6

    .line 99
    .line 100
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 105
    .line 106
    .line 107
    check-cast v1, Ljava/lang/Number;

    .line 108
    .line 109
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    move-object v2, p0

    .line 114
    check-cast v2, Ljava/lang/Iterable;

    .line 115
    .line 116
    instance-of v3, v2, Ljava/util/Collection;

    .line 117
    .line 118
    if-eqz v3, :cond_3

    .line 119
    .line 120
    move-object v3, v2

    .line 121
    check-cast v3, Ljava/util/Collection;

    .line 122
    .line 123
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-eqz v3, :cond_3

    .line 128
    .line 129
    move v3, p1

    .line 130
    goto :goto_4

    .line 131
    :cond_3
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    move v3, p1

    .line 136
    :cond_4
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 137
    .line 138
    .line 139
    move-result v4

    .line 140
    if-eqz v4, :cond_5

    .line 141
    .line 142
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;

    .line 147
    .line 148
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;->id:I

    .line 149
    .line 150
    if-ne v4, v1, :cond_4

    .line 151
    .line 152
    add-int/lit8 v3, v3, 0x1

    .line 153
    .line 154
    if-gez v3, :cond_4

    .line 155
    .line 156
    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwCountOverflow()V

    .line 157
    .line 158
    .line 159
    goto :goto_3

    .line 160
    :cond_5
    :goto_4
    new-instance v2, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;

    .line 161
    .line 162
    invoke-direct {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;-><init>()V

    .line 163
    .line 164
    .line 165
    iput v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;->id:I

    .line 166
    .line 167
    iput v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;->cnt:I

    .line 168
    .line 169
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_6
    return-object v0
.end method

.method public final e(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;",
            ">;"
        }
    .end annotation

    .line 1
    check-cast p1, Ljava/lang/Iterable;

    .line 2
    .line 3
    new-instance p0, Ljava/util/ArrayList;

    .line 4
    .line 5
    const/16 v0, 0xa

    .line 6
    .line 7
    invoke-static {p1, v0}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;

    .line 31
    .line 32
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;-><init>()V

    .line 33
    .line 34
    .line 35
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->id:I

    .line 36
    .line 37
    iput v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;->id:I

    .line 38
    .line 39
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->remain:I

    .line 40
    .line 41
    iput v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;->cnt:I

    .line 42
    .line 43
    invoke-interface {p0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    return-object p0
.end method
