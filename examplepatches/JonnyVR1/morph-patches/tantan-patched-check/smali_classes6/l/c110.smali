.class public Ll/c110;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ky00;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VList;

.field public c:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VDraweeView;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Landroid/view/View;

.field public o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

.field public p:Ll/tx00;

.field public q:Ll/ky00;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c110;->o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 5
    .line 6
    return-void
.end method

.method private synthetic E(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/c110;->q:Ll/ky00;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/ky00;->z0()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Ll/c110;->q:Ll/ky00;

    .line 10
    .line 11
    iget-boolean p1, p1, Ll/ky00;->c:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/c110;->o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/c110;->o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 23
    .line 24
    iget-object p0, p0, Ll/c110;->q:Ll/ky00;

    .line 25
    .line 26
    iget-object p0, p0, Ll/ky00;->a:Ljava/lang/String;

    .line 27
    .line 28
    const-string v0, "moments_in_profile"

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-static {p1, p0, v0, v1}, Ll/orb0;->h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic F(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/a110;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/a110;-><init>(Ll/c110;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/c110;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c110;->C(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    return-void
.end method

.method public static synthetic b(Ll/c110;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c110;->z(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 6

    .line 1
    if-eqz p3, :cond_1

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    if-eq p3, p1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->pickVideoWithPicker(Z)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_1
    const/4 v4, 0x0

    .line 12
    const-string v5, "moments"

    .line 13
    .line 14
    const/16 v1, 0x9

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    const/4 v3, 0x0

    .line 18
    move-object v0, p0

    .line 19
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/k110;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    new-array p1, p1, [Lcom/p1/mobile/putong/data/Media;

    .line 9
    .line 10
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/CaptionAct;->Y1(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/16 v0, 0x32

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public static synthetic e(Ll/c110;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c110;->E(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/c110;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c110;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/c110;[ILandroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c110;->A([ILandroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic j(Ll/c110;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c110;->H(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/c110;Lcom/p1/mobile/putong/data/Picture$ImageUri;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c110;->B(Lcom/p1/mobile/putong/data/Picture$ImageUri;[I)V

    return-void
.end method

.method public static synthetic l(Ll/c110;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c110;->G()V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/k110;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->T4:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->U4:I

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/b110;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/b110;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic n(Ll/c110;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c110;->y([I)V

    return-void
.end method


# virtual methods
.method public final synthetic A([ILandroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    aget v0, p1, v0

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    aget p1, p1, v1

    .line 12
    .line 13
    iget-object v1, p0, Ll/c110;->o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget v2, Ll/k9c0;->U:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/high16 v2, 0x40800000    # 4.0f

    .line 26
    .line 27
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-static {p2, v0, p1, v1, v2}, Ll/bsj0;->q(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance p2, Ll/s010;

    .line 36
    .line 37
    invoke-direct {p2, p0, p1}, Ll/s010;-><init>(Ll/c110;Landroid/graphics/Bitmap;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p2}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final synthetic B(Lcom/p1/mobile/putong/data/Picture$ImageUri;[I)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    new-instance v1, Ll/r010;

    .line 4
    .line 5
    invoke-direct {v1, p0, p2}, Ll/r010;-><init>(Ll/c110;[I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, v1}, Ll/fsb0;->G(Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic C(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c110;->e:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/v010;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/v010;-><init>(Ll/c110;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/c110;->o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic G()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/c110;->b:Lv/VList;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0, v0}, Landroid/widget/AbsListView;->setSelectionFromTop(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic H(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/c110;->o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    const/4 v0, 0x3

    .line 5
    invoke-static {p0, p1, p2, p2, v0}, Ll/orb0;->d(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    new-instance v0, Ll/t010;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/t010;-><init>(Ll/c110;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public J(Ll/vg60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/c110;->p:Ll/tx00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tx00;->s(Ll/vg60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/c110;->f:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x4

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/c110;->q:Ll/ky00;

    .line 17
    .line 18
    iget-object v0, v0, Ll/ky00;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Ll/c110;->f:Lv/VText;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/c110;->o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-boolean p1, p1, Lcom/p1/mobile/android/app/c;->b:Z

    .line 39
    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Ll/c110;->f:Lv/VText;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Ll/c110;->f:Lv/VText;

    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    new-array v9, p1, [F

    .line 52
    .line 53
    const/high16 p1, 0x3f800000    # 1.0f

    .line 54
    .line 55
    aput p1, v9, v0

    .line 56
    .line 57
    const-string v3, "alpha"

    .line 58
    .line 59
    const-wide/16 v4, 0x64

    .line 60
    .line 61
    const-wide/16 v6, 0x12c

    .line 62
    .line 63
    const/4 v8, 0x0

    .line 64
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    iget-object v0, p0, Ll/c110;->f:Lv/VText;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_2

    .line 79
    .line 80
    if-eqz p1, :cond_1

    .line 81
    .line 82
    iget-object v0, p0, Ll/c110;->q:Ll/ky00;

    .line 83
    .line 84
    iget-object v0, v0, Ll/ky00;->a:Ljava/lang/String;

    .line 85
    .line 86
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    :cond_1
    iget-object p1, p0, Ll/c110;->f:Lv/VText;

    .line 93
    .line 94
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 95
    .line 96
    .line 97
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/c110;->o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 98
    .line 99
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->invalidateOptionsMenu()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c110;->o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 2
    .line 3
    iget-object v1, p0, Ll/c110;->c:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/c110;->M(Lcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p2, p0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    new-instance p0, Ll/y010;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ll/y010;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Ll/z010;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/z010;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public N(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c110;->n:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/c110;->n:Landroid/view/View;

    .line 8
    .line 9
    new-instance v1, Ll/w010;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/w010;-><init>(Ll/c110;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
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
    check-cast p1, Ll/ky00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/c110;->s(Ll/ky00;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c110;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p0, Ll/c110;->o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/c110;->b:Lv/VList;

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Ll/c110;->q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/c110;->k:Lv/VText;

    .line 17
    .line 18
    iput-object v0, p0, Ll/c110;->n:Landroid/view/View;

    .line 19
    .line 20
    sget v0, Ll/tec0;->u4:I

    .line 21
    .line 22
    iget-object v1, p0, Ll/c110;->b:Lv/VList;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/c110;->m:Landroid/view/View;

    .line 30
    .line 31
    const/4 v1, -0x1

    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/c110;->b:Lv/VList;

    .line 36
    .line 37
    new-instance v3, Ll/q010;

    .line 38
    .line 39
    invoke-direct {v3, p0}, Ll/q010;-><init>(Ll/c110;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v3}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 43
    .line 44
    .line 45
    sget v0, Ll/tec0;->z0:I

    .line 46
    .line 47
    iget-object v3, p0, Ll/c110;->b:Lv/VList;

    .line 48
    .line 49
    invoke-virtual {p1, v0, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Ll/c110;->l:Landroid/view/View;

    .line 54
    .line 55
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 56
    .line 57
    .line 58
    return-object p2
.end method

.method public p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/d110;->b(Ll/c110;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/e110;->b(Ll/c110;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 4

    .line 1
    new-instance v0, Ll/tx00;

    .line 2
    .line 3
    iget-object v1, p0, Ll/c110;->o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/tx00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/c110;->p:Ll/tx00;

    .line 9
    .line 10
    iget-object v0, p0, Ll/c110;->b:Lv/VList;

    .line 11
    .line 12
    const-string v1, "MomentsInProfileViewModel"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lv/VList;->setCrashLogFlag(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/c110;->b:Lv/VList;

    .line 18
    .line 19
    iget-object v1, p0, Ll/c110;->p:Ll/tx00;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/c110;->b:Lv/VList;

    .line 25
    .line 26
    new-instance v1, Ll/c110$a;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/c110$a;-><init>(Ll/c110;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/c110;->n:Landroid/view/View;

    .line 35
    .line 36
    const/16 v1, 0x8

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/c110;->h:Lv/VDraweeView;

    .line 42
    .line 43
    iget-object v1, p0, Ll/c110;->j:Lv/VText;

    .line 44
    .line 45
    const/4 v2, 0x2

    .line 46
    new-array v2, v2, [Landroid/view/View;

    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    aput-object v0, v2, v3

    .line 50
    .line 51
    const/4 v0, 0x1

    .line 52
    aput-object v1, v2, v0

    .line 53
    .line 54
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/x010;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/x010;-><init>(Ll/c110;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public s(Ll/ky00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c110;->q:Ll/ky00;

    .line 2
    .line 3
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/c110;->n:Landroid/view/View;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/c110;->c:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/c110;->h:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/u010;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Ll/u010;-><init>(Ll/c110;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c110;->q:Ll/ky00;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/ky00;->c:Z

    .line 4
    .line 5
    iget-object v1, p0, Ll/c110;->o:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->c4:I

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->p:I

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object v0, p0, Ll/c110;->j:Lv/VText;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->getGPMemo(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    iget-object v1, p0, Ll/c110;->j:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 49
    .line 50
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 51
    .line 52
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object p0, p0, Ll/c110;->i:Lv/VImage;

    .line 57
    .line 58
    invoke-interface {v0, v1, p1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic y([I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/c110;->m:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aget p1, p1, v0

    .line 5
    .line 6
    const/high16 v0, 0x43480000    # 200.0f

    .line 7
    .line 8
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    sub-int/2addr p1, v0

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setMinimumHeight(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic z(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c110;->e:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
