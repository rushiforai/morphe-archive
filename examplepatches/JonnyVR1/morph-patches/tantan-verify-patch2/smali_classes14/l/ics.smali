.class public Ll/ics;
.super Ll/xgu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xgu<",
        "Ll/ics;",
        ">;"
    }
.end annotation


# instance fields
.field public final f:Ljava/util/HashMap;
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

.field public final g:Ljava/util/HashMap;
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
.method public constructor <init>(Ll/knu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xgu;-><init>(Ll/knu;)V

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
    iput-object p1, p0, Ll/ics;->f:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/ics;->g:Ljava/util/HashMap;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic S2(Ljava/lang/Throwable;)V
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

.method public static synthetic T2(Ll/ics;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ics;->k3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic U2(Ll/ics;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ics;->b3()V

    return-void
.end method

.method public static synthetic V2(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ics;->i3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    return-void
.end method

.method public static synthetic W2(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ics;->j3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method public static synthetic X2(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ics;->m3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/uxj0;)V

    return-void
.end method

.method public static bridge synthetic Y2(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ics;->a3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    return-void
.end method

.method public static bridge synthetic Z2(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ics;->n3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)V

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
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->A()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/vbs;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/vbs;-><init>(Ll/ics;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/xbs;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/xbs;-><init>(Ll/ics;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final a3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 3

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
    invoke-virtual {p0}, Ll/ics;->e3()Ll/vzl;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    invoke-static {}, Ll/xxh0;->a()Ll/xxh0;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v2, v0}, Ll/xxh0;->b(Landroid/content/Context;Ljava/lang/String;)Ll/wxh0;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    invoke-static {p2, p1}, Ll/muj;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ics;->e3()Ll/vzl;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p0, p1}, Ll/ics;->f3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-interface {v1, v2, v0}, Ll/vzl;->B(ILl/wxh0;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/ics;->g:Ljava/util/HashMap;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/ics;->f3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    const/4 v0, 0x1

    .line 80
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-static {p3, v0, v1}, Ll/rre;->p(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 85
    .line 86
    .line 87
    new-instance p3, Ll/dcs;

    .line 88
    .line 89
    invoke-direct {p3, p0, p1, p2}, Ll/dcs;-><init>(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 90
    .line 91
    .line 92
    iget-wide p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->trayDuration:J

    .line 93
    .line 94
    long-to-int p0, p0

    .line 95
    int-to-long p0, p0

    .line 96
    invoke-static {p3, p0, p1}, Lcom/tantanapp/common/utils/ThreadUtil;->h(Ljava/lang/Runnable;J)V

    .line 97
    .line 98
    .line 99
    :cond_0
    return-void
.end method

.method public final b3()V
    .locals 4

    .line 1
    invoke-static {}, Ll/muj;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ics;->f:Ljava/util/HashMap;

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
    iget-object v2, p0, Ll/ics;->f:Ljava/util/HashMap;

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
    iget-object v3, p0, Ll/ics;->g:Ljava/util/HashMap;

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
    iget-object v3, p0, Ll/ics;->g:Ljava/util/HashMap;

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
    invoke-virtual {p0, v1}, Ll/ics;->c3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    return-void
.end method

.method public final c3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 7

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
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v1, 0x0

    .line 27
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->o(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Ll/xnu;->s()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iput-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->h:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    const/4 v3, 0x1

    .line 46
    invoke-static {v1, v3, v2}, Ll/e4d0;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)Ll/e4d0;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const-string v4, "faceGift"

    .line 51
    .line 52
    invoke-static {v4}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 57
    .line 58
    new-instance v6, Ll/ics$b;

    .line 59
    .line 60
    invoke-direct {v6, p0, p1, v0, v1}, Ll/ics$b;-><init>(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v4, v5, v3, v6, v2}, Ll/l4;->f(Ljava/lang/String;ZLl/w8e;Ll/e4d0;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_1

    .line 68
    .line 69
    invoke-virtual {p0, p1, v0, v1}, Ll/ics;->a3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void

    .line 73
    :cond_2
    :goto_0
    invoke-static {v0}, Ll/muj;->f(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final d3()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ics;->g:Ljava/util/HashMap;

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
    invoke-virtual {p0}, Ll/ics;->e3()Ll/vzl;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ics;->e3()Ll/vzl;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-interface {v3, v2}, Ll/vzl;->G(I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v2, p0, Ll/ics;->g:Ljava/util/HashMap;

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

.method public e3()Ll/vzl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xnu;->u()Ll/gcl0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/gcl0;->b()Ll/vzl;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final f3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I
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

.method public final g3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
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
    new-instance v1, Ll/ics$a;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/ics$a;-><init>(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

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

.method public final h3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 2

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
    new-instance v1, Ll/zbs;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/zbs;-><init>(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ll/bcs;

    .line 13
    .line 14
    invoke-direct {p0}, Ll/bcs;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/muj;->d()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic i3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ics;->e3()Ll/vzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1}, Ll/ics;->f3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-interface {v0, v1}, Ll/vzl;->G(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ics;->g:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/ics;->f3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I

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
    new-instance v0, Ll/fcs;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/fcs;-><init>(Ll/ics;)V

    .line 30
    .line 31
    .line 32
    const-wide/16 v1, 0x1f4

    .line 33
    .line 34
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/ThreadUtil;->h(Ljava/lang/Runnable;J)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2, p1}, Ll/muj;->V(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic j3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/ics;->n3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic k3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ics;->d3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ics;->f:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic m3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p1, p2}, Ll/ics;->n3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ics;->f:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final n3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)V
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
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

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
    invoke-virtual {p0, p1}, Ll/ics;->h3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

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
    invoke-virtual {p0, p1, v0}, Ll/ics;->g3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    iget-object p2, p0, Ll/ics;->f:Ljava/util/HashMap;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/ics;->f3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    check-cast p2, Ljava/util/ArrayList;

    .line 76
    .line 77
    if-nez p2, :cond_4

    .line 78
    .line 79
    new-instance p2, Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .line 83
    .line 84
    :cond_4
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/ics;->f:Ljava/util/HashMap;

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Ll/ics;->f3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/ics;->b3()V

    .line 101
    .line 102
    .line 103
    return-void
.end method
