.class public Ll/l0n;
.super Ll/a0n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;",
        ">",
        "Ll/a0n<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public b:Ll/kcg0;

.field public c:Ll/kcg0;


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

.method public static synthetic m(Ll/a0n;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zzm;->J()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n(Ll/l0n;Landroid/view/View;Ll/zzm;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/l0n;->v(Landroid/view/View;Ll/zzm;Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic o(Ll/zzm;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zzm;->n:Ll/v0t;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/zzm;->n:Ll/v0t;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/zzm;->n:Ll/v0t;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->update()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic p(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "message"

    .line 2
    .line 3
    const-string v1, "msg"

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic q(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r(Ll/a0n;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zzm;->J()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static t(Ll/a0n;Ll/zzm;)Ll/kcg0;
    .locals 5

    .line 1
    iget-object v0, p1, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_3

    .line 13
    .line 14
    const-string v2, "bigCard"

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_3

    .line 21
    .line 22
    iget-object v0, p1, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    goto/16 :goto_1

    .line 33
    .line 34
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 35
    .line 36
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 37
    .line 38
    .line 39
    iget-object v2, p1, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 42
    .line 43
    const-string v3, "popExperimentStyleA"

    .line 44
    .line 45
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveVoiceRoomCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 52
    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    iget-object v2, p1, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 57
    .line 58
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 59
    .line 60
    const-string v4, "popExperimentStyleB"

    .line 61
    .line 62
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_3

    .line 67
    .line 68
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveVoiceNewCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 71
    .line 72
    :goto_0
    const-string v1, "VirtualCard"

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 75
    .line 76
    iget-object v1, p1, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 77
    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extensionObject:Ljava/lang/Object;

    .line 79
    .line 80
    new-instance v1, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    new-instance v2, Ll/pf60;

    .line 86
    .line 87
    const/4 v4, 0x0

    .line 88
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    invoke-direct {v2, v0, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y6(Ljava/util/List;)Z

    .line 103
    .line 104
    .line 105
    iget-object p1, p1, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_2

    .line 114
    .line 115
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->co()Ll/ano0;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-interface {p1}, Ll/ano0;->d()Lrx/subjects/b;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    new-instance v0, Ll/g0n;

    .line 128
    .line 129
    invoke-direct {v0, p0}, Ll/g0n;-><init>(Ll/a0n;)V

    .line 130
    .line 131
    .line 132
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    return-object p0

    .line 141
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->I6()Ll/j4n0;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-interface {p1}, Ll/j4n0;->d()Lrx/subjects/b;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    new-instance v0, Ll/h0n;

    .line 154
    .line 155
    invoke-direct {v0, p0}, Ll/h0n;-><init>(Ll/a0n;)V

    .line 156
    .line 157
    .line 158
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    return-object p0

    .line 167
    :cond_3
    :goto_1
    return-object v1
.end method

.method public static u()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r6()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r6()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "VirtualCard"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r6()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveVoiceRoomCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r6()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 57
    .line 58
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveVoiceNewCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 69
    .line 70
    const-string v1, "internal_push_big_style_vitual_voice"

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->C8(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    :goto_0
    return-void
.end method

.method public static w(Ll/zzm;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    const-string v1, "bigCard"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public static x(Ll/zzm;)V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_6

    .line 10
    .line 11
    iget-object v0, p0, Ll/zzm;->m:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    if-eqz v0, :cond_6

    .line 14
    .line 15
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const-string v1, "source="

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 30
    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, "&source=start-push"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 53
    .line 54
    :cond_0
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    const-string v1, "liveMode=virtualAvatar"

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 69
    .line 70
    new-instance v1, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 76
    .line 77
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v2, "&liveMode=virtualAvatar"

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 92
    .line 93
    :cond_1
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz v0, :cond_2

    .line 98
    .line 99
    const-string v1, "from="

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_2

    .line 106
    .line 107
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 108
    .line 109
    new-instance v1, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 115
    .line 116
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string v2, "&from=from_in_app_push"

    .line 122
    .line 123
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 131
    .line 132
    :cond_2
    iget-object v0, p0, Ll/zzm;->m:Lcom/p1/mobile/android/app/Act;

    .line 133
    .line 134
    iget-object v1, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 135
    .line 136
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 137
    .line 138
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-static {v0, v1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 146
    .line 147
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 148
    .line 149
    const-string v1, "popExperimentStyle2"

    .line 150
    .line 151
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-eqz v0, :cond_4

    .line 156
    .line 157
    iget-object v0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 158
    .line 159
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 160
    .line 161
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_3

    .line 168
    .line 169
    const-string v0, "anchor"

    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_3
    const-string v0, "audience_voicechat"

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_4
    const-string v0, "NA"

    .line 176
    .line 177
    :goto_0
    iget-object v2, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 178
    .line 179
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 180
    .line 181
    const-string v3, "anchorId"

    .line 182
    .line 183
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    iget-object v2, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 188
    .line 189
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 190
    .line 191
    const-string v3, "liveId"

    .line 192
    .line 193
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    const-string v2, "audio_broadcast_page_id"

    .line 198
    .line 199
    invoke-virtual {p0}, Ll/zzm;->K()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 204
    .line 205
    .line 206
    move-result-object v6

    .line 207
    iget-object v2, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 208
    .line 209
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 210
    .line 211
    const-string v3, "ralationship_type"

    .line 212
    .line 213
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 214
    .line 215
    .line 216
    move-result-object v7

    .line 217
    iget-object v2, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 218
    .line 219
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 220
    .line 221
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-eqz v1, :cond_5

    .line 226
    .line 227
    const-string v1, "audio_broadcast"

    .line 228
    .line 229
    goto :goto_1

    .line 230
    :cond_5
    const-string v1, "audio_broadcast_room"

    .line 231
    .line 232
    :goto_1
    const-string v2, "audio_card_type"

    .line 233
    .line 234
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 235
    .line 236
    .line 237
    move-result-object v8

    .line 238
    const-string v1, "user_type"

    .line 239
    .line 240
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 241
    .line 242
    .line 243
    move-result-object v9

    .line 244
    iget-object v0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 245
    .line 246
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 247
    .line 248
    const-string v1, "source"

    .line 249
    .line 250
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 251
    .line 252
    .line 253
    move-result-object v10

    .line 254
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 255
    .line 256
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 257
    .line 258
    const-string v0, "test_group_name"

    .line 259
    .line 260
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 261
    .line 262
    .line 263
    move-result-object v11

    .line 264
    filled-new-array/range {v4 .. v11}, [Ll/pf60;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    const-string v0, "e_live_audio_room_enter"

    .line 269
    .line 270
    const-string v1, "p_live_inner_broadcast"

    .line 271
    .line 272
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 273
    .line 274
    .line 275
    :cond_6
    return-void
.end method


# virtual methods
.method public A(Ll/zzm;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    .line 6
    .line 7
    new-instance p1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const-string p1, ","

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance p1, Ll/f0n;

    .line 21
    .line 22
    invoke-direct {p1}, Ll/f0n;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {p0, p1}, Ll/jyb;->R([Ljava/lang/Object;Ll/qcj;)Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :cond_0
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const-string p0, ""

    .line 41
    .line 42
    :goto_0
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method

.method public B(Landroid/view/View;Ll/zzm;)Ll/kcg0;
    .locals 2

    .line 1
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/i0n;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1, p2}, Ll/i0n;-><init>(Ll/l0n;Landroid/view/View;Ll/zzm;)V

    .line 17
    .line 18
    .line 19
    new-instance p0, Ll/j0n;

    .line 20
    .line 21
    invoke-direct {p0}, Ll/j0n;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    const/16 p0, 0x7530

    .line 2
    .line 3
    return p0
.end method

.method public e()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l0n;->x(Ll/zzm;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 11
    .line 12
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "click"

    .line 17
    .line 18
    invoke-interface {v0, v1, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Ir(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public g(Ll/v0t;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/a0n;->g(Ll/v0t;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/l0n;->b:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/l0n;->c:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/l0n;->u()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 6
    .line 7
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "exposure"

    .line 12
    .line 13
    invoke-interface {v0, v1, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Ir(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
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

.method public j(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v1, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    iget-object v0, v0, Ll/zzm;->i:Ll/iam;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->b(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/l0n;->A(Ll/zzm;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 24
    .line 25
    invoke-static {p0, v0}, Ll/l0n;->t(Ll/a0n;Ll/zzm;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/l0n;->c:Ll/kcg0;

    .line 30
    .line 31
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 32
    .line 33
    invoke-virtual {p0, p1, v0}, Ll/l0n;->B(Landroid/view/View;Ll/zzm;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Ll/l0n;->b:Ll/kcg0;

    .line 38
    .line 39
    return-void
.end method

.method public k()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/l0n;->z(Ll/zzm;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l()V
    .locals 12

    .line 1
    invoke-virtual {p0}, Ll/l0n;->s()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 9
    .line 10
    iget-object v0, v0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "popExperimentStyle2"

    .line 15
    .line 16
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 23
    .line 24
    iget-object v0, v0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 25
    .line 26
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    const-string v0, "anchor"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string v0, "audience_voicechat"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-string v0, "NA"

    .line 43
    .line 44
    :goto_0
    iget-object v2, p0, Ll/a0n;->a:Ll/zzm;

    .line 45
    .line 46
    iget-object v2, v2, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 47
    .line 48
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 49
    .line 50
    const-string v3, "anchorId"

    .line 51
    .line 52
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    iget-object v2, p0, Ll/a0n;->a:Ll/zzm;

    .line 57
    .line 58
    iget-object v2, v2, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 59
    .line 60
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 61
    .line 62
    const-string v3, "liveId"

    .line 63
    .line 64
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    iget-object v2, p0, Ll/a0n;->a:Ll/zzm;

    .line 69
    .line 70
    invoke-virtual {v2}, Ll/zzm;->K()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    const-string v3, "audio_broadcast_page_id"

    .line 75
    .line 76
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    iget-object v2, p0, Ll/a0n;->a:Ll/zzm;

    .line 81
    .line 82
    iget-object v2, v2, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 83
    .line 84
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 85
    .line 86
    const-string v3, "ralationship_type"

    .line 87
    .line 88
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object v7

    .line 92
    iget-object v2, p0, Ll/a0n;->a:Ll/zzm;

    .line 93
    .line 94
    iget-object v2, v2, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 95
    .line 96
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_2

    .line 103
    .line 104
    const-string v1, "audio_broadcast"

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_2
    const-string v1, "audio_broadcast_room"

    .line 108
    .line 109
    :goto_1
    const-string v2, "audio_card_type"

    .line 110
    .line 111
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object v8

    .line 115
    const-string v1, "user_type"

    .line 116
    .line 117
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v9

    .line 121
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 122
    .line 123
    iget-object v0, v0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 126
    .line 127
    const-string v1, "source"

    .line 128
    .line 129
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 130
    .line 131
    .line 132
    move-result-object v10

    .line 133
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 134
    .line 135
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 138
    .line 139
    const-string v0, "test_group_name"

    .line 140
    .line 141
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object v11

    .line 145
    filled-new-array/range {v4 .. v11}, [Ll/pf60;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    const-string v0, "e_live_audio_room_enter"

    .line 150
    .line 151
    const-string v1, "p_live_inner_broadcast"

    .line 152
    .line 153
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public s()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic v(Landroid/view/View;Ll/zzm;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l0n;->y(Landroid/view/View;Ll/zzm;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final y(Landroid/view/View;Ll/zzm;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Ll/l0n;->A(Ll/zzm;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x4

    .line 10
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/k0n;

    .line 14
    .line 15
    invoke-direct {v0, p2, p0}, Ll/k0n;-><init>(Ll/zzm;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public z(Ll/zzm;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l0n;->A(Ll/zzm;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Ll/l0n;->w(Ll/zzm;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method
