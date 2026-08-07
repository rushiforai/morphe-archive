.class public Ll/ym00;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/in00;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Z

.field public f:I

.field public g:Ljava/lang/String;

.field public h:Z

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Z

.field public l:Lcom/p1/mobile/putong/feed/data/RawFeed;

.field public m:Z

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/ym00;->f:I

    .line 6
    .line 7
    new-instance v0, Ll/ym00$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/ym00$a;-><init>(Ll/ym00;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ym00;->o:Ljava/lang/Runnable;

    .line 13
    .line 14
    iput-object p1, p0, Ll/ym00;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/ym00;->h0(Landroid/os/Bundle;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic e0(Ll/ym00;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ym00;->i0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ll/ym00;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ym00;->k0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic g0(Ll/ym00;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ym00;->j0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic i0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/in00;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/in00;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic j0(Lcom/p1/mobile/android/app/c;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/in00;

    .line 8
    .line 9
    iget-object v0, v0, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v0, Ll/in00;

    .line 20
    .line 21
    iget-object v0, v0, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->R4()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/ym00;->c:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ll/ym00;->d:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast v0, Ll/in00;

    .line 45
    .line 46
    iget-object v0, v0, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 47
    .line 48
    iget-object v1, p0, Ll/ym00;->o:Ljava/lang/Runnable;

    .line 49
    .line 50
    const-string v2, "detailTime"

    .line 51
    .line 52
    invoke-static {v2}, Ll/ksg;->I(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    int-to-long v2, v2

    .line 57
    const-wide/16 v4, 0x3e8

    .line 58
    .line 59
    mul-long/2addr v2, v4

    .line 60
    invoke-static {v0, v1, v2, v3}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 61
    .line 62
    .line 63
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 64
    .line 65
    if-ne p1, v0, :cond_1

    .line 66
    .line 67
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 68
    .line 69
    check-cast p1, Ll/in00;

    .line 70
    .line 71
    iget-object p1, p1, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_1

    .line 78
    .line 79
    iget-object p0, p0, Ll/ym00;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 82
    .line 83
    .line 84
    :cond_1
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/dm00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dm00;-><init>(Ll/ym00;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/om00;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/om00;-><init>(Ll/ym00;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 26
    .line 27
    iget-object v0, v0, Ll/jka;->p0:Lrx/subjects/b;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/qm00;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/qm00;-><init>(Ll/ym00;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public h0(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/ym00;->b:Ljava/lang/String;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    const-string v0, "from"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/ym00;->b:Ljava/lang/String;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Ll/ym00;->c:Ljava/lang/String;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    const-string v0, "momentId"

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/ym00;->c:Ljava/lang/String;

    .line 39
    .line 40
    :cond_2
    iget-object v0, p0, Ll/ym00;->d:Ljava/lang/String;

    .line 41
    .line 42
    if-nez v0, :cond_3

    .line 43
    .line 44
    const-string v0, "momentOwner"

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ll/ym00;->d:Ljava/lang/String;

    .line 57
    .line 58
    :cond_3
    const-string v0, "initMediaIndex"

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    const/4 v2, 0x0

    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p0, Ll/ym00;->f:I

    .line 72
    .line 73
    :cond_4
    const-string v0, "isHideComment"

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput-boolean v0, p0, Ll/ym00;->e:Z

    .line 86
    .line 87
    :cond_5
    const-string v0, "start_home_card"

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_6

    .line 94
    .line 95
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput-boolean v0, p0, Ll/ym00;->m:Z

    .line 100
    .line 101
    :cond_6
    const-string v0, "canGreeting"

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_7

    .line 108
    .line 109
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iput-boolean v0, p0, Ll/ym00;->h:Z

    .line 114
    .line 115
    :cond_7
    const-string v0, "momentValue"

    .line 116
    .line 117
    const/4 v1, 0x0

    .line 118
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Ll/ym00;->g:Ljava/lang/String;

    .line 123
    .line 124
    const-string v0, "msg_id"

    .line 125
    .line 126
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p0, Ll/ym00;->i:Ljava/lang/String;

    .line 131
    .line 132
    const-string v0, "enterPage"

    .line 133
    .line 134
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, p0, Ll/ym00;->j:Ljava/lang/String;

    .line 139
    .line 140
    const-string v0, "showInput"

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    if-eqz v3, :cond_8

    .line 147
    .line 148
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    iput-boolean v0, p0, Ll/ym00;->k:Z

    .line 153
    .line 154
    :cond_8
    const-string v0, "rawFeed"

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    instance-of v2, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 161
    .line 162
    if-eqz v2, :cond_9

    .line 163
    .line 164
    check-cast v0, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 165
    .line 166
    iput-object v0, p0, Ll/ym00;->l:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 167
    .line 168
    :cond_9
    const-string v0, "clickedMsgid"

    .line 169
    .line 170
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Ll/ym00;->n:Ljava/lang/String;

    .line 175
    .line 176
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ym00;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ym00;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finishWithoutCustomAnimation()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public l0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ym00;->h0(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    const-string v0, "from"

    .line 2
    .line 3
    iget-object v1, p0, Ll/ym00;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "momentId"

    .line 9
    .line 10
    iget-object v1, p0, Ll/ym00;->c:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v0, "momentOwner"

    .line 16
    .line 17
    iget-object v1, p0, Ll/ym00;->d:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v0, "initMediaIndex"

    .line 23
    .line 24
    iget v1, p0, Ll/ym00;->f:I

    .line 25
    .line 26
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    const-string v0, "isHideComment"

    .line 30
    .line 31
    iget-boolean v1, p0, Ll/ym00;->e:Z

    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 34
    .line 35
    .line 36
    const-string v0, "momentValue"

    .line 37
    .line 38
    iget-object v1, p0, Ll/ym00;->g:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string v0, "msg_id"

    .line 44
    .line 45
    iget-object p0, p0, Ll/ym00;->i:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
