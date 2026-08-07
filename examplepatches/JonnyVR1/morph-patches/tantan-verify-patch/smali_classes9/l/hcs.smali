.class public Ll/hcs;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ll/oo2;",
        ">",
        "Ll/qct<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public final i:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ">;>;"
        }
    .end annotation
.end field

.field public final j:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TV;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/hcs;->i:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/hcs;->j:Ljava/util/HashMap;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic J3(Ll/hcs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hcs;->T3()V

    return-void
.end method

.method public static synthetic K3(Ll/hcs;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hcs;->c4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic L3(Ll/hcs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hcs;->a4(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    return-void
.end method

.method public static synthetic M3(Ll/hcs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hcs;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic N3(Ll/hcs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hcs;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method public static synthetic O3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/muj;->q(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic P3(Ll/hcs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/hcs;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    return-void
.end method

.method public static bridge synthetic R3(Ll/hcs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hcs;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)V

    return-void
.end method

.method private S3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 4

    .line 1
    invoke-static {p2, p1}, Ll/muj;->S(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "faceGift"

    .line 5
    .line 6
    invoke-static {v0}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/l4;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Ll/hcs;->W3()Ll/uzl;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x0

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    invoke-static {}, Ll/xxh0;->a()Ll/xxh0;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v1, v3, v0}, Ll/xxh0;->b(Landroid/content/Context;Ljava/lang/String;)Ll/wxh0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    invoke-static {p2, p1}, Ll/muj;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/hcs;->W3()Ll/uzl;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-direct {p0, p1}, Ll/hcs;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-interface {v1, v2, v0}, Ll/uzl;->B(ILl/wxh0;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/hcs;->j:Ljava/util/HashMap;

    .line 70
    .line 71
    invoke-direct {p0, p1}, Ll/hcs;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 80
    .line 81
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x1

    .line 85
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-static {p3, v0, v1}, Ll/rre;->p(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 93
    .line 94
    .line 95
    move-result-object p3

    .line 96
    new-instance v0, Ll/ecs;

    .line 97
    .line 98
    invoke-direct {v0, p0, p1, p2}, Ll/ecs;-><init>(Ll/hcs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 99
    .line 100
    .line 101
    iget-wide p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->trayDuration:J

    .line 102
    .line 103
    long-to-int p0, p0

    .line 104
    invoke-virtual {p3, v0, p0}, Lcom/p1/mobile/android/app/Frag;->m4(Ljava/lang/Runnable;I)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    invoke-static {p3, v2, p0}, Ll/rre;->p(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    invoke-static {p3, v2, p0}, Ll/rre;->p(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method private T3()V
    .locals 4

    .line 1
    invoke-static {}, Ll/muj;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hcs;->i:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Ll/hcs;->i:Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Ljava/util/ArrayList;

    .line 36
    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-lez v3, :cond_0

    .line 44
    .line 45
    iget-object v3, p0, Ll/hcs;->j:Ljava/util/HashMap;

    .line 46
    .line 47
    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    if-eqz v3, :cond_1

    .line 52
    .line 53
    iget-object v3, p0, Ll/hcs;->j:Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_0

    .line 66
    .line 67
    :cond_1
    const/4 v1, 0x0

    .line 68
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 73
    .line 74
    invoke-direct {p0, v1}, Ll/hcs;->U3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    return-void
.end method

.method private U3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 9

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->id:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/hiv;->l(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    const/4 v0, 0x1

    .line 16
    if-eqz v5, :cond_0

    .line 17
    .line 18
    iget-object v1, v5, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    :cond_0
    move-object v3, p0

    .line 27
    move-object v4, p1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v5, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->o(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, v6, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->h:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-static {v6, v0, v1}, Ll/e4d0;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)Ll/e4d0;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    const-string v1, "faceGift"

    .line 58
    .line 59
    invoke-static {v1}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-object v8, v5, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 64
    .line 65
    new-instance v2, Ll/hcs$b;

    .line 66
    .line 67
    move-object v3, p0

    .line 68
    move-object v4, p1

    .line 69
    invoke-direct/range {v2 .. v7}, Ll/hcs$b;-><init>(Ll/hcs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ll/e4d0;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, v8, v0, v2, v7}, Ll/l4;->f(Ljava/lang/String;ZLl/w8e;Ll/e4d0;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_2

    .line 77
    .line 78
    invoke-direct {v3, v4, v5, v6}, Ll/hcs;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    return-void

    .line 82
    :goto_0
    invoke-static {v5}, Ll/muj;->f(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v3}, Ll/xzs;->E2()Ll/oo2;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v3}, Ll/xzs;->L2()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    invoke-static {v4, p0, v0, p1}, Ll/rre;->s(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;ZZ)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method private V3()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hcs;->j:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-virtual {p0}, Ll/hcs;->W3()Ll/uzl;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/hcs;->W3()Ll/uzl;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-interface {v3, v2}, Ll/uzl;->G(I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v2, p0, Ll/hcs;->j:Ljava/util/HashMap;

    .line 41
    .line 42
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {v2, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-void
.end method

.method private X3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I
    .locals 0

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->stickFacePositionType:I

    .line 2
    .line 3
    add-int/lit8 p0, p0, 0x64

    .line 4
    .line 5
    return p0
.end method

.method private Y3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v1, Ll/hcs$a;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/hcs$a;-><init>(Ll/hcs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-virtual {v0, p2, p0, v1}, Ll/ere;->x(Ljava/lang/String;Ll/e4d0;Ll/w8e;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private Z3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 2
    .line 3
    invoke-static {v0}, Ll/aiv;->Y0(Lcom/p1/mobile/putong/data/LiveRegionTag;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/acs;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/acs;-><init>(Ll/hcs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ll/ccs;

    .line 13
    .line 14
    invoke-direct {v2}, Ll/ccs;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/muj;->d()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-static {p1, v0, v1}, Ll/rre;->z(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-static {p1, v0, v1, p0}, Ll/rre;->s(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;ZZ)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private synthetic a4(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hcs;->W3()Ll/uzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, p1}, Ll/hcs;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-interface {v0, v1}, Ll/uzl;->G(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/hcs;->j:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ll/hcs;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/gcs;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/gcs;-><init>(Ll/hcs;)V

    .line 34
    .line 35
    .line 36
    const/16 p0, 0x1f4

    .line 37
    .line 38
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/android/app/Frag;->m4(Ljava/lang/Runnable;I)V

    .line 39
    .line 40
    .line 41
    invoke-static {p2, p1}, Ll/muj;->V(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private synthetic b4(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Ll/hcs;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic c4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/hcs;->T3()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0}, Ll/hcs;->V3()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method private synthetic d4(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-direct {p0, p1, p2}, Ll/hcs;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private e4(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)V
    .locals 2

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->id:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/hiv;->l(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/muj;->r()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p2, v1}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    if-nez p2, :cond_3

    .line 34
    .line 35
    invoke-static {}, Ll/muj;->p()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    if-nez v0, :cond_2

    .line 40
    .line 41
    invoke-direct {p0, p1}, Ll/hcs;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p2, v1}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    if-nez p2, :cond_3

    .line 56
    .line 57
    invoke-direct {p0, p1, v0}, Ll/hcs;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-static {p1, v0, p2, v1}, Ll/rre;->y(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;Z)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p0, Ll/hcs;->i:Ljava/util/HashMap;

    .line 73
    .line 74
    invoke-direct {p0, p1}, Ll/hcs;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    check-cast p2, Ljava/util/ArrayList;

    .line 87
    .line 88
    if-nez p2, :cond_4

    .line 89
    .line 90
    new-instance p2, Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .line 94
    .line 95
    :cond_4
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/hcs;->i:Ljava/util/HashMap;

    .line 99
    .line 100
    invoke-direct {p0, p1}, Ll/hcs;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    invoke-direct {p0}, Ll/hcs;->T3()V

    .line 112
    .line 113
    .line 114
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ubs;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ubs;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/i6t;->u3(Ll/qcj;)Ll/i6t$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/wbs;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/wbs;-><init>(Ll/hcs;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/i6t$a;->b(Ll/y20;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/ybs;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/ybs;-><init>(Ll/hcs;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public W3()Ll/uzl;
    .locals 2

    .line 1
    new-instance v0, Ll/k210;

    .line 2
    .line 3
    const/16 v1, 0x960

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/uzl;

    .line 13
    .line 14
    return-object p0
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/hcs;->i:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
