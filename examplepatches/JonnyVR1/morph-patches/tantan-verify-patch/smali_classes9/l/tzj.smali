.class public final Ll/tzj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J-\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0007\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\'\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u0017"
    }
    d2 = {
        "Ll/tzj;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
        "giftBrief",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
        "giftItem",
        "Ll/oo2;",
        "data",
        "",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;",
        "a",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;)Ljava/util/List;",
        "trayData",
        "",
        "c",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V",
        "",
        "newCombosNum",
        "",
        "b",
        "(ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z",
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
.field public static final INSTANCE:Ll/tzj;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/tzj;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/tzj;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/tzj;->INSTANCE:Ll/tzj;

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

.method public static final a(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;)Ljava/util/List;
    .locals 10
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/oo2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            "Ll/oo2;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
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
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 16
    .line 17
    iget v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-le v1, v2, :cond_0

    .line 21
    .line 22
    sub-int/2addr v1, v2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v1, v3

    .line 25
    :goto_0
    const/4 v2, 0x1

    .line 26
    invoke-static {v2}, Ll/wft;->b(I)Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-nez v4, :cond_1

    .line 31
    .line 32
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->o(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {p2}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 41
    .line 42
    iput-object p2, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->h:Ljava/lang/String;

    .line 43
    .line 44
    iget p2, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->l:I

    .line 45
    .line 46
    add-int/2addr p2, v1

    .line 47
    iput p2, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->k:I

    .line 48
    .line 49
    invoke-static {p1, v2, p0}, Ll/tzj;->c(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    return-object v0

    .line 56
    :cond_1
    iget v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 57
    .line 58
    :goto_1
    if-ge v3, v4, :cond_3

    .line 59
    .line 60
    add-int v5, v3, v1

    .line 61
    .line 62
    add-int/2addr v5, v2

    .line 63
    int-to-long v6, v5

    .line 64
    iget-wide v8, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->threshold:J

    .line 65
    .line 66
    cmp-long v6, v6, v8

    .line 67
    .line 68
    if-lez v6, :cond_2

    .line 69
    .line 70
    iget v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 71
    .line 72
    sub-int/2addr v6, v2

    .line 73
    if-eq v3, v6, :cond_2

    .line 74
    .line 75
    sget-object v6, Ll/tzj;->INSTANCE:Ll/tzj;

    .line 76
    .line 77
    invoke-virtual {v6, v5, p0, p1}, Ll/tzj;->b(ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z

    .line 78
    .line 79
    .line 80
    move-result v6

    .line 81
    if-eqz v6, :cond_2

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_2
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->o(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    invoke-virtual {p2}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 89
    .line 90
    .line 91
    move-result-object v7

    .line 92
    iget-object v7, v7, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 93
    .line 94
    iput-object v7, v6, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->h:Ljava/lang/String;

    .line 95
    .line 96
    iput v5, v6, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->k:I

    .line 97
    .line 98
    invoke-static {p1, v6, p0}, Ll/tzj;->c(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_3
    return-object v0
.end method

.method public static final c(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 7
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
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
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGear:Z

    .line 11
    .line 12
    if-eqz p2, :cond_3

    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 15
    .line 16
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->gearEffects:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->gearEffects:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_3

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;

    .line 44
    .line 45
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->k:I

    .line 46
    .line 47
    int-to-long v1, v0

    .line 48
    iget-wide v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;->since:J

    .line 49
    .line 50
    cmp-long v1, v1, v3

    .line 51
    .line 52
    if-ltz v1, :cond_1

    .line 53
    .line 54
    int-to-long v1, v0

    .line 55
    iget-wide v5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;->until:J

    .line 56
    .line 57
    cmp-long v1, v1, v5

    .line 58
    .line 59
    if-lez v1, :cond_2

    .line 60
    .line 61
    const-wide/16 v1, -0x1

    .line 62
    .line 63
    cmp-long v1, v5, v1

    .line 64
    .line 65
    if-nez v1, :cond_1

    .line 66
    .line 67
    :cond_2
    iget p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;->liveGiftLevel:I

    .line 68
    .line 69
    iput p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 70
    .line 71
    iget-wide v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;->trayDuration:J

    .line 72
    .line 73
    iput-wide v1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i:J

    .line 74
    .line 75
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;->liveResourceId:Ljava/lang/String;

    .line 76
    .line 77
    iput-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 78
    .line 79
    long-to-int p0, v3

    .line 80
    if-ne v0, p0, :cond_3

    .line 81
    .line 82
    const/4 p0, 0x1

    .line 83
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->m:Z

    .line 84
    .line 85
    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method public final b(ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z
    .locals 5

    .line 1
    iget-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGear:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_2

    .line 5
    .line 6
    iget-object p0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->gearEffects:Ljava/util/List;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    check-cast p0, Ljava/util/Collection;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_2

    .line 20
    .line 21
    iget-object p0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->gearEffects:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    if-eqz p3, :cond_2

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;

    .line 40
    .line 41
    iget-wide v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;->since:J

    .line 42
    .line 43
    long-to-int v1, v1

    .line 44
    if-ne v1, p1, :cond_1

    .line 45
    .line 46
    return v0

    .line 47
    :cond_1
    iget-wide v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;->until:J

    .line 48
    .line 49
    const-wide/16 v3, -0x1

    .line 50
    .line 51
    cmp-long p3, v1, v3

    .line 52
    .line 53
    if-eqz p3, :cond_0

    .line 54
    .line 55
    long-to-int p3, v1

    .line 56
    if-ne p3, p1, :cond_0

    .line 57
    .line 58
    return v0

    .line 59
    :cond_2
    iget-wide p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->step:J

    .line 60
    .line 61
    const-wide/16 v1, 0x0

    .line 62
    .line 63
    cmp-long p0, p2, v1

    .line 64
    .line 65
    const/4 v1, 0x1

    .line 66
    if-nez p0, :cond_3

    .line 67
    .line 68
    move p0, v1

    .line 69
    goto :goto_0

    .line 70
    :cond_3
    long-to-int p0, p2

    .line 71
    :goto_0
    rem-int/2addr p1, p0

    .line 72
    if-eqz p1, :cond_4

    .line 73
    .line 74
    return v1

    .line 75
    :cond_4
    return v0
.end method
