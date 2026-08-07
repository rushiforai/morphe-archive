.class public final Ll/z5c0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/z5c0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/g6c0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0007\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\tJ\u001d\u0010\u000f\u001a\u00020\u00072\u0006\u0010\u0004\u001a\u00020\u000c2\u0006\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\tR\u0014\u0010\u0004\u001a\u00020\u00038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Ll/z5c0;",
        "Ll/ar2;",
        "Ll/g6c0;",
        "Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;",
        "act",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;)V",
        "",
        "a0",
        "()V",
        "Z",
        "destroy",
        "Lcom/p1/mobile/android/app/Act;",
        "",
        "type",
        "y0",
        "(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V",
        "z0",
        "a",
        "Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;",
        "b_core_intlGmsRelease"
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
.field public final a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/z5c0;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 8
    .line 9
    return-void
.end method

.method public static e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Ll/z5c0;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/z5c0;->t0(Ll/z5c0;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static g0(Ll/pf60;Landroid/util/Pair;)Ll/pf60;
    .locals 1

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static h0(Ll/z5c0;Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "match_timeout"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    sget-object p1, Ll/gs50;->Companion:Ll/gs50$a;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/gs50$a;->a()Ll/gs50;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Ll/z5c0;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 20
    .line 21
    invoke-virtual {p1, v0, v1}, Ll/gs50;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 29
    .line 30
    new-instance v0, Ll/pf60;

    .line 31
    .line 32
    const-string v1, "notify_normal_state"

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p0, Ll/g6c0;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/g6c0;->z()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const-string v1, "match_success"

    .line 50
    .line 51
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 58
    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    check-cast p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->userId:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v0, p0, Ll/z5c0;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 66
    .line 67
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->p1:Lcom/p1/mobile/putong/core/api/CoreAudioMatch;

    .line 70
    .line 71
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/CoreAudioMatch;->r3(Ljava/lang/String;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/v5c0;

    .line 80
    .line 81
    invoke-direct {v1, p1}, Ll/v5c0;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    new-instance v2, Ll/w5c0;

    .line 85
    .line 86
    invoke-direct {v2, v1}, Ll/w5c0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const/4 v1, 0x1

    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/x5c0;

    .line 99
    .line 100
    invoke-direct {v1, p0, p1}, Ll/x5c0;-><init>(Ll/z5c0;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    new-instance p0, Ll/y5c0;

    .line 104
    .line 105
    invoke-direct {p0}, Ll/y5c0;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    :cond_1
    return-void
.end method

.method public static i0(Ll/z5c0;Ll/pf60;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/z5c0;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;->a2()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "voice_quick_chat"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_8

    .line 15
    .line 16
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v0, Landroid/util/Pair;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreAudioMatch$AudioMatchStatus;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object v0, v1

    .line 28
    :goto_0
    if-nez v0, :cond_1

    .line 29
    .line 30
    const/4 v0, -0x1

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    sget-object v2, Ll/z5c0$a;->a:[I

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    aget v0, v2, v0

    .line 39
    .line 40
    :goto_1
    const/4 v2, 0x1

    .line 41
    if-eq v0, v2, :cond_7

    .line 42
    .line 43
    const/4 v3, 0x2

    .line 44
    if-eq v0, v3, :cond_6

    .line 45
    .line 46
    const/4 v3, 0x3

    .line 47
    if-eq v0, v3, :cond_3

    .line 48
    .line 49
    const/4 v2, 0x4

    .line 50
    if-eq v0, v2, :cond_2

    .line 51
    .line 52
    goto :goto_3

    .line 53
    :cond_2
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast v0, Ll/g6c0;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/g6c0;->z()V

    .line 58
    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_3
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v0, Landroid/util/Pair;

    .line 64
    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_4
    move-object v0, v1

    .line 71
    :goto_2
    sget-object v3, Lcom/p1/mobile/putong/core/api/CoreAudioMatch$AudioMatchError;->TIMEOUT:Lcom/p1/mobile/putong/core/api/CoreAudioMatch$AudioMatchError;

    .line 72
    .line 73
    if-ne v0, v3, :cond_5

    .line 74
    .line 75
    sget-object v0, Ll/gs50;->Companion:Ll/gs50$a;

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/gs50$a;->a()Ll/gs50;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v3, p0, Ll/z5c0;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 82
    .line 83
    const-string v4, "match_timeout"

    .line 84
    .line 85
    invoke-virtual {v0, v3, v4, v2}, Ll/gs50;->I(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 86
    .line 87
    .line 88
    :cond_5
    sget-object v0, Ll/wyb0;->Companion:Ll/wyb0$a;

    .line 89
    .line 90
    invoke-virtual {v0}, Ll/wyb0$a;->f()Ll/wyb0;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    sget-object v2, Lcom/p1/mobile/putong/core/api/CoreAudioMatch$AudioMatchStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreAudioMatch$AudioMatchStatus;

    .line 95
    .line 96
    invoke-virtual {v0, v2, v1}, Ll/wyb0;->u0(Lcom/p1/mobile/putong/core/api/CoreAudioMatch$AudioMatchStatus;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 100
    .line 101
    check-cast v0, Ll/g6c0;

    .line 102
    .line 103
    invoke-virtual {v0}, Ll/g6c0;->z()V

    .line 104
    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_6
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 108
    .line 109
    check-cast v0, Ll/g6c0;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/g6c0;->A()V

    .line 112
    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_7
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 116
    .line 117
    check-cast v0, Landroid/util/Pair;

    .line 118
    .line 119
    if-eqz v0, :cond_8

    .line 120
    .line 121
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 122
    .line 123
    if-eqz v0, :cond_8

    .line 124
    .line 125
    sget-object v2, Ll/wyb0;->Companion:Ll/wyb0$a;

    .line 126
    .line 127
    invoke-virtual {v2}, Ll/wyb0$a;->f()Ll/wyb0;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    iget-object v4, p0, Ll/z5c0;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 132
    .line 133
    check-cast v0, Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v3, v4, v0}, Ll/wyb0;->M(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v2}, Ll/wyb0$a;->f()Ll/wyb0;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    sget-object v2, Lcom/p1/mobile/putong/core/api/CoreAudioMatch$AudioMatchStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreAudioMatch$AudioMatchStatus;

    .line 143
    .line 144
    invoke-virtual {v0, v2, v1}, Ll/wyb0;->u0(Lcom/p1/mobile/putong/core/api/CoreAudioMatch$AudioMatchStatus;Ljava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    :cond_8
    :goto_3
    iget-object v0, p0, Ll/z5c0;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 148
    .line 149
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;->a2()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    const-string v2, "text_quick_chat"

    .line 154
    .line 155
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_b

    .line 160
    .line 161
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 162
    .line 163
    check-cast p1, Ll/pf60;

    .line 164
    .line 165
    if-eqz p1, :cond_9

    .line 166
    .line 167
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 168
    .line 169
    move-object v1, p1

    .line 170
    check-cast v1, Ljava/lang/String;

    .line 171
    .line 172
    :cond_9
    const-string p1, "default"

    .line 173
    .line 174
    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    if-eqz p1, :cond_a

    .line 179
    .line 180
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 181
    .line 182
    check-cast p0, Ll/g6c0;

    .line 183
    .line 184
    invoke-virtual {p0}, Ll/g6c0;->z()V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_a
    const-string p1, "matching"

    .line 189
    .line 190
    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    if-eqz p1, :cond_b

    .line 195
    .line 196
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 197
    .line 198
    check-cast p0, Ll/g6c0;

    .line 199
    .line 200
    invoke-virtual {p0}, Ll/g6c0;->A()V

    .line 201
    .line 202
    .line 203
    :cond_b
    return-void
.end method

.method public static synthetic j0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/z5c0;->x0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ll/z5c0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/z5c0;->u0(Ll/z5c0;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic l0(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/z5c0;->r0(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/z5c0;->s0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static n0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static o0(Z)Lkotlin/Unit;
    .locals 0

    .line 1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object p0
.end method

.method public static p0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lqb;->k5()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static q0(Lkotlin/jvm/functions/Function2;Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/pf60;

    .line 6
    .line 7
    return-object p0
.end method

.method private static final r0(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private static final s0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static final t0(Ll/z5c0;Ljava/lang/String;Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/z5c0;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 2
    .line 3
    new-instance v0, Ll/p5c0;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ll/p5c0;-><init>(Ll/z5c0;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 p0, 0x1f4

    .line 9
    .line 10
    invoke-static {p2, v0, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static final u0(Ll/z5c0;Ljava/lang/String;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/z5c0;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 2
    .line 3
    const/4 v7, 0x7

    .line 4
    const/4 v8, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    const/4 v5, 0x0

    .line 9
    const/4 v6, 0x0

    .line 10
    move-object v1, p1

    .line 11
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/z5c0;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 28
    .line 29
    new-instance v0, Ll/pf60;

    .line 30
    .line 31
    const-string v1, "notify_normal_state"

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/z5c0;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private static final x0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public a0()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->E()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Ll/wyb0;->Companion:Ll/wyb0$a;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/wyb0$a;->f()Ll/wyb0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/wyb0;->b0()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    new-instance v2, Ll/m5c0;

    .line 27
    .line 28
    invoke-direct {v2}, Ll/m5c0;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v3, Ll/q5c0;

    .line 32
    .line 33
    invoke-direct {v3, v2}, Ll/q5c0;-><init>(Lkotlin/jvm/functions/Function2;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/r5c0;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/r5c0;-><init>(Ll/z5c0;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Ll/s5c0;

    .line 50
    .line 51
    invoke-direct {v2}, Ll/s5c0;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 66
    .line 67
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/t5c0;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/t5c0;-><init>(Ll/z5c0;)V

    .line 78
    .line 79
    .line 80
    new-instance v2, Ll/u5c0;

    .line 81
    .line 82
    invoke-direct {v2}, Ll/u5c0;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/z5c0;->z0()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final y0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 7
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const-string p0, "text_quick_chat"

    .line 8
    .line 9
    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p2, Ll/n5c0;

    .line 20
    .line 21
    invoke-direct {p2}, Ll/n5c0;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->u0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const-string p0, "voice_quick_chat"

    .line 29
    .line 30
    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    sget-object p0, Ll/wyb0;->Companion:Ll/wyb0$a;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/wyb0$a;->f()Ll/wyb0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v4, Ll/o5c0;

    .line 43
    .line 44
    invoke-direct {v4}, Ll/o5c0;-><init>()V

    .line 45
    .line 46
    .line 47
    const/4 v5, 0x6

    .line 48
    const/4 v6, 0x0

    .line 49
    const/4 v2, 0x0

    .line 50
    const/4 v3, 0x0

    .line 51
    move-object v1, p1

    .line 52
    invoke-static/range {v0 .. v6}, Ll/wyb0;->B0(Ll/wyb0;Lcom/p1/mobile/android/app/Act;ZZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public final z0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/a6c0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/z5c0;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;->a2()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, v0, v1}, Ll/z5c0;->y0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
