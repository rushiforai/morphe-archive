.class public Ll/rg4;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/bh4;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/g90;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/data/MessageLocation;

.field public d:Z

.field public e:Ll/l90;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

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
    iput-object p1, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance p1, Ll/g90;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/g90;-><init>()V

    .line 14
    .line 15
    .line 16
    filled-new-array {p1}, [Ll/g90;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/rg4;->b:Ljava/util/List;

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    iput-boolean p1, p0, Ll/rg4;->d:Z

    .line 28
    .line 29
    new-instance p1, Ll/l90;

    .line 30
    .line 31
    new-instance v0, Ll/rg4$a;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/rg4$a;-><init>(Ll/rg4;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p1, v0}, Ll/l90;-><init>(Ll/qol$a;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/rg4;->e:Ll/l90;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic e0(Ll/rg4;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rg4;->q0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ll/rg4;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g0(Ll/rg4;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private m0(Landroid/content/Intent;)V
    .locals 1

    .line 1
    const-string v0, "android.intent.extra.TEXT"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/bh4;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/bh4;->K(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private synthetic q0(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/rg4;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v3, "android.intent.action.SEND"

    .line 18
    .line 19
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const-string v4, "image/"

    .line 24
    .line 25
    const/4 v5, 0x1

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    const-string v1, "text/plain"

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iput-boolean v5, p0, Ll/rg4;->d:Z

    .line 43
    .line 44
    invoke-direct {p0, v0}, Ll/rg4;->m0(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_4

    .line 53
    .line 54
    iput-boolean v5, p0, Ll/rg4;->d:Z

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/rg4;->k0(Landroid/content/Intent;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const-string v3, "android.intent.action.SEND_MULTIPLE"

    .line 61
    .line 62
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_2

    .line 67
    .line 68
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_2

    .line 73
    .line 74
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    iput-boolean v5, p0, Ll/rg4;->d:Z

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ll/rg4;->l0(Landroid/content/Intent;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    const-string v0, "action_send_with_media"

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    const-string v1, "images"

    .line 93
    .line 94
    if-eqz v0, :cond_3

    .line 95
    .line 96
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_3

    .line 101
    .line 102
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_4

    .line 107
    .line 108
    iput-boolean v5, p0, Ll/rg4;->d:Z

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/rg4;->act()Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Ljava/util/ArrayList;

    .line 123
    .line 124
    iput-object v0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_3
    invoke-virtual {p0}, Ll/rg4;->act()Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Ljava/util/ArrayList;

    .line 140
    .line 141
    iput-object v0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 142
    .line 143
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 144
    .line 145
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_5

    .line 150
    .line 151
    new-instance v0, Ljava/util/ArrayList;

    .line 152
    .line 153
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .line 155
    .line 156
    iput-object v0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 157
    .line 158
    :cond_5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 159
    .line 160
    check-cast p0, Ll/bh4;

    .line 161
    .line 162
    invoke-virtual {p0, p1}, Ll/bh4;->w(Landroid/os/Bundle;)V

    .line 163
    .line 164
    .line 165
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
    new-instance v0, Ll/qg4;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/qg4;-><init>(Ll/rg4;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bh4;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rg4;->e:Ll/l90;

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
    iget-object p0, p0, Ll/rg4;->e:Ll/l90;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/e3;->destroy()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public h0()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/g90;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rg4;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public i0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/rg4;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 3
    .line 4
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/location/Location;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rg4;->e:Ll/l90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rg4;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p1, p0}, Ll/e3;->a(Lcom/p1/mobile/putong/location/Location;Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final k0(Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/rg4;->m0(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "android.intent.extra.STREAM"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/net/Uri;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-static {p1}, Ll/h26;->g(Landroid/net/Uri;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Ll/oki;->C(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 38
    .line 39
    const-string p1, "raw"

    .line 40
    .line 41
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 46
    .line 47
    iget-object p0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public final l0(Landroid/content/Intent;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Ll/rg4;->m0(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "android.intent.extra.STREAM"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/16 v1, 0x9

    .line 21
    .line 22
    if-le v0, v1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    :goto_0
    const/4 v0, 0x0

    .line 30
    :goto_1
    if-ge v0, v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Landroid/net/Uri;

    .line 37
    .line 38
    invoke-static {v2}, Ll/h26;->g(Landroid/net/Uri;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-static {v2}, Ll/oki;->C(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    new-instance v3, Lcom/p1/mobile/putong/data/Picture;

    .line 53
    .line 54
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v2, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 58
    .line 59
    const-string v2, "raw"

    .line 60
    .line 61
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iput-object v2, v3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 66
    .line 67
    iget-object v2, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    return-void
.end method

.method public n0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg4;->e:Ll/l90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/e3;->init()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o0(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-string v0, "sharedText"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v1, Ll/bh4;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/bh4;->P(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    const-string v0, "images"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iput-object v0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 38
    .line 39
    :cond_2
    const-string v0, "location"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    iput-object p1, p0, Ll/rg4;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 54
    .line 55
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Ll/bh4;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ll/bh4;->L(Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    :goto_0
    return-void
.end method

.method public p0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public r0(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public s0(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-instance v1, Ll/vel0;

    .line 23
    .line 24
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-direct {v1, v0}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-wide v0, v1, Ll/vel0;->b:J

    .line 40
    .line 41
    const-wide/16 v2, 0x3a98

    .line 42
    .line 43
    cmp-long v0, v0, v2

    .line 44
    .line 45
    if-lez v0, :cond_0

    .line 46
    .line 47
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->z3:I

    .line 48
    .line 49
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast p0, Ll/bh4;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/bh4;->M(Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public t0()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/bh4;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bh4;->q()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/rg4;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v2, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 29
    .line 30
    iput-object v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 31
    .line 32
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v2, Ll/bh4;

    .line 35
    .line 36
    invoke-virtual {v2}, Ll/bh4;->p()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iput-object v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v2, p0, Ll/rg4;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 43
    .line 44
    iput-object v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 45
    .line 46
    iget-boolean v2, p0, Ll/rg4;->d:Z

    .line 47
    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 51
    .line 52
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/feed/api/b;->j4(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    new-instance v2, Landroid/content/Intent;

    .line 57
    .line 58
    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 59
    .line 60
    .line 61
    const-string v3, "moment"

    .line 62
    .line 63
    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/rg4;->act()Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const/4 v3, -0x1

    .line 71
    invoke-virtual {v0, v3, v2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    invoke-virtual {p0}, Ll/rg4;->act()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 79
    .line 80
    .line 81
    return v1
.end method

.method public u0(Ll/g90;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MessageLocation;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/rg4;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/g90;->c()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, p0, Ll/rg4;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/g90;->a()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p0, Ll/rg4;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/g90;->b()Lcom/p1/mobile/putong/data/DoublePair;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 29
    .line 30
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast p1, Ll/bh4;

    .line 33
    .line 34
    iget-object p0, p0, Ll/rg4;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ll/bh4;->N(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public x0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/bh4;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bh4;->s()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const-string v1, "sharedText"

    .line 16
    .line 17
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    const-string v0, "images"

    .line 29
    .line 30
    iget-object v1, p0, Ll/rg4;->a:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Ll/rg4;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    const-string v0, "location"

    .line 44
    .line 45
    iget-object p0, p0, Ll/rg4;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 46
    .line 47
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method
