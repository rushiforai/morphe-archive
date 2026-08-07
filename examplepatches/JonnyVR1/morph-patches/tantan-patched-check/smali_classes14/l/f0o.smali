.class public Ll/f0o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/c0o;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lv/VDraweeView;

.field public final b:Landroid/view/View;

.field public c:Ll/c0o;

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:Lv/VText;

.field public h:Landroid/view/View;


# direct methods
.method public constructor <init>(Lv/VDraweeView;Lv/VText;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/f0o;->d:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/f0o;->e:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/f0o;->f:Z

    .line 10
    .line 11
    iput-object p1, p0, Ll/f0o;->a:Lv/VDraweeView;

    .line 12
    .line 13
    iput-object p3, p0, Ll/f0o;->b:Landroid/view/View;

    .line 14
    .line 15
    iput-object p2, p0, Ll/f0o;->g:Lv/VText;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Ll/f0o;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/f0o;->i(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Ll/f0o;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/f0o;->f(Landroid/view/View;)V

    return-void
.end method

.method private e()Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/f0o;->h:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/vwt;->s5()Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;->text:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-nez v3, :cond_2

    .line 24
    .line 25
    iget-object v3, p0, Ll/f0o;->g:Lv/VText;

    .line 26
    .line 27
    iput-object v3, p0, Ll/f0o;->h:Landroid/view/View;

    .line 28
    .line 29
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Ll/f0o;->a:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/f0o;->g:Lv/VText;

    .line 38
    .line 39
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;->text:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;->textColor:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    iget-object v1, p0, Ll/f0o;->g:Lv/VText;

    .line 53
    .line 54
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;->textColor:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 61
    .line 62
    .line 63
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;->backgroundColor:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_3

    .line 70
    .line 71
    iget-object v1, p0, Ll/f0o;->g:Lv/VText;

    .line 72
    .line 73
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;->backgroundColor:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v0}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    iget-object v0, p0, Ll/f0o;->a:Lv/VDraweeView;

    .line 90
    .line 91
    iput-object v0, p0, Ll/f0o;->h:Landroid/view/View;

    .line 92
    .line 93
    iget-object v0, p0, Ll/f0o;->g:Lv/VText;

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/f0o;->a:Lv/VDraweeView;

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 101
    .line 102
    .line 103
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/f0o;->h:Landroid/view/View;

    .line 104
    .line 105
    return-object p0
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/f0o;->c:Ll/c0o;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/c0o;->t3()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/f0o;->f:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/f0o;->b:Landroid/view/View;

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/f0o;->c:Ll/c0o;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/c0o;->n3()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic i(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "context_square"

    .line 2
    .line 3
    iget-object p0, p0, Ll/f0o;->a:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/f0o;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/f0o;->c:Ll/c0o;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Ll/c0o;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f0o;->c:Ll/c0o;

    .line 2
    .line 3
    return-void
.end method

.method public d(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-boolean p1, p0, Ll/f0o;->d:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p0, Ll/f0o;->b:Landroid/view/View;

    .line 9
    .line 10
    iget-boolean v0, p0, Ll/f0o;->f:Z

    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/f0o;->h:Landroid/view/View;

    .line 16
    .line 17
    iget-boolean p0, p0, Ll/f0o;->e:Z

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/f0o;->b:Landroid/view/View;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/f0o;->h:Landroid/view/View;

    .line 30
    .line 31
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/c0o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f0o;->c(Ll/c0o;)V

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

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveTapBarStartLiveConfig;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTapBarStartLiveConfig;->icon:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v0, Ll/e0o;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/e0o;-><init>(Ll/f0o;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/xau;->n(Ljava/lang/String;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public k(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/f0o;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/f0o;->h:Landroid/view/View;

    .line 7
    .line 8
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/f0o;->b:Landroid/view/View;

    .line 12
    .line 13
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iput-boolean p1, p0, Ll/f0o;->f:Z

    .line 18
    .line 19
    iget-object v0, p0, Ll/f0o;->b:Landroid/view/View;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/f0o;->h:Landroid/view/View;

    .line 24
    .line 25
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    :cond_1
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public l(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/f0o;->d:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/f0o;->h:Landroid/view/View;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/f0o;->b:Landroid/view/View;

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/f0o;->e()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/d0o;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/d0o;-><init>(Ll/f0o;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/f0o;->h:Landroid/view/View;

    .line 10
    .line 11
    filled-new-array {p0}, [Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {v0, p0}, Ll/ynp0;->A(Landroid/view/View$OnClickListener;[Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
