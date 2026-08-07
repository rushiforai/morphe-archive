.class public Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;
.super Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;
    }
.end annotation


# instance fields
.field public A:Z

.field public B:Z

.field public b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

.field public c:Lv/VFrame;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

.field public final f:Landroidx/viewpager/widget/ViewPager$j;

.field public g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

.field public h:I

.field public i:Z

.field public j:Lcom/p1/mobile/putong/data/User;

.field public k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ll/aoh0;

.field public o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

.field public p:Ll/jm50;

.field public q:I

.field public r:Z

.field public s:Z

.field public t:Ll/pzk;

.field public u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

.field public v:Z

.field public w:Ll/kcg0;

.field public x:Ll/kcg0;

.field public y:Landroid/view/View;

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->f:Landroidx/viewpager/widget/ViewPager$j;

    .line 10
    .line 11
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-direct {p1, p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Ll/nl4;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->h:I

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->i:Z

    .line 24
    .line 25
    const-string v0, ""

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->l:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m:Ljava/lang/String;

    .line 30
    .line 31
    const/4 v0, -0x1

    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 33
    .line 34
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r:Z

    .line 35
    .line 36
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->s:Z

    .line 37
    .line 38
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

    .line 39
    .line 40
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

    .line 44
    .line 45
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->v:Z

    .line 46
    .line 47
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->A:Z

    .line 48
    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 50
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->f:Landroidx/viewpager/widget/ViewPager$j;

    .line 52
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Ll/nl4;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    const/4 p1, 0x0

    .line 53
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->h:I

    const/4 p2, 0x1

    .line 54
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->i:Z

    .line 55
    const-string p2, ""

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->l:Ljava/lang/String;

    .line 56
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m:Ljava/lang/String;

    const/4 p2, -0x1

    .line 57
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 58
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r:Z

    .line 59
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->s:Z

    .line 60
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

    .line 61
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->v:Z

    .line 62
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->A:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 63
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 64
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->f:Landroidx/viewpager/widget/ViewPager$j;

    .line 65
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Ll/nl4;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    const/4 p1, 0x0

    .line 66
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->h:I

    const/4 p2, 0x1

    .line 67
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->i:Z

    .line 68
    const-string p2, ""

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->l:Ljava/lang/String;

    .line 69
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m:Ljava/lang/String;

    const/4 p2, -0x1

    .line 70
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 71
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r:Z

    .line 72
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->s:Z

    .line 73
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

    .line 74
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->v:Z

    .line 75
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->A:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->M()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->K(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->N()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->Q(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->P(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Landroid/graphics/Bitmap;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->O(Landroid/graphics/Bitmap;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->s:Z

    return p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->h:I

    return p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    return-object p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->h:I

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->l:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Ll/lb2;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y(Ll/lb2;I)V

    return-void
.end method

.method private setBlurBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/kec0;->I8:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y:Landroid/view/View;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w:Ll/kcg0;

    .line 19
    .line 20
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->x:Ll/kcg0;

    .line 24
    .line 25
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y:Landroid/view/View;

    .line 29
    .line 30
    sget v1, Ll/adc0;->e2:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lv/VImage;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y:Landroid/view/View;

    .line 39
    .line 40
    sget v2, Ll/adc0;->Q6:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lv/VText;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y:Landroid/view/View;

    .line 49
    .line 50
    sget v3, Ll/adc0;->Fb:I

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lv/VText;

    .line 57
    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y:Landroid/view/View;

    .line 59
    .line 60
    sget v4, Ll/adc0;->y1:I

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Lv/VText;

    .line 67
    .line 68
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-eqz v4, :cond_3

    .line 75
    .line 76
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 79
    .line 80
    const-string v5, "female"

    .line 81
    .line 82
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-eqz v4, :cond_0

    .line 87
    .line 88
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    sget v6, Lcom/p1/mobile/putong/core/R$string;->d1:I

    .line 93
    .line 94
    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    goto :goto_0

    .line 99
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    sget v6, Lcom/p1/mobile/putong/core/R$string;->e1:I

    .line 104
    .line 105
    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    :goto_0
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 113
    .line 114
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 115
    .line 116
    invoke-static {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_1

    .line 121
    .line 122
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    sget v4, Lcom/p1/mobile/putong/core/R$string;->b1:I

    .line 127
    .line 128
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    goto :goto_1

    .line 133
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    sget v4, Lcom/p1/mobile/putong/core/R$string;->c1:I

    .line 138
    .line 139
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    :goto_1
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 147
    .line 148
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 149
    .line 150
    invoke-static {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-eqz v1, :cond_2

    .line 155
    .line 156
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    sget v2, Lcom/p1/mobile/putong/core/R$string;->f1:I

    .line 161
    .line 162
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    goto :goto_2

    .line 167
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    sget v2, Lcom/p1/mobile/putong/core/R$string;->g1:I

    .line 172
    .line 173
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    :goto_2
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 181
    .line 182
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 183
    .line 184
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 185
    .line 186
    if-ne v1, v2, :cond_4

    .line 187
    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-nez v1, :cond_4

    .line 197
    .line 198
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 199
    .line 200
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 201
    .line 202
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->w0:Ll/jxd0;

    .line 203
    .line 204
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 205
    .line 206
    invoke-virtual {v1, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    goto :goto_3

    .line 210
    :cond_4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Uk:I

    .line 215
    .line 216
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 221
    .line 222
    .line 223
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 224
    .line 225
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 226
    .line 227
    iget-object v1, v1, Ll/dkb;->W0:Ll/jxd0;

    .line 228
    .line 229
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 230
    .line 231
    invoke-virtual {v1, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    :goto_3
    const/4 v1, 0x1

    .line 235
    sput-boolean v1, Ll/pza0;->w:Z

    .line 236
    .line 237
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 238
    .line 239
    .line 240
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->t:Ll/pzk;

    .line 241
    .line 242
    iget-object p1, p1, Ll/pzk;->g:Lv/VFrame;

    .line 243
    .line 244
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y:Landroid/view/View;

    .line 245
    .line 246
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 247
    .line 248
    .line 249
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y:Landroid/view/View;

    .line 250
    .line 251
    new-instance v0, Ll/xk4;

    .line 252
    .line 253
    invoke-direct {v0, p0}, Ll/xk4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V

    .line 254
    .line 255
    .line 256
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 257
    .line 258
    .line 259
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 260
    .line 261
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 262
    .line 263
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->J0:Lrx/subjects/b;

    .line 264
    .line 265
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 266
    .line 267
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 268
    .line 269
    .line 270
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->A:Z

    .line 271
    .line 272
    sput-boolean v1, Ll/pza0;->v:Z

    .line 273
    .line 274
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 275
    .line 276
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 277
    .line 278
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->z:Ljava/lang/String;

    .line 279
    .line 280
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->S()V

    .line 281
    .line 282
    .line 283
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->B(I)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->V(I)V

    return-void
.end method

.method private w()Lcom/p1/mobile/android/app/Act;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method


# virtual methods
.method public A(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    xor-int/lit8 v1, p1, 0x1

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->setPreferVPagerOnHorizontalConflict(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 12
    .line 13
    xor-int/lit8 p1, p1, 0x1

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lv/VPager;->setScrollble(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final B(I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->W(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->z(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    instance-of v1, p1, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    invoke-static {}, Ll/aia0;->m()Ll/aia0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/aia0;->o()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    invoke-static {}, Ll/aia0;->m()Ll/aia0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, v2}, Ll/aia0;->D(Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    const-string p0, "p_suggest_users_home_view"

    .line 34
    .line 35
    new-array p1, v0, [Ll/sfj0$a;

    .line 36
    .line 37
    const-string v0, "e_clone_profile_photo_ads"

    .line 38
    .line 39
    invoke-static {v0, p0, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 44
    .line 45
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->i:Z

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    invoke-static {}, Ll/asj0;->d0()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r:Z

    .line 56
    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 61
    .line 62
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 63
    .line 64
    if-eqz p0, :cond_3

    .line 65
    .line 66
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/PictureView;->A(Z)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->V()V

    .line 70
    .line 71
    .line 72
    :cond_3
    :goto_0
    return-void
.end method

.method public C(ZZ)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Ll/pza0;->v:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y:Landroid/view/View;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->t:Ll/pzk;

    .line 10
    .line 11
    iget-object v2, v2, Ll/pzk;->g:Lv/VFrame;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->A:Z

    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->J0:Lrx/subjects/b;

    .line 23
    .line 24
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    sget-boolean v1, Ll/pza0;->w:Z

    .line 30
    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    sput-boolean v0, Ll/pza0;->w:Z

    .line 34
    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    const-string p2, "01"

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const-string p2, "02"

    .line 41
    .line 42
    :goto_0
    const-string v0, "play_status"

    .line 43
    .line 44
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    filled-new-array {p2}, [Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    const-string v0, "e_user_guide_flash"

    .line 53
    .line 54
    const-string v1, "p_suggest_users_home_view"

    .line 55
    .line 56
    invoke-static {v0, v1, p2}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 60
    .line 61
    .line 62
    const/4 p2, 0x0

    .line 63
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y:Landroid/view/View;

    .line 64
    .line 65
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->z:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->x()V

    .line 70
    .line 71
    .line 72
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w:Ll/kcg0;

    .line 73
    .line 74
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->x:Ll/kcg0;

    .line 78
    .line 79
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public D()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->U()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/wlj;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/wlj;->r()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->h0()V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_2
    :goto_0
    return v1
.end method

.method public final E()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public F()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 2
    .line 3
    if-ltz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 10
    .line 11
    if-ne v0, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final G(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 18
    .line 19
    iget-object v1, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L6(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlLiveCardPartDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    iget-object p1, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlLiveCardPartDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->getCurrentLive()Lcom/p1/mobile/putong/data/Live;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlLiveCardPartDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->getCurrentLive()Lcom/p1/mobile/putong/data/Live;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 54
    .line 55
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    const/4 v0, 0x1

    .line 62
    :cond_1
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->B:Z

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    :goto_0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->B:Z

    .line 66
    .line 67
    :goto_1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->B:Z

    .line 68
    .line 69
    return p0
.end method

.method public final H()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->p:Ll/jm50;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/jm50;->J()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->p:Ll/jm50;

    .line 16
    .line 17
    invoke-interface {v1}, Ll/jm50;->J()Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v1, Ljava/lang/CharSequence;

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->p:Ll/jm50;

    .line 32
    .line 33
    invoke-interface {p0}, Ll/jm50;->J()Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast p0, Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_0

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public final I(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->M6(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public J()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->A:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic K(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->l:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j0()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    const/4 p1, -0x1

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m:Ljava/lang/String;

    .line 30
    .line 31
    return-void
.end method

.method public final synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->C(ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic M()Landroid/graphics/Bitmap;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Landroid/graphics/Canvas;

    .line 16
    .line 17
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public final synthetic N()Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/dl4;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dl4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final synthetic O(Landroid/graphics/Bitmap;)Lrx/c;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/high16 v1, 0x7d000000

    .line 10
    .line 11
    invoke-static {p1, v0, p0, v1}, Ll/asj0;->p(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic P(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0, p1}, Ll/end0;->a(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Ll/dnd0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget p1, Ll/qa00;->o:I

    .line 14
    .line 15
    int-to-float p1, p1

    .line 16
    invoke-virtual {p0, p1}, Ll/dnd0;->e(F)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public final synthetic Q(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->setBlurBackground(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final R()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->l:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->l:Ljava/lang/String;

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {}, Ll/aia0;->m()Ll/aia0;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const/4 v3, 0x1

    .line 37
    invoke-virtual {v1, v2, v3}, Ll/aia0;->y(Lcom/p1/mobile/android/app/Act;Z)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/el4;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/el4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V

    .line 56
    .line 57
    .line 58
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$d;

    .line 59
    .line 60
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$d;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    return-void
.end method

.method public final S()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 11
    .line 12
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 13
    .line 14
    const/16 v0, 0x11

    .line 15
    .line 16
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 17
    .line 18
    return-void
.end method

.method public T()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->J()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->C(ZZ)V

    .line 10
    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    return v1
.end method

.method public U()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->v:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 16
    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 18
    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->J()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_7

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->t:Ll/pzk;

    .line 45
    .line 46
    iget-object v0, v0, Ll/pzk;->b0:Lv/VImage;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->t:Ll/pzk;

    .line 55
    .line 56
    iget-object v0, v0, Ll/pzk;->b0:Lv/VImage;

    .line 57
    .line 58
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    return v1

    .line 65
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 68
    .line 69
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->G(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_7

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->I(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 87
    .line 88
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 89
    .line 90
    const/4 v3, 0x1

    .line 91
    if-ne v0, v2, :cond_5

    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_5

    .line 102
    .line 103
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->w0:Ll/jxd0;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Ljava/lang/Boolean;

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_5

    .line 120
    .line 121
    return v3

    .line 122
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 123
    .line 124
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 125
    .line 126
    iget-object v0, v0, Ll/dkb;->W0:Ll/jxd0;

    .line 127
    .line 128
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Ljava/lang/Boolean;

    .line 133
    .line 134
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-nez v0, :cond_7

    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 141
    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 143
    .line 144
    if-ne p0, v2, :cond_6

    .line 145
    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    if-eqz p0, :cond_7

    .line 155
    .line 156
    :cond_6
    return v3

    .line 157
    :cond_7
    :goto_0
    return v1
.end method

.method public final V(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->n:Ll/aoh0;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x1

    .line 14
    if-ne v1, p1, :cond_1

    .line 15
    .line 16
    move v1, v3

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v1, v2

    .line 19
    :goto_0
    invoke-interface {v0, p1, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->f(IZ)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->n:Ll/aoh0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/aoh0;->a()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_4

    .line 35
    .line 36
    if-ltz p1, :cond_4

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-lt p1, v1, :cond_2

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 46
    .line 47
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 52
    .line 53
    invoke-interface {v1, p1, v4, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->d(ILcom/p1/mobile/putong/data/Media;Z)V

    .line 54
    .line 55
    .line 56
    add-int/lit8 v1, p1, 0x1

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-ge v1, v2, :cond_3

    .line 63
    .line 64
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 69
    .line 70
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 71
    .line 72
    .line 73
    :cond_3
    sub-int/2addr p1, v3

    .line 74
    if-ltz p1, :cond_4

    .line 75
    .line 76
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 83
    .line 84
    .line 85
    :cond_4
    :goto_1
    return-void
.end method

.method public W(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p0, p1}, Ll/hkl0;->a(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final X(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->e(Lcom/p1/mobile/putong/data/Media;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 15
    .line 16
    const-string v1, "raw"

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {p1, p0}, Ll/nwb;->o(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    instance-of p0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 29
    .line 30
    if-eqz p0, :cond_2

    .line 31
    .line 32
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public Y()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->n:Ll/aoh0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/aoh0;->a()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->e0(I)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->R()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/aoh0;ILl/jm50;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_7

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 14
    .line 15
    const v1, 0x3f333333    # 0.7f

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->setWidthHeightRate(F)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    const/4 v2, 0x0

    .line 25
    const-string v3, ""

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v4, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_3

    .line 38
    .line 39
    :cond_2
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->h:I

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m:Ljava/lang/String;

    .line 42
    .line 43
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 44
    .line 45
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->l:Ljava/lang/String;

    .line 46
    .line 47
    :cond_3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 50
    .line 51
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->n:Ll/aoh0;

    .line 52
    .line 53
    iput-object p5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->p:Ll/jm50;

    .line 54
    .line 55
    new-instance p1, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {p3}, Ll/aoh0;->a()Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    invoke-direct {p1, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 62
    .line 63
    .line 64
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->e0(I)Z

    .line 69
    .line 70
    .line 71
    move-result p3

    .line 72
    if-eqz p3, :cond_4

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->R()V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_4
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m:Ljava/lang/String;

    .line 79
    .line 80
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 81
    .line 82
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->l:Ljava/lang/String;

    .line 83
    .line 84
    :goto_0
    if-nez p4, :cond_6

    .line 85
    .line 86
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 87
    .line 88
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 89
    .line 90
    .line 91
    move-result p4

    .line 92
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y(Ll/lb2;I)V

    .line 93
    .line 94
    .line 95
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 96
    .line 97
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->J(Ljava/util/List;)V

    .line 98
    .line 99
    .line 100
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->h:I

    .line 101
    .line 102
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->d0(IZ)V

    .line 103
    .line 104
    .line 105
    if-eqz p5, :cond_5

    .line 106
    .line 107
    invoke-interface {p5}, Ll/jm50;->l()Ll/qmj0;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    if-eqz p1, :cond_5

    .line 112
    .line 113
    invoke-interface {p5}, Ll/jm50;->l()Ll/qmj0;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 118
    .line 119
    invoke-virtual {p1, p3}, Ll/qmj0;->p(Landroid/view/View;)V

    .line 120
    .line 121
    .line 122
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 123
    .line 124
    new-instance p3, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$b;

    .line 125
    .line 126
    invoke-direct {p3, p0, p5}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Ll/jm50;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 130
    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_6
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 134
    .line 135
    new-instance p4, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$c;

    .line 136
    .line 137
    invoke-direct {p4, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$c;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Ljava/util/List;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p3, p4}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 141
    .line 142
    .line 143
    :goto_1
    iget-object p1, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 144
    .line 145
    sget-object p2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 146
    .line 147
    if-eq p1, p2, :cond_7

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->D()Z

    .line 150
    .line 151
    .line 152
    :cond_7
    :goto_2
    return-void
.end method

.method public a0(Ll/aoh0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->n:Ll/aoh0;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 4
    .line 5
    return-void
.end method

.method public b0()V
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->J()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y:Landroid/view/View;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->t:Ll/pzk;

    .line 12
    .line 13
    iget-object v1, v1, Ll/pzk;->g:Lv/VFrame;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->A:Z

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->y:Landroid/view/View;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w:Ll/kcg0;

    .line 25
    .line 26
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->x:Ll/kcg0;

    .line 30
    .line 31
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    :catch_0
    :cond_0
    return-void
.end method

.method public c0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->n:Ll/aoh0;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->r:Z

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 21
    .line 22
    const-string v0, ""

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->l:Ljava/lang/String;

    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public d0(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0, p1, p2}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->b(I)V

    .line 14
    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method public final e0(I)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    return v1

    .line 23
    :cond_0
    const/4 v0, 0x2

    .line 24
    if-ge p1, v0, :cond_1

    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->H()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    return v1

    .line 34
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->E()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_3

    .line 39
    .line 40
    return v1

    .line 41
    :cond_3
    invoke-static {}, Ll/aia0;->m()Ll/aia0;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ll/aia0;->p(Lcom/p1/mobile/putong/data/User;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0
.end method

.method public f0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->T()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->D()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 25
    .line 26
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->a(I)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    :goto_0
    return-void

    .line 33
    :cond_3
    const/4 v0, 0x0

    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g0(Z)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_4

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 41
    .line 42
    if-eqz v2, :cond_4

    .line 43
    .line 44
    invoke-interface {v2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->c(Z)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 48
    .line 49
    const-string v2, ""

    .line 50
    .line 51
    const/4 v3, 0x1

    .line 52
    if-eqz v0, :cond_5

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 55
    .line 56
    sget-object v4, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 57
    .line 58
    if-ne v0, v4, :cond_5

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_5

    .line 69
    .line 70
    const-string v0, "p_suggest_users_home_view"

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 73
    .line 74
    invoke-static {v0, v1, v3, p0, v2}, Ll/pza0;->g(Ljava/lang/String;ZZLcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_5
    const-string v0, "p_suggest_user_profile_info_view"

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 81
    .line 82
    invoke-static {v0, v1, v3, p0, v2}, Ll/pza0;->g(Ljava/lang/String;ZZLcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final g0(Z)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_c

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->n:Ll/aoh0;

    .line 7
    .line 8
    if-eqz v0, :cond_c

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    goto/16 :goto_4

    .line 15
    .line 16
    :cond_0
    invoke-virtual {v0}, Ll/aoh0;->a()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_c

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    goto/16 :goto_4

    .line 29
    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    add-int/lit8 v3, v2, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    add-int/lit8 v3, v2, -0x1

    .line 40
    .line 41
    :goto_0
    const/4 v4, 0x1

    .line 42
    if-gez v3, :cond_3

    .line 43
    .line 44
    move v3, v1

    .line 45
    goto :goto_1

    .line 46
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    if-lt v3, v5, :cond_4

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    sub-int/2addr v3, v4

    .line 57
    :cond_4
    :goto_1
    if-ne v2, v3, :cond_6

    .line 58
    .line 59
    if-eqz p1, :cond_5

    .line 60
    .line 61
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 62
    .line 63
    if-lez v5, :cond_5

    .line 64
    .line 65
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 66
    .line 67
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->y(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;)Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    if-ge v2, v5, :cond_5

    .line 76
    .line 77
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 78
    .line 79
    move v2, v4

    .line 80
    goto :goto_2

    .line 81
    :cond_5
    move v2, v1

    .line 82
    :goto_2
    if-nez v2, :cond_7

    .line 83
    .line 84
    return v1

    .line 85
    :cond_6
    move v2, v1

    .line 86
    :cond_7
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 87
    .line 88
    invoke-virtual {v5, v3, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 89
    .line 90
    .line 91
    if-nez v2, :cond_8

    .line 92
    .line 93
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 94
    .line 95
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    check-cast v6, Lcom/p1/mobile/putong/data/Media;

    .line 100
    .line 101
    invoke-interface {v5, v3, v6, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->d(ILcom/p1/mobile/putong/data/Media;Z)V

    .line 102
    .line 103
    .line 104
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 105
    .line 106
    if-eqz v1, :cond_9

    .line 107
    .line 108
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->b(I)V

    .line 109
    .line 110
    .line 111
    :cond_9
    if-nez v2, :cond_b

    .line 112
    .line 113
    if-eqz p1, :cond_a

    .line 114
    .line 115
    add-int/lit8 v1, v3, 0x1

    .line 116
    .line 117
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    if-ge v1, v2, :cond_a

    .line 122
    .line 123
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 128
    .line 129
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 130
    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_a
    if-nez p1, :cond_b

    .line 134
    .line 135
    sub-int/2addr v3, v4

    .line 136
    if-ltz v3, :cond_b

    .line 137
    .line 138
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 143
    .line 144
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 145
    .line 146
    .line 147
    :cond_b
    :goto_3
    return v4

    .line 148
    :cond_c
    :goto_4
    return v1
.end method

.method public getCurrentItem()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getCurrentPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->z(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public h0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_card_guide_overlay"

    .line 5
    .line 6
    const-string v2, "p_suggest_users_home_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentPosition()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ll/asj0;->d0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->U()V

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w:Ll/kcg0;

    .line 49
    .line 50
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/yk4;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/yk4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V

    .line 56
    .line 57
    .line 58
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lrx/c;

    .line 67
    .line 68
    invoke-static {}, Ll/psd0;->R()Lrx/c$d;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v0, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v2, Ll/zk4;

    .line 85
    .line 86
    invoke-direct {v2, p0}, Ll/zk4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {}, Ll/psd0;->y()Lrx/c$d;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v0, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    new-instance v2, Ll/al4;

    .line 102
    .line 103
    invoke-direct {v2, p0}, Ll/al4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/bl4;

    .line 115
    .line 116
    invoke-direct {v1, p0}, Ll/bl4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V

    .line 117
    .line 118
    .line 119
    new-instance v2, Ll/cl4;

    .line 120
    .line 121
    invoke-direct {v2}, Ll/cl4;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->w:Ll/kcg0;

    .line 133
    .line 134
    return-void
.end method

.method public i0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->T()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->D()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 25
    .line 26
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->a(I)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    :goto_0
    return-void

    .line 33
    :cond_3
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g0(Z)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_4

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 41
    .line 42
    if-eqz v2, :cond_4

    .line 43
    .line 44
    invoke-interface {v2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->c(Z)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 48
    .line 49
    const-string v2, ""

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    if-eqz v0, :cond_5

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 55
    .line 56
    sget-object v4, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 57
    .line 58
    if-ne v0, v4, :cond_5

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_5

    .line 69
    .line 70
    const-string v0, "p_suggest_users_home_view"

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 73
    .line 74
    invoke-static {v0, v1, v3, p0, v2}, Ll/pza0;->g(Ljava/lang/String;ZZLcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_5
    const-string v0, "p_suggest_user_profile_info_view"

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 81
    .line 82
    invoke-static {v0, v1, v3, p0, v2}, Ll/pza0;->g(Ljava/lang/String;ZZLcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public j0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->H()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/aia0;->m()Ll/aia0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/aia0;->p(Lcom/p1/mobile/putong/data/User;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->m:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->y(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

    .line 44
    .line 45
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    new-instance v0, Ljava/util/ArrayList;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->n:Ll/aoh0;

    .line 54
    .line 55
    invoke-virtual {v1}, Ll/aoh0;->a()Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

    .line 69
    .line 70
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->J(Ljava/util/List;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 79
    .line 80
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 89
    .line 90
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->y(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;)Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/AdmobMedia;

    .line 95
    .line 96
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_1

    .line 101
    .line 102
    new-instance v0, Ljava/util/ArrayList;

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->n:Ll/aoh0;

    .line 105
    .line 106
    invoke-virtual {v1}, Ll/aoh0;->a()Ljava/util/List;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 111
    .line 112
    .line 113
    const/4 v1, -0x1

    .line 114
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->q:I

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->g:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 117
    .line 118
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->J(Ljava/util/List;)V

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 122
    .line 123
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 128
    .line 129
    .line 130
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->v(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 8
    .line 9
    const v1, 0x3f19999a    # 0.6f

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->setWidthHeightRate(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->setPreferVPagerOnHorizontalConflict(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Lv/VPager;->setScrollble(Z)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lv/VPager;->setAllowZoom(Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public setAutoPlayEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCardStyleChangeProgress(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->k:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    sget v0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->w:F

    .line 12
    .line 13
    const v1, 0x3f19999a    # 0.6f

    .line 14
    .line 15
    .line 16
    cmpl-float v2, v0, v1

    .line 17
    .line 18
    if-lez v2, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 21
    .line 22
    sub-float/2addr v0, v1

    .line 23
    mul-float/2addr v0, p1

    .line 24
    add-float/2addr v0, v1

    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;->setWidthHeightRate(F)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public setCertBtnShowing(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->s:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->A:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    xor-int/lit8 v1, p1, 0x1

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->B:Landroid/view/View;

    .line 17
    .line 18
    xor-int/lit8 p1, p1, 0x1

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public setParentHolder(Ll/pzk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->t:Ll/pzk;

    .line 2
    .line 3
    return-void
.end method

.method public final v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ol4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public x()V
    .locals 1

    .line 1
    invoke-static {}, Ll/asj0;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->V()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final y(Ll/lb2;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->i()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->f:Landroidx/viewpager/widget/ViewPager$j;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setupWithPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 35
    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    if-le p2, p1, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 p1, 0x0

    .line 42
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->d:Landroid/widget/FrameLayout;

    .line 43
    .line 44
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setSelectedIndex(I)V

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_1
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->T()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->D()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->o:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->b()V

    .line 20
    .line 21
    .line 22
    :cond_2
    :goto_0
    return-void
.end method
