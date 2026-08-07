.class public Ll/g010;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/c010;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VScroll;

.field public c:Lv/VText;

.field public d:Landroid/widget/FrameLayout;

.field public e:Landroid/widget/LinearLayout;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/widget/FrameLayout;

.field public h:Landroid/widget/ImageView;

.field public i:Lv/VFrame;

.field public j:Lv/VText;

.field public k:Ll/c010;

.field public l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileTextAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileTextAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/g010;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileTextAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/g010;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g010;->k(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Ll/g010;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g010;->i(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/g010;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g010;->j(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g010;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileTextAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g010;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileTextAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/h010;->b(Ll/g010;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/c010;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g010;->k:Ll/c010;

    .line 2
    .line 3
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/feed/data/Moment;I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/g010;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->q()Ljava/text/SimpleDateFormat;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-wide v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 10
    .line 11
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/g010;->c:Lv/VText;

    .line 23
    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "normal"

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object v1, p0, Ll/g010;->g:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    new-instance v0, Ll/d010;

    .line 45
    .line 46
    invoke-direct {v0, p0, p1}, Ll/d010;-><init>(Ll/g010;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/g010;->i:Lv/VFrame;

    .line 53
    .line 54
    new-instance v1, Ll/e010;

    .line 55
    .line 56
    invoke-direct {v1, p0, p1}, Ll/e010;-><init>(Ll/g010;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/g010;->g:Landroid/widget/FrameLayout;

    .line 63
    .line 64
    const/4 v1, 0x1

    .line 65
    invoke-static {v0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/g010;->i:Lv/VFrame;

    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/g010;->i:Lv/VFrame;

    .line 78
    .line 79
    invoke-static {v0, v2}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    :goto_0
    sget v0, Ll/lbc0;->d2:I

    .line 83
    .line 84
    iget-object v1, p0, Ll/g010;->h:Landroid/widget/ImageView;

    .line 85
    .line 86
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 87
    .line 88
    if-eqz v3, :cond_1

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_1
    sget v0, Ll/lbc0;->o6:I

    .line 92
    .line 93
    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/g010;->f:Landroid/widget/FrameLayout;

    .line 97
    .line 98
    iget-object v1, p0, Ll/g010;->j:Lv/VText;

    .line 99
    .line 100
    iget-object v3, p0, Ll/g010;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileTextAct;

    .line 101
    .line 102
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileTextAct;->c:Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;

    .line 103
    .line 104
    invoke-static {p1, v0, p2, v1, v3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->q3(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;ILandroid/widget/TextView;Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;)V

    .line 105
    .line 106
    .line 107
    iget-object p2, p0, Ll/g010;->c:Lv/VText;

    .line 108
    .line 109
    new-instance v0, Ll/f010;

    .line 110
    .line 111
    invoke-direct {v0, p0, p1}, Ll/f010;-><init>(Ll/g010;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 115
    .line 116
    .line 117
    sget-object p2, Ll/uqb0;->b0:Ll/sre0;

    .line 118
    .line 119
    iget-object p2, p2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 120
    .line 121
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 122
    .line 123
    invoke-interface {p2, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isCurrentMessageBlock(Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_2

    .line 128
    .line 129
    iget-object p0, p0, Ll/g010;->f:Landroid/widget/FrameLayout;

    .line 130
    .line 131
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    :cond_2
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g010;->h:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->h0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/c010;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/g010;->e(Ll/c010;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g010;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/g010;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileTextAct;

    .line 2
    .line 3
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {p0, p2, p1, v0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;->X1(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g010;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/w1e;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g010;->d:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/g010;->k:Ll/c010;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/c010;->n0()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/g010;->b:Lv/VScroll;

    .line 13
    .line 14
    new-instance v1, Ll/g010$a;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/g010$a;-><init>(Ll/g010;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lv/VScroll;->d(Lv/VScroll$a;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/g010;->e:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    iget-object v1, p0, Ll/g010;->k:Ll/c010;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/c010;->o0()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Ll/g010;->k:Ll/c010;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/c010;->p0()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 44
    :goto_1
    invoke-static {v0, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
