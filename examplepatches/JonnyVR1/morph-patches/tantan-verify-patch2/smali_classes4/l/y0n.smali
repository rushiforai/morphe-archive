.class public Ll/y0n;
.super Ll/a0n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a0n<",
        "Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/zzm;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/a0n;-><init>(Ll/zzm;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public e()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 14
    .line 15
    iget-object v0, p0, Ll/zzm;->m:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {v0, p0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public i(Ll/v0t;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/v0t;->dismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public bridge synthetic j(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y0n;->m(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public l()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 14
    .line 15
    iget-object v0, v0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "start-push-follow-in"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 28
    .line 29
    iget-object v0, v0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/16 v1, 0x14

    .line 38
    .line 39
    if-le v0, v1, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 42
    .line 43
    iget-object v0, v0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 46
    .line 47
    const/16 v1, 0x15

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const-string v0, "NA"

    .line 55
    .line 56
    :goto_0
    iget-object v1, p0, Ll/a0n;->a:Ll/zzm;

    .line 57
    .line 58
    iget-object v1, v1, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 61
    .line 62
    const-string v2, "anchorId"

    .line 63
    .line 64
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object v2, p0, Ll/a0n;->a:Ll/zzm;

    .line 69
    .line 70
    iget-object v2, v2, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 71
    .line 72
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 73
    .line 74
    const-string v3, "liveId"

    .line 75
    .line 76
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const-string v3, "audio_card_type"

    .line 81
    .line 82
    const-string v4, "live.schema.push.all"

    .line 83
    .line 84
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 89
    .line 90
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 93
    .line 94
    const-string v4, "test_group_name"

    .line 95
    .line 96
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const-string v4, "intl_live_push_source"

    .line 101
    .line 102
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    filled-new-array {v1, v2, v3, p0, v0}, [Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    const-string v0, "e_live_audio_room_enter"

    .line 111
    .line 112
    const-string v1, "p_live_push"

    .line 113
    .line 114
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    iget-object p0, p0, Ll/zzm;->i:Ll/iam;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->b(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
