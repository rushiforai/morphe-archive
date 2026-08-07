.class public Ll/zyp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/wyp;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VImage;

.field public c:Landroid/widget/Button;

.field public d:Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zyp;->d:Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/zyp;II[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zyp;->f(II[I)V

    return-void
.end method

.method public static synthetic b(Ll/zyp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zyp;->i(Landroid/view/View;)V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_id_verification_poster_next_click"

    .line 2
    .line 3
    const-string v0, "p_id_verification_poster_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Ll/zyp;->d:Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;->Z1()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Ll/zyp;->d:Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;->a2()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;->Y1(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zyp;->d:Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/azp;->b(Ll/zyp;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/wyp;)V
    .locals 0

    .line 1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final e()I
    .locals 0
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zyp;->d:Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;->a2()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_2

    .line 8
    .line 9
    invoke-static {}, Ll/e1b;->G0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/m7k;->a()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    sget p0, Ll/dbc0;->E8:I

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    sget p0, Ll/dbc0;->G8:I

    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    sget p0, Ll/dbc0;->F8:I

    .line 28
    .line 29
    return p0

    .line 30
    :cond_2
    invoke-static {}, Ll/e1b;->G0()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_4

    .line 35
    .line 36
    invoke-static {}, Ll/m7k;->a()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_3

    .line 41
    .line 42
    sget p0, Ll/dbc0;->H8:I

    .line 43
    .line 44
    return p0

    .line 45
    :cond_3
    sget p0, Ll/dbc0;->J8:I

    .line 46
    .line 47
    return p0

    .line 48
    :cond_4
    sget p0, Ll/dbc0;->I8:I

    .line 49
    .line 50
    return p0
.end method

.method public final synthetic f(II[I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zyp;->b:Lv/VImage;

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    int-to-float p1, p1

    .line 6
    mul-float/2addr p1, v0

    .line 7
    int-to-float p2, p2

    .line 8
    div-float/2addr p1, p2

    .line 9
    const/4 p2, 0x0

    .line 10
    aget p2, p3, p2

    .line 11
    .line 12
    int-to-float p2, p2

    .line 13
    mul-float/2addr p1, p2

    .line 14
    float-to-int p1, p1

    .line 15
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wyp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zyp;->d(Ll/wyp;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zyp;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/zyp;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p0, Ll/zyp;->d:Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/core/R$string;->O7:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/zyp;->a:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/zyp;->e()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    .line 28
    .line 29
    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 30
    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 34
    .line 35
    iget-object v2, p0, Ll/zyp;->d:Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;

    .line 36
    .line 37
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2, v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 42
    .line 43
    .line 44
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 45
    .line 46
    iget v1, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 47
    .line 48
    iget-object v3, p0, Ll/zyp;->b:Lv/VImage;

    .line 49
    .line 50
    new-instance v4, Ll/xyp;

    .line 51
    .line 52
    invoke-direct {v4, p0, v1, v2}, Ll/xyp;-><init>(Ll/zyp;II)V

    .line 53
    .line 54
    .line 55
    invoke-static {v3, v4}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/zyp;->b:Lv/VImage;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/zyp;->c:Landroid/widget/Button;

    .line 64
    .line 65
    new-instance v1, Ll/yyp;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/yyp;-><init>(Ll/zyp;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/zyp;->d:Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;

    .line 74
    .line 75
    new-instance v1, Ll/zyp$a;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/zyp$a;-><init>(Ll/zyp;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->addSwipeBackListener(Ll/ujh0;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method
