.class public Ll/b2x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/y1x;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VImage;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;

.field public e:Lv/VFrame;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VFrame;

.field public j:Lv/VFrame;

.field public k:Lv/VButton;

.field public l:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

.field public m:Ll/y1x;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b2x;->l:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/b2x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b2x;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/b2x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b2x;->i(Landroid/view/View;)V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2x;->m:Ll/y1x;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/y1x;->I0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2x;->m:Ll/y1x;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/y1x;->J0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b2x;->l:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/b2x;->d()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/c2x;->b(Ll/b2x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b2x;->l:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/y1x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b2x;->m:Ll/y1x;

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b2x;->c:Lv/VImage;

    .line 2
    .line 3
    iget-object v1, p0, Ll/b2x;->m:Ll/y1x;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/y1x;->y0()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    sget v1, Ll/kbc0;->z0:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget v1, Ll/kbc0;->y0:I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/b2x;->d:Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;

    .line 20
    .line 21
    iget-object v1, p0, Ll/b2x;->m:Ll/y1x;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/y1x;->s0()Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Ll/b2x;->m:Ll/y1x;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/y1x;->s0()Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const/4 v2, 0x1

    .line 44
    if-le v1, v2, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/b2x;->m()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    const/4 v2, 0x0

    .line 54
    :goto_1
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/b2x;->e:Lv/VFrame;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/b2x;->m()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/b2x;->c:Lv/VImage;

    .line 67
    .line 68
    new-instance v1, Ll/z1x;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/z1x;-><init>(Ll/b2x;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/b2x;->k:Lv/VButton;

    .line 77
    .line 78
    new-instance v1, Ll/a2x;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/a2x;-><init>(Ll/b2x;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/b2x;->m()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    iget-object p0, p0, Ll/b2x;->i:Lv/VFrame;

    .line 93
    .line 94
    const/high16 v0, 0x420c0000    # 35.0f

    .line 95
    .line 96
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 101
    .line 102
    .line 103
    :cond_2
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/y1x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b2x;->e(Ll/y1x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b2x;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b2x;->k:Lv/VButton;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string v1, "\u4fdd\u5b58"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v1, "\u4e0b\u4e00\u6b65"

    .line 9
    .line 10
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/b2x;->l:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->d2()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Ll/b2x;->m:Ll/y1x;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/y1x;->s0()Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Ll/b2x;->m:Ll/y1x;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/y1x;->s0()Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object v0, p0, Ll/b2x;->m:Ll/y1x;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/y1x;->r0()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROFILE_FEATURED_AVATAR_AUTHENTICATION:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 52
    .line 53
    if-ne p1, v0, :cond_1

    .line 54
    .line 55
    iget-object p0, p0, Ll/b2x;->j:Lv/VFrame;

    .line 56
    .line 57
    const/4 p1, 0x0

    .line 58
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    iget-object p0, p0, Ll/b2x;->j:Lv/VFrame;

    .line 63
    .line 64
    const/4 p1, 0x1

    .line 65
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public l(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/b2x;->d:Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;->d(II)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/b2x;->m()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/b2x;->m:Ll/y1x;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/y1x;->x0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    add-int/lit8 v0, p2, 0x1

    .line 21
    .line 22
    sub-int/2addr v0, p1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p0, Ll/b2x;->m:Ll/y1x;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/y1x;->t0()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Ll/ou90;->k(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    :goto_0
    mul-int/lit8 v0, v0, 0x64

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    add-int/2addr p2, v1

    .line 42
    div-int/2addr v0, p2

    .line 43
    rsub-int/lit8 v0, v0, 0x64

    .line 44
    .line 45
    iget-object v2, p0, Ll/b2x;->f:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;

    .line 46
    .line 47
    int-to-float v3, v0

    .line 48
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->setProgress(F)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Ll/b2x;->g:Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Ll/b2x;->g:Landroid/widget/TextView;

    .line 61
    .line 62
    new-instance v2, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v3, "\u5df2\u5b8c\u6210"

    .line 65
    .line 66
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v0, "%"

    .line 73
    .line 74
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/b2x;->m:Ll/y1x;

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/y1x;->x0()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_1

    .line 91
    .line 92
    iget-object p0, p0, Ll/b2x;->h:Landroid/widget/TextView;

    .line 93
    .line 94
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    sub-int/2addr p2, p1

    .line 99
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    const-string p2, "\u518d\u6dfb\u52a0 %d \u9879\u8d44\u6599\uff0c\u4e3a\u4f60\u63a8\u8350\u66f4\u591a\u5408\u9002\u7684\u4eba"

    .line 108
    .line 109
    invoke-static {v0, p2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    :cond_1
    return-void
.end method

.method public final m()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b2x;->l:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->d2()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/b2x;->m:Ll/y1x;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/y1x;->x0()Z

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
