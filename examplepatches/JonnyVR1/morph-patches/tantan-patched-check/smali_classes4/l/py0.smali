.class public Ll/py0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/wy0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/FaceidLiveData;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/data/PhoneNumber;

.field public e:Ljava/lang/String;

.field public f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/py0;->f:Ljava/util/ArrayList;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e0(Ll/py0;Lcom/p1/mobile/putong/data/AppealPostData;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/py0;->n0(Lcom/p1/mobile/putong/data/AppealPostData;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic g0(Ll/py0;Lcom/p1/mobile/putong/data/AppealPostData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/py0;->m0(Lcom/p1/mobile/putong/data/AppealPostData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic h0(Ll/py0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/py0;->l0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic l0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/wy0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wy0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/my0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/my0;-><init>(Ll/py0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final i0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "jailed"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p1, Ll/wy0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p1, Ll/wy0;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;->a2(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string v0, "project_type_extra"

    .line 34
    .line 35
    const-string v1, "forbid_chat_appeal"

    .line 36
    .line 37
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast v0, Ll/wy0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast p0, Ll/wy0;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    const-string v0, "content"

    .line 64
    .line 65
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 72
    .line 73
    check-cast p1, Ll/wy0;

    .line 74
    .line 75
    invoke-virtual {p1}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 83
    .line 84
    check-cast p1, Ll/wy0;

    .line 85
    .line 86
    invoke-virtual {p1}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;->a2(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 95
    .line 96
    check-cast v0, Ll/wy0;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 106
    .line 107
    check-cast p0, Ll/wy0;

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_1
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p1}, Ll/yc2;->f()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    const-string v0, "sdk_name"

    .line 126
    .line 127
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const-string v0, "verification_result_code"

    .line 132
    .line 133
    const-string v1, "0"

    .line 134
    .line 135
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v1}, Ll/yc2;->g()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    const-string v2, "verification_type"

    .line 148
    .line 149
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    filled-new-array {p1, v0, v1}, [Ll/sfj0$a;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    const-string v0, "e_verification_scanface_submit_appeal"

    .line 158
    .line 159
    const-string v1, "p_appeal_reason"

    .line 160
    .line 161
    invoke-static {v0, v1, p1}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 162
    .line 163
    .line 164
    invoke-static {}, Lcom/p1/mobile/putong/data/IdCard;->new_()Lcom/p1/mobile/putong/data/IdCard;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {v0, p1}, Ll/yc2;->j(Lcom/p1/mobile/putong/data/IdCard;)V

    .line 173
    .line 174
    .line 175
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 176
    .line 177
    check-cast p1, Ll/wy0;

    .line 178
    .line 179
    invoke-virtual {p1}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 187
    .line 188
    check-cast p1, Ll/wy0;

    .line 189
    .line 190
    invoke-virtual {p1}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 199
    .line 200
    check-cast v0, Ll/wy0;

    .line 201
    .line 202
    invoke-virtual {v0}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 207
    .line 208
    .line 209
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 210
    .line 211
    check-cast p0, Ll/wy0;

    .line 212
    .line 213
    invoke-virtual {p0}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 218
    .line 219
    .line 220
    return-void
.end method

.method public final j0(Z)Ljava/lang/String;
    .locals 4

    .line 1
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_5

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/net/NetworkInterface;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ljava/net/InetAddress;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_1

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const/16 v2, 0x3a

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    const/4 v3, 0x0

    .line 66
    if-gez v2, :cond_2

    .line 67
    .line 68
    const/4 v2, 0x1

    .line 69
    goto :goto_0

    .line 70
    :cond_2
    move v2, v3

    .line 71
    :goto_0
    if-eqz p1, :cond_3

    .line 72
    .line 73
    if-eqz v2, :cond_1

    .line 74
    .line 75
    return-object v1

    .line 76
    :cond_3
    if-nez v2, :cond_1

    .line 77
    .line 78
    const/16 p0, 0x25

    .line 79
    .line 80
    invoke-virtual {v1, p0}, Ljava/lang/String;->indexOf(I)I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-gez p0, :cond_4

    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_4
    invoke-virtual {v1, v3, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    return-object p0

    .line 100
    :catch_0
    :cond_5
    const-string p0, ""

    .line 101
    .line 102
    return-object p0
.end method

.method public k0(Lcom/p1/mobile/putong/data/FaceidLiveData;Ljava/lang/String;Lcom/p1/mobile/putong/data/PhoneNumber;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/py0;->a:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 2
    .line 3
    iput-object p2, p0, Ll/py0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/py0;->d:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 6
    .line 7
    iput-object p4, p0, Ll/py0;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Ll/py0;->e:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public final synthetic m0(Lcom/p1/mobile/putong/data/AppealPostData;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/py0;->i0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/data/AppealPostData;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "jailed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "content"

    .line 14
    .line 15
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    instance-of p1, p2, Lcom/tantanapp/common/network/ApiExcep;

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ll/yc2;->f()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "sdk_name"

    .line 35
    .line 36
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p2, Lcom/tantanapp/common/network/ApiExcep;

    .line 41
    .line 42
    iget-object p2, p2, Lcom/tantanapp/common/network/ApiExcep;->response:Ll/i5d0;

    .line 43
    .line 44
    invoke-virtual {p2}, Ll/i5d0;->q()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    const-string v0, "verification_result_code"

    .line 53
    .line 54
    invoke-static {v0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ll/yc2;->g()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "verification_type"

    .line 67
    .line 68
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    filled-new-array {p1, p2, v0}, [Ll/sfj0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    const-string p2, "e_verification_scanface_submit_appeal"

    .line 77
    .line 78
    const-string v0, "p_appeal_reason"

    .line 79
    .line 80
    invoke-static {p2, v0, p1}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 85
    .line 86
    check-cast p1, Ll/wy0;

    .line 87
    .line 88
    invoke-virtual {p1}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 93
    .line 94
    .line 95
    :cond_2
    :goto_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 96
    .line 97
    check-cast p0, Ll/wy0;

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public o0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/py0;->f:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Ll/ly0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/ly0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/wy0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wy0;->n()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public p0(Lcom/p1/mobile/putong/data/AppealMaterial;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/data/AppealMaterial;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/AppealPostData;->new_()Lcom/p1/mobile/putong/data/AppealPostData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/py0;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/data/AppealPostData;->provider:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Ll/py0;->a:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/data/AppealPostData;->providerData:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 12
    .line 13
    const-string v1, "banned"

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p0, v1}, Ll/py0;->j0(Z)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/AppealPostData;->ip:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "idCard"

    .line 25
    .line 26
    iget-object v2, p0, Ll/py0;->b:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ll/yc2;->d()Lcom/p1/mobile/putong/data/IdCard;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/data/AppealPostData;->idCard:Lcom/p1/mobile/putong/data/IdCard;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const-string v1, "chatAppeal"

    .line 46
    .line 47
    iget-object v2, p0, Ll/py0;->b:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    const-string v1, "jailed"

    .line 56
    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    iget-object v1, p0, Ll/py0;->b:Ljava/lang/String;

    .line 61
    .line 62
    const-string v2, "content"

    .line 63
    .line 64
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    iput-object v2, v0, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v2, v0, Lcom/p1/mobile/putong/data/AppealPostData;->appeal_type:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v1, p0, Ll/py0;->e:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/data/AppealPostData;->ticketId:Ljava/lang/String;

    .line 77
    .line 78
    :cond_2
    :goto_0
    iget-object v1, p0, Ll/py0;->d:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 79
    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/data/AppealPostData;->smsPhone:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 81
    .line 82
    iget-object v1, p0, Ll/py0;->b:Ljava/lang/String;

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/data/AppealPostData;->verificationMethod:Ljava/lang/String;

    .line 85
    .line 86
    iput-object p1, v0, Lcom/p1/mobile/putong/data/AppealPostData;->material:Lcom/p1/mobile/putong/data/AppealMaterial;

    .line 87
    .line 88
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 89
    .line 90
    check-cast p1, Ll/wy0;

    .line 91
    .line 92
    invoke-virtual {p1}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    sget v1, Lcom/p1/mobile/putong/core/R$string;->qp:I

    .line 97
    .line 98
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 99
    .line 100
    .line 101
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 102
    .line 103
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 104
    .line 105
    iget-object v1, p0, Ll/py0;->f:Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-virtual {p1, v0, v1}, Ll/dkb;->ya(Lcom/p1/mobile/putong/data/AppealPostData;Ljava/util/List;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    new-instance v1, Ll/ny0;

    .line 116
    .line 117
    invoke-direct {v1, p0, v0}, Ll/ny0;-><init>(Ll/py0;Lcom/p1/mobile/putong/data/AppealPostData;)V

    .line 118
    .line 119
    .line 120
    new-instance v2, Ll/oy0;

    .line 121
    .line 122
    invoke-direct {v2, p0, v0}, Ll/oy0;-><init>(Ll/py0;Lcom/p1/mobile/putong/data/AppealPostData;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    return-void
.end method
