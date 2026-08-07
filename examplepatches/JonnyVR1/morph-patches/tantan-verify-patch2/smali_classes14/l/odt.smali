.class public Ll/odt;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/PushMessage;Landroid/app/Activity;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->g2(Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/data/PushMessage;)Z
    .locals 2
    .param p0    # Lcom/p1/mobile/putong/data/PushMessage;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "live.schema.push.in.app"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "live.audience.signin.push"

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const-string v0, "live.voiceLiving.partnerFinder.push"

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    const-string v0, "live.anchor.living.push"

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    const-string v0, "live.card.push.in.app"

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    const-string v0, "live.ongoingLive.pinkCard"

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/4 p0, 0x0

    .line 63
    return p0

    .line 64
    :cond_1
    :goto_0
    invoke-static {p0}, Ll/odt;->e(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/z0n;->a()Ll/z0n;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0, p0}, Ll/z0n;->c(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x1

    .line 75
    return p0
.end method

.method public static d(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x1

    .line 14
    const/4 v4, -0x1

    .line 15
    sparse-switch v2, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :sswitch_0
    const-string v2, "live.suggest.activity"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v4, 0x2

    .line 29
    goto :goto_0

    .line 30
    :sswitch_1
    const-string v2, "live.suggest.room"

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v4, v3

    .line 40
    goto :goto_0

    .line 41
    :sswitch_2
    const-string v2, "live.square.push"

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    move v4, v0

    .line 51
    :goto_0
    const/4 v1, 0x0

    .line 52
    packed-switch v4, :pswitch_data_0

    .line 53
    .line 54
    .line 55
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 56
    .line 57
    if-nez v1, :cond_3

    .line 58
    .line 59
    invoke-static {p0, p1}, Ll/cft;->d(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 60
    .line 61
    .line 62
    return v3

    .line 63
    :pswitch_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v0, "updateSuggestActivity"

    .line 66
    .line 67
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p0}, Ll/v5k0;->i(Lcom/p1/mobile/putong/data/PushMessage;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {p0, v1}, Ll/v5k0;->l(Ljava/lang/String;Ll/z20;)V

    .line 82
    .line 83
    .line 84
    return v3

    .line 85
    :pswitch_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v0, "updateSuggestRoom"

    .line 88
    .line 89
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p0}, Ll/v5k0;->i(Lcom/p1/mobile/putong/data/PushMessage;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {p0, v1}, Ll/v5k0;->l(Ljava/lang/String;Ll/z20;)V

    .line 104
    .line 105
    .line 106
    return v3

    .line 107
    :pswitch_2
    invoke-static {p0, p1}, Ll/v5k0;->p(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 108
    .line 109
    .line 110
    return v3

    .line 111
    :cond_3
    return v0

    .line 112
    nop

    .line 113
    :sswitch_data_0
    .sparse-switch
        -0x4f42e0b7 -> :sswitch_2
        -0x15f84939 -> :sswitch_1
        0x45f952fb -> :sswitch_0
    .end sparse-switch

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static e(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 28
    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 50
    .line 51
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 68
    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 70
    .line 71
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_4

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_4

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 92
    .line 93
    iput-object p0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 94
    .line 95
    :cond_4
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z
    .locals 7

    .line 1
    const-string v0, "live.schema.push.all"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "live.schema.boutique.enter"

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    const/4 v2, 0x1

    .line 28
    if-nez v0, :cond_8

    .line 29
    .line 30
    invoke-static {}, Ll/odt;->h()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0}, Ll/odt;->g(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-static {}, Ll/z0n;->a()Ll/z0n;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1, p0}, Ll/z0n;->c(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 49
    .line 50
    .line 51
    return v2

    .line 52
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 55
    .line 56
    const-string v3, "background"

    .line 57
    .line 58
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    invoke-static {}, Ll/odt;->h()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    return v2

    .line 71
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 74
    .line 75
    const-string v3, "foreground"

    .line 76
    .line 77
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    invoke-static {}, Ll/odt;->h()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_4

    .line 88
    .line 89
    return v2

    .line 90
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_5

    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 99
    .line 100
    const-string v3, "&from="

    .line 101
    .line 102
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-nez v0, :cond_5

    .line 107
    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v3, "&from=from_push"

    .line 119
    .line 120
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 128
    .line 129
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 130
    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 132
    .line 133
    const-string v3, "virtualAvatar"

    .line 134
    .line 135
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_6

    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_6

    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 150
    .line 151
    const-string v3, "&liveMode="

    .line 152
    .line 153
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_6

    .line 158
    .line 159
    new-instance v0, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .line 163
    .line 164
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    const-string v3, "&liveMode=virtualAvatar"

    .line 170
    .line 171
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 179
    .line 180
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 181
    .line 182
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    new-instance v3, Ll/abe0$a;

    .line 187
    .line 188
    sget-object v4, Ll/tbs;->a:Landroid/app/Application;

    .line 189
    .line 190
    iget-object v5, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 191
    .line 192
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 193
    .line 194
    .line 195
    move-result-object v5

    .line 196
    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    invoke-direct {v3, v4, v5}, Ll/abe0$a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v3}, Ll/abe0$a;->d()Ll/abe0;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 208
    .line 209
    .line 210
    move-result-object v4

    .line 211
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SchemeKey;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SchemeKey;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    new-instance v5, Ll/ndt;

    .line 220
    .line 221
    invoke-direct {v5}, Ll/ndt;-><init>()V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v4, v0, v3, v5}, Ll/t4k0;->f(Lcom/p1/mobile/putong/data/SchemeKey;Ll/abe0;Ll/z20;)Landroid/content/Intent;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    if-nez v0, :cond_7

    .line 229
    .line 230
    return v2

    .line 231
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 232
    .line 233
    invoke-static {v0, p1}, Ll/cft;->b(Ljava/lang/String;Lcom/p1/mobile/putong/api/push/PushTrackData;)Landroid/app/PendingIntent;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    invoke-static {p0}, Ll/odt;->e(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 238
    .line 239
    .line 240
    invoke-static {p0, p1, v1, v1, v1}, Ll/mbs;->f(Lcom/p1/mobile/putong/data/PushMessage;Landroid/app/PendingIntent;Landroid/content/Intent;Landroidx/core/app/NotificationCompat$Action;Landroidx/core/app/NotificationCompat$Action;)V

    .line 241
    .line 242
    .line 243
    goto :goto_1

    .line 244
    :cond_8
    invoke-static {}, Ll/odt;->h()Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    if-eqz p1, :cond_9

    .line 249
    .line 250
    invoke-static {}, Lcom/p1/mobile/android/app/App;->e()J

    .line 251
    .line 252
    .line 253
    move-result-wide v3

    .line 254
    const-wide/16 v5, 0x2710

    .line 255
    .line 256
    cmp-long p1, v3, v5

    .line 257
    .line 258
    if-lez p1, :cond_9

    .line 259
    .line 260
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 261
    .line 262
    invoke-static {p0, v1}, Ll/v5k0;->k(Ljava/lang/String;Ll/z20;)V

    .line 263
    .line 264
    .line 265
    :cond_9
    :goto_1
    return v2
.end method

.method public static g(Ljava/lang/String;)Z
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "enterSuggestVoiceRoom"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "enterVoiceRoom"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public static h()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    return v0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    return v0
.end method

.method public static i(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z
    .locals 5

    .line 1
    const-string v0, "live.startlive.authorized"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x1

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    new-instance p1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v0, "updateCanUserStartLive?hasPermission="

    .line 17
    .line 18
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->canUserStartLive:Ljava/lang/Boolean;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    move v1, v3

    .line 34
    :cond_0
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0, v2}, Ll/v5k0;->l(Ljava/lang/String;Ll/z20;)V

    .line 42
    .line 43
    .line 44
    return v3

    .line 45
    :cond_1
    invoke-static {}, Ll/mqr;->l()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    return v1

    .line 52
    :cond_2
    invoke-static {p0, p1}, Ll/odt;->f(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    return v3

    .line 59
    :cond_3
    invoke-static {p0}, Ll/odt;->c(Lcom/p1/mobile/putong/data/PushMessage;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    return v3

    .line 66
    :cond_4
    const-string v0, "live.videochat.fakeCall"

    .line 67
    .line 68
    iget-object v4, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_8

    .line 75
    .line 76
    invoke-static {v2}, Ll/v5k0;->o(Landroid/content/Context;)Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    if-nez p1, :cond_5

    .line 81
    .line 82
    return v3

    .line 83
    :cond_5
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    if-eqz v0, :cond_6

    .line 92
    .line 93
    move v1, v3

    .line 94
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz v1, :cond_7

    .line 99
    .line 100
    const-string p0, "busy"

    .line 101
    .line 102
    invoke-static {v0, p0}, Ll/jwu;->O(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {p1, v1, p0, v0}, Ll/jwk0;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :goto_0
    return v3

    .line 122
    :cond_8
    const-string v0, "live.summary.refresh"

    .line 123
    .line 124
    iget-object v4, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-eqz v0, :cond_9

    .line 131
    .line 132
    const-string p0, "updateLiveSummary"

    .line 133
    .line 134
    invoke-static {p0, v2}, Ll/v5k0;->l(Ljava/lang/String;Ll/z20;)V

    .line 135
    .line 136
    .line 137
    return v3

    .line 138
    :cond_9
    const-string v0, "voice.live.activity.refresh"

    .line 139
    .line 140
    iget-object v4, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_a

    .line 147
    .line 148
    const-string p0, "updateVoiceActivitiesNum"

    .line 149
    .line 150
    invoke-static {p0, v2}, Ll/v5k0;->l(Ljava/lang/String;Ll/z20;)V

    .line 151
    .line 152
    .line 153
    return v3

    .line 154
    :cond_a
    const-string v0, "voice.live.counter.refresh"

    .line 155
    .line 156
    iget-object v4, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_b

    .line 163
    .line 164
    const-string p0, "updateNewVoiceActivitiesNum"

    .line 165
    .line 166
    invoke-static {p0, v2}, Ll/v5k0;->l(Ljava/lang/String;Ll/z20;)V

    .line 167
    .line 168
    .line 169
    return v3

    .line 170
    :cond_b
    const-string v0, "livechat.fixedroom.cell.newmsg"

    .line 171
    .line 172
    iget-object v2, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-eqz v0, :cond_d

    .line 179
    .line 180
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 181
    .line 182
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    .line 183
    .line 184
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    if-eqz p1, :cond_c

    .line 189
    .line 190
    return v3

    .line 191
    :cond_c
    :try_start_0
    sget-object p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 192
    .line 193
    invoke-virtual {p1, p0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    check-cast p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 198
    .line 199
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-interface {p1, p0}, Ll/c8m0;->b(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    .line 209
    .line 210
    :catch_0
    return v3

    .line 211
    :cond_d
    const-string v0, "voice.square.honorGift.refresh"

    .line 212
    .line 213
    iget-object v2, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    if-eqz v0, :cond_f

    .line 220
    .line 221
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 222
    .line 223
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    .line 224
    .line 225
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-eqz p1, :cond_e

    .line 230
    .line 231
    return v3

    .line 232
    :cond_e
    :try_start_1
    new-instance p1, Lcom/google/gson/Gson;

    .line 233
    .line 234
    invoke-direct {p1}, Lcom/google/gson/Gson;-><init>()V

    .line 235
    .line 236
    .line 237
    const-class v0, Ll/xys;

    .line 238
    .line 239
    invoke-virtual {p1, p0, v0}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    check-cast p0, Ll/xys;

    .line 244
    .line 245
    iput-boolean v3, p0, Ll/xys;->isFromLongLink:Z

    .line 246
    .line 247
    sget-object p1, Ll/itd0;->c:Ll/itd0;

    .line 248
    .line 249
    invoke-static {p1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    check-cast p1, Ll/gm3;

    .line 254
    .line 255
    invoke-virtual {p1, p0}, Ll/gm3;->k(Ll/xys;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 256
    .line 257
    .line 258
    :catch_1
    return v3

    .line 259
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 260
    .line 261
    const-string v2, "voice.enterroom.push"

    .line 262
    .line 263
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    if-eqz v0, :cond_10

    .line 268
    .line 269
    invoke-static {p0, p1}, Ll/cft;->d(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 270
    .line 271
    .line 272
    return v3

    .line 273
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 274
    .line 275
    const-string v2, "live.videochat.randomMatch.success"

    .line 276
    .line 277
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 278
    .line 279
    .line 280
    move-result v0

    .line 281
    if-eqz v0, :cond_11

    .line 282
    .line 283
    new-instance p1, Ll/mdt;

    .line 284
    .line 285
    invoke-direct {p1, p0}, Ll/mdt;-><init>(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 286
    .line 287
    .line 288
    invoke-static {p1}, Ll/cft;->e(Ll/y20;)V

    .line 289
    .line 290
    .line 291
    return v3

    .line 292
    :cond_11
    invoke-static {}, Ll/cft;->f()Z

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    if-eqz v0, :cond_12

    .line 297
    .line 298
    return v3

    .line 299
    :cond_12
    const-string v0, "conversation.single"

    .line 300
    .line 301
    iget-object v2, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 302
    .line 303
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    if-eqz v0, :cond_13

    .line 308
    .line 309
    return v1

    .line 310
    :cond_13
    invoke-static {p0, p1}, Ll/odt;->d(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z

    .line 311
    .line 312
    .line 313
    move-result p0

    .line 314
    return p0
.end method

.method public static j()V
    .locals 35

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 2
    .line 3
    new-instance v1, Ll/odt$a;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/odt$a;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v33, "live.videochat.fakeCall"

    .line 9
    .line 10
    const-string v34, "live.videochat.randomMatch.success"

    .line 11
    .line 12
    const-string v2, "live.living.push"

    .line 13
    .line 14
    const-string v3, "live.square.push"

    .line 15
    .line 16
    const-string v4, "live.anchor.push"

    .line 17
    .line 18
    const-string v5, "live.suggest.room"

    .line 19
    .line 20
    const-string v6, "live.suggest.activity"

    .line 21
    .line 22
    const-string v7, "live.summary.refresh"

    .line 23
    .line 24
    const-string v8, "live.startlive.authorized"

    .line 25
    .line 26
    const-string v9, "live.voiceLiving.push"

    .line 27
    .line 28
    const-string v10, "live.voiceFriendLiving.push"

    .line 29
    .line 30
    const-string v11, "live.voiceFriendOncall.push"

    .line 31
    .line 32
    const-string v12, "live.voiceLikeOrFollowLiving.push"

    .line 33
    .line 34
    const-string v13, "live.voiceLikeOrFollowOncall.push"

    .line 35
    .line 36
    const-string v14, "live.voiceLiving.start"

    .line 37
    .line 38
    const-string v15, "live.anchor.living.push"

    .line 39
    .line 40
    const-string v16, "voice.live.activity.refresh"

    .line 41
    .line 42
    const-string v17, "voice.live.counter.refresh"

    .line 43
    .line 44
    const-string v18, "live.audience.suggest.push"

    .line 45
    .line 46
    const-string v19, "live.audience.signin.push"

    .line 47
    .line 48
    const-string v20, "live.schema.push.in.app"

    .line 49
    .line 50
    const-string v21, "live.schema.push"

    .line 51
    .line 52
    const-string v22, "voice.live.newcomerTask.accomplished"

    .line 53
    .line 54
    const-string v23, "live.voiceLiving.partnerFinder.push"

    .line 55
    .line 56
    const-string v24, "live.schema.push.all"

    .line 57
    .line 58
    const-string v25, "live.card.push.in.app"

    .line 59
    .line 60
    const-string v26, "live.schema.boutique.enter"

    .line 61
    .line 62
    const-string v27, "conversation.single"

    .line 63
    .line 64
    const-string v28, "livechat.fixedroom.cell.newmsg"

    .line 65
    .line 66
    const-string v29, "live.chatNewMsg.push"

    .line 67
    .line 68
    const-string v30, "voice.square.honorGift.refresh"

    .line 69
    .line 70
    const-string v31, "live.ongoingLive.pinkCard"

    .line 71
    .line 72
    const-string v32, "video.chat.notify.push"

    .line 73
    .line 74
    filled-new-array/range {v2 .. v34}, [Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    const-string v3, "goPage.live."

    .line 83
    .line 84
    const-string v4, "goRun.live."

    .line 85
    .line 86
    const-string v5, "voice.enterroom.push"

    .line 87
    .line 88
    const-string v6, "voice.enterroom.push-managerRecall"

    .line 89
    .line 90
    filled-new-array {v5, v6, v3, v4}, [Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v0, v1, v2, v3}, Ll/cmb0;->b0(Ll/cmb0$g;Ljava/util/List;Ljava/util/List;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method
