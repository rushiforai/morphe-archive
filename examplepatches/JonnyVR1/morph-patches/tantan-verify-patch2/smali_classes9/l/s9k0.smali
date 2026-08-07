.class public Ll/s9k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/u9k0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/x3t;

.field public b:Ll/u9k0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/u9k0<",
            "TD;>;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

.field public d:Lcom/p1/mobile/putong/ui/download/DownloadTask;

.field public e:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/x3t;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Ll/x3t;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/s9k0;->a:Ll/x3t;

    .line 11
    .line 12
    iput-object p1, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "ID\u5df2\u590d\u5236"

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Ll/na5;->c(Landroid/content/Context;)Ll/na5;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "tantan userID"

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, v0, p0}, Ll/na5;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic b(Ll/s9k0;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/s9k0;->f(Ljava/io/File;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "user"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private synthetic f(Ljava/io/File;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/ps40;->h(Landroid/view/View;Ljava/io/File;)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/s9k0;->e:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Ll/u9k0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u9k0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/s9k0;->b:Ll/u9k0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s9k0;->C0()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Ll/obc0;->R:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/s9k0;->e:Landroid/graphics/Bitmap;

    .line 27
    .line 28
    iget-object p0, p0, Ll/s9k0;->d:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 29
    .line 30
    invoke-static {v0, p0}, Ll/ps40;->e(Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/s9k0;->C0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Ll/ps40;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    new-instance v1, Ll/q9k0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/q9k0;-><init>(Ll/s9k0;)V

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-static {p1, v0, v1, v2}, Ll/ps40;->f(Ljava/lang/String;Ljava/io/File;Ll/y20;Ll/x20;)Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/s9k0;->d:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p0, v0}, Ll/s9k0;->i(Ljava/io/File;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public i(Ljava/io/File;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/r9k0;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Ll/r9k0;-><init>(Ll/s9k0;Ljava/io/File;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/u9k0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/s9k0;->d(Ll/u9k0;)V

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

.method public j(Lcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 6
    .line 7
    const/16 v0, 0x8

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->d:Lv/VLinear;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->g:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const/4 v0, 0x2

    .line 28
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iget-object v2, p0, Ll/s9k0;->a:Ll/x3t;

    .line 33
    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v3, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 41
    .line 42
    iget-object v4, v3, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 43
    .line 44
    iget-object v5, v3, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 45
    .line 46
    iget-object v6, v3, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 47
    .line 48
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 49
    .line 50
    filled-new-array {v4, v5, v6, v3}, [Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v2, v1, v3}, Ll/x3t;->k(Landroid/content/Context;[Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v3, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 63
    .line 64
    iget-object v4, v3, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 65
    .line 66
    iget-object v5, v3, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 67
    .line 68
    iget-object v6, v3, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 69
    .line 70
    iget-object v7, v3, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 71
    .line 72
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 73
    .line 74
    filled-new-array {v4, v5, v6, v7, v3}, [Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-virtual {v2, v1, v3}, Ll/x3t;->k(Landroid/content/Context;[Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 79
    .line 80
    .line 81
    :goto_0
    iget-object v1, p0, Ll/s9k0;->a:Ll/x3t;

    .line 82
    .line 83
    invoke-virtual {v1, p1}, Ll/x3t;->y(Lcom/p1/mobile/putong/data/User;)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 89
    .line 90
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 96
    .line 97
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 98
    .line 99
    const/4 v2, 0x0

    .line 100
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 104
    .line 105
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->g:Landroid/widget/LinearLayout;

    .line 106
    .line 107
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 108
    .line 109
    .line 110
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    iget-object v1, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 115
    .line 116
    const-string v3, "male"

    .line 117
    .line 118
    if-nez v0, :cond_3

    .line 119
    .line 120
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->b:Lv/VText;

    .line 121
    .line 122
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 123
    .line 124
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 132
    .line 133
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->c:Lv/VImage;

    .line 134
    .line 135
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 136
    .line 137
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_2

    .line 142
    .line 143
    sget v1, Ll/obc0;->G8:I

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_2
    sget v1, Ll/obc0;->E8:I

    .line 147
    .line 148
    :goto_1
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 156
    .line 157
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->b:Lv/VText;

    .line 158
    .line 159
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    xor-int/lit8 v1, v1, 0x1

    .line 164
    .line 165
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    goto :goto_4

    .line 169
    :cond_3
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->i:Lv/VText;

    .line 170
    .line 171
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 172
    .line 173
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 181
    .line 182
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-eqz v0, :cond_4

    .line 187
    .line 188
    sget v0, Ll/obc0;->W5:I

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_4
    sget v0, Ll/obc0;->U5:I

    .line 192
    .line 193
    :goto_2
    iget-object v1, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 194
    .line 195
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->i:Lv/VText;

    .line 196
    .line 197
    invoke-virtual {v1, v0, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 201
    .line 202
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->i:Lv/VText;

    .line 203
    .line 204
    sget v1, Ll/qa00;->a:I

    .line 205
    .line 206
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 210
    .line 211
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->i:Lv/VText;

    .line 212
    .line 213
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 214
    .line 215
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-eqz v1, :cond_5

    .line 220
    .line 221
    const v1, -0xc13d0b

    .line 222
    .line 223
    .line 224
    goto :goto_3

    .line 225
    :cond_5
    const/16 v1, -0x761b

    .line 226
    .line 227
    :goto_3
    const/high16 v3, 0x40800000    # 4.0f

    .line 228
    .line 229
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 230
    .line 231
    .line 232
    move-result v3

    .line 233
    int-to-float v3, v3

    .line 234
    invoke-static {v1, v3}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 242
    .line 243
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->i:Lv/VText;

    .line 244
    .line 245
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    xor-int/lit8 v1, v1, 0x1

    .line 250
    .line 251
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 252
    .line 253
    .line 254
    :goto_4
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 255
    .line 256
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->h:Lv/VText;

    .line 257
    .line 258
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 259
    .line 260
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 261
    .line 262
    invoke-static {v1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 267
    .line 268
    .line 269
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 270
    .line 271
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->h:Lv/VText;

    .line 272
    .line 273
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {p0, p1}, Ll/s9k0;->l(Lcom/p1/mobile/putong/data/User;)V

    .line 277
    .line 278
    .line 279
    iget-object v0, p0, Ll/s9k0;->b:Ll/u9k0;

    .line 280
    .line 281
    invoke-virtual {v0}, Ll/u9k0;->l4()Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    invoke-virtual {p0, p1, v0}, Ll/s9k0;->m(Lcom/p1/mobile/putong/data/User;Z)V

    .line 286
    .line 287
    .line 288
    return-void
.end method

.method public k(Ll/nsv;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/e3t;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->d:Lv/VLinear;

    .line 14
    .line 15
    const/16 v1, 0x8

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->g:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/nsv;->g()Ll/pyl;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ll/e3t;

    .line 44
    .line 45
    iget-object p1, p1, Ll/e3t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    if-eqz p1, :cond_1

    .line 54
    .line 55
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const/4 p1, 0x0

    .line 61
    :goto_0
    invoke-virtual {p0, p1}, Ll/s9k0;->j(Lcom/p1/mobile/putong/data/User;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->d:Lv/VLinear;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    .line 14
    .line 15
    iget v0, v0, Lcom/p1/mobile/putong/data/FollowshipCounter;->followers:I

    .line 16
    .line 17
    int-to-double v2, v0

    .line 18
    invoke-static {v2, v3}, Ll/yau;->c(D)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 23
    .line 24
    iget v2, v2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 25
    .line 26
    invoke-static {v2, v1}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v3, p0, Ll/s9k0;->b:Ll/u9k0;

    .line 37
    .line 38
    invoke-virtual {v3, p1, v0, v1, v2}, Ll/u9k0;->k4(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->f:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    sget v1, Ll/obc0;->D8:I

    .line 21
    .line 22
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    sget v1, Ll/qa00;->p:I

    .line 27
    .line 28
    sget v2, Ll/qa00;->j:I

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-virtual {p2, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->e:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {v1, p2, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 42
    .line 43
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->e:Lv/VText;

    .line 44
    .line 45
    sget v0, Ll/qa00;->e:I

    .line 46
    .line 47
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 48
    .line 49
    .line 50
    new-instance p2, Landroid/text/SpannableStringBuilder;

    .line 51
    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 53
    .line 54
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "%s  \u00b7  "

    .line 59
    .line 60
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-direct {p2, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 68
    .line 69
    const-string v1, "#AA7C38"

    .line 70
    .line 71
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-direct {v0, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    const/16 v2, 0x22

    .line 85
    .line 86
    invoke-virtual {p2, v0, v3, v1, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->e:Lv/VText;

    .line 92
    .line 93
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_0
    iget-object p2, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 98
    .line 99
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->e:Lv/VText;

    .line 100
    .line 101
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 102
    .line 103
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    const-string v2, "ID:%s  \u00b7  "

    .line 108
    .line 109
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    iget-object p2, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 117
    .line 118
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->e:Lv/VText;

    .line 119
    .line 120
    invoke-virtual {p2, v0, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 121
    .line 122
    .line 123
    :goto_0
    iget-object p0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->e:Lv/VText;

    .line 126
    .line 127
    new-instance p2, Ll/o9k0;

    .line 128
    .line 129
    invoke-direct {p2, p1}, Ll/o9k0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 130
    .line 131
    .line 132
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_1
    iget-object p0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 137
    .line 138
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->e:Lv/VText;

    .line 139
    .line 140
    const-string p1, ""

    .line 141
    .line 142
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public n(Ll/vak0;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/vak0;->m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    new-instance v1, Ll/p9k0;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/p9k0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/vak0;->m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->enableNewPrivilege:Z

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->titleBackUrl:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 45
    .line 46
    const/4 v1, 0x1

    .line 47
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->k:Landroid/widget/TextView;

    .line 53
    .line 54
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->title:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->k:Landroid/widget/TextView;

    .line 62
    .line 63
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->titleColor:Ljava/lang/String;

    .line 64
    .line 65
    sget v2, Ll/n9c0;->w1:I

    .line 66
    .line 67
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-static {v1, v2}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    .line 77
    .line 78
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->titleBackUrl:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ll/s9k0;->e(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_0
    iget-object p0, p0, Ll/s9k0;->c:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 87
    .line 88
    const/4 p1, 0x0

    .line 89
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    :cond_1
    return-void
.end method
