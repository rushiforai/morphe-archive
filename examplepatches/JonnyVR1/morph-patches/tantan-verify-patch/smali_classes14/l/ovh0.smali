.class public Ll/ovh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Lv/VDraweeView;

.field public d:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

.field public final e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;

.field public final g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

.field public h:Lcom/p1/mobile/putong/camera/TTCameraConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;Landroid/view/View;Lcom/p1/mobile/putong/camera/TTCameraConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;)V
    .locals 2
    .param p3    # Lcom/p1/mobile/putong/camera/TTCameraConfig;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/ovh0;->e:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p1, p0, Ll/ovh0;->g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    .line 15
    .line 16
    iput-object p3, p0, Ll/ovh0;->h:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 17
    .line 18
    iput-object p4, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 19
    .line 20
    sget v0, Ll/xcc0;->e:I

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/widget/TextView;

    .line 27
    .line 28
    iput-object v0, p0, Ll/ovh0;->a:Landroid/widget/TextView;

    .line 29
    .line 30
    sget v0, Ll/xcc0;->c:I

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Landroid/widget/TextView;

    .line 37
    .line 38
    iput-object v0, p0, Ll/ovh0;->b:Landroid/widget/TextView;

    .line 39
    .line 40
    sget v0, Ll/xcc0;->n:I

    .line 41
    .line 42
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lv/VDraweeView;

    .line 47
    .line 48
    iput-object v0, p0, Ll/ovh0;->c:Lv/VDraweeView;

    .line 49
    .line 50
    sget v0, Ll/xcc0;->q:I

    .line 51
    .line 52
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    check-cast p2, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 57
    .line 58
    iput-object p2, p0, Ll/ovh0;->d:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 59
    .line 60
    sget v0, Ll/qa00;->i:I

    .line 61
    .line 62
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->setRadius(I)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Ll/ovh0;->b:Landroid/widget/TextView;

    .line 66
    .line 67
    new-instance v0, Ll/lvh0;

    .line 68
    .line 69
    invoke-direct {v0, p0, p4, p1}, Ll/lvh0;-><init>(Ll/ovh0;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;)V

    .line 70
    .line 71
    .line 72
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/ovh0;->a:Landroid/widget/TextView;

    .line 76
    .line 77
    new-instance p2, Ll/mvh0;

    .line 78
    .line 79
    invoke-direct {p2, p0}, Ll/mvh0;-><init>(Ll/ovh0;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/ovh0;->a:Landroid/widget/TextView;

    .line 86
    .line 87
    const/4 p2, 0x0

    .line 88
    const/4 v0, 0x1

    .line 89
    if-eqz p3, :cond_0

    .line 90
    .line 91
    move p3, v0

    .line 92
    goto :goto_0

    .line 93
    :cond_0
    move p3, p2

    .line 94
    :goto_0
    invoke-static {p1, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/ovh0;->d:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 98
    .line 99
    invoke-virtual {p4}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->g()I

    .line 100
    .line 101
    .line 102
    move-result p3

    .line 103
    const/4 v1, 0x2

    .line 104
    if-ne p3, v1, :cond_1

    .line 105
    .line 106
    move p3, v0

    .line 107
    goto :goto_1

    .line 108
    :cond_1
    move p3, p2

    .line 109
    :goto_1
    invoke-static {p1, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Ll/ovh0;->c:Lv/VDraweeView;

    .line 113
    .line 114
    invoke-virtual {p4}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->g()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-ne p1, v0, :cond_2

    .line 119
    .line 120
    move p2, v0

    .line 121
    :cond_2
    invoke-static {p0, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public static synthetic a(Ll/ovh0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ovh0;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/ovh0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ovh0;->i()V

    return-void
.end method

.method public static synthetic c(Ll/ovh0;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ovh0;->e(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ovh0;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ovh0;->g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ovh0;->g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ovh0;->f:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->p0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ovh0;->d:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->o()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->m()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ovh0;->f:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->z0()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ovh0;->g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ovh0;->d(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;)V

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

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ovh0;->g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ovh0;->g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ovh0;->g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ovh0;->g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ovh0;->g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/camera/R$string;->f:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final n()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->h()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "live-web"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->h()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "webApiFlag"

    .line 30
    .line 31
    const-string v2, "flag"

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->s(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object v0, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->g()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/4 v1, 0x2

    .line 57
    if-ne v0, v1, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Ll/ovh0;->d:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 60
    .line 61
    iget-object v1, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->h()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->setCoverUrl(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/ovh0;->d:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->n()V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 77
    .line 78
    iget-object v1, p0, Ll/ovh0;->c:Lv/VDraweeView;

    .line 79
    .line 80
    iget-object p0, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->h()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const/4 v2, 0x0

    .line 87
    invoke-virtual {v0, v1, p0, v2}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/ovh0;->f:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->n0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/ovh0;->d:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 18
    .line 19
    iget-object p0, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->h()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->l(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->k()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Ll/ovh0;->f:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->o0()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-object v0, p0, Ll/ovh0;->d:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 44
    .line 45
    iget-object p0, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->h()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->l(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    iget-object v0, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->k()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    iget-object p0, p0, Ll/ovh0;->f:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->o0()V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    iget-object v0, p0, Ll/ovh0;->d:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 70
    .line 71
    iget-object p0, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->h()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->l(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ovh0;->g:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewAndUploadAct;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ovh0;->h:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 4
    .line 5
    new-instance v2, Ll/nvh0;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ll/nvh0;-><init>(Ll/ovh0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/camera/TTCameraAct;->c2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/camera/TTCameraConfig;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public s()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->h()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/ovh0;->i:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->n()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ovh0;->p()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/ovh0;->n()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ovh0;->d:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->o()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
