.class public Ll/qo2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ayn0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/ayn0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/jxn0;)V
    .locals 2

    .line 1
    invoke-virtual {p4}, Ll/jxn0;->m()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p4, p0, p1, p2, p3}, Ll/jxn0;->r(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qo2;->a:Ll/ayn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ayn0;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Ll/ayn0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qo2;->a:Ll/ayn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ayn0;->u0()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/po2;

    .line 8
    .line 9
    invoke-direct {v0, p1, p2, p3, p4}, Ll/po2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSummary;",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->u0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ayn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qo2;->b(Ll/ayn0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Ljava/lang/String;Ljava/lang/String;Ll/nsv;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qo2;->a:Ll/ayn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ayn0;->z0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const-string v0, "receiver_user_id"

    .line 8
    .line 9
    const-string v1, "liveStatus"

    .line 10
    .line 11
    const-string v2, "live_audio_end"

    .line 12
    .line 13
    const-string v3, "liveFollow_from"

    .line 14
    .line 15
    const-string v4, "liveId"

    .line 16
    .line 17
    const-string v5, "anchorId"

    .line 18
    .line 19
    const-string v6, "p_anchor_live_end"

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-static {v5, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {v4, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    const-string v2, "off"

    .line 36
    .line 37
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object p3, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast p3, Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    filled-new-array {p0, p1, p2, v1, p3}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "e_audio_anonymous_follow"

    .line 56
    .line 57
    invoke-static {p1, v6, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    invoke-static {v5, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {v4, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    const-string v2, "endLive"

    .line 74
    .line 75
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object p3, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast p3, Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    filled-new-array {p0, p1, p2, v1, p3}, [Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const-string p1, "e_follow"

    .line 94
    .line 95
    invoke-static {p1, v6, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method
