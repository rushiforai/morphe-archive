.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Landroid/view/View;

.field public d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

.field public e:Lv/VText;

.field public f:Landroid/view/View;

.field public g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroid/view/View;

.field public k:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

.field public l:Lcom/tantan/library/svga/SVGAnimationView;

.field public m:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
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

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->E0()V

    return-void
.end method

.method public static synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->z0()V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;ILcom/p1/mobile/putong/data/Media;Ll/p8b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->w0(ILcom/p1/mobile/putong/data/Media;Ll/p8b;)V

    return-void
.end method

.method public static synthetic V(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p1, Ll/tk5$a;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/tk5$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "\u4e0a\u4f20\u540e\u5c55\u793a\u5728\u4f60\u7684\u8d44\u6599\u9875\u4e2d"

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Ll/tk5$a;->k(Ljava/lang/CharSequence;)Ll/tk5$a;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "\u5c55\u793a\u66f4\u591a\u7167\u7247\uff0c\u8ba4\u8bc6\u66f4\u591a\u771f\u5b9e\u7684\u4eba"

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/tk5$a;->j(Ljava/lang/CharSequence;)Ll/tk5$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "\u6211\u77e5\u9053\u4e86"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/tk5$a;->h(Ljava/lang/CharSequence;)Ll/tk5$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-virtual {p0, p1}, Ll/tk5$a;->i(Z)Ll/tk5$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget v0, Ll/qa00;->W:I

    .line 30
    .line 31
    invoke-virtual {p0, v0, v0}, Ll/tk5$a;->g(II)Ll/tk5$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkNRQTJBQ1NGVkZJVzdTRk1ENE0yMkVGTUIyRjJPRTE0IiwidyI6NTM0LCJoIjo1MzQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMjM4MzAyMzE3NDAyMDk4OTU3fQ.png"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/tk5$a;->f(Ljava/lang/String;)Ll/tk5$a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v0, ""

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/tk5$a;->e(Ljava/lang/String;)Ll/tk5$a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {v0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    filled-new-array {v0}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/tk5$a;->d([Ll/pf60;)Ll/tk5$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0, p1}, Ll/tk5$a;->b(Z)Ll/tk5$a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ll/tk5$a;->a()Ll/tk5;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/tk5;->show()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->G0()V

    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;ILcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/NewTags;Ll/p8b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->A0(ILcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/NewTags;Ll/p8b;)V

    return-void
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Ll/p8b;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->O0(Ll/p8b;II)V

    return-void
.end method

.method public static synthetic a0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Ll/p8b;IILcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->x0(Ll/p8b;IILcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;ILcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->H0(ILcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic c0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;ILl/p8b;Ljava/lang/String;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->D0(Lcom/p1/mobile/android/app/Act;ILl/p8b;Ljava/lang/String;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic e0(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/xwa;->f(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/data/RealPictureInfo;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Ljava/lang/String;Ll/p8b;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->L0(Ljava/lang/String;Ll/p8b;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;Ll/p8b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->K0(Lcom/p1/mobile/android/app/Act;Ll/p8b;)V

    return-void
.end method

.method public static synthetic j0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->v0()V

    return-void
.end method

.method public static synthetic l0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->u0()V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->y0()V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;Ll/p8b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->I0(Lcom/p1/mobile/android/app/Act;Ll/p8b;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Ll/p8b;IILcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->B0(Ll/p8b;IILcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;ILl/p8b;Lcom/p1/mobile/putong/core/data/RealPictureInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->N0(Lcom/p1/mobile/android/app/Act;ILl/p8b;Lcom/p1/mobile/putong/core/data/RealPictureInfo;)V

    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;Ll/p8b;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->M0(Lcom/p1/mobile/android/app/Act;Ll/p8b;Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;Ll/p8b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->J0(Lcom/p1/mobile/android/app/Act;Ll/p8b;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A0(ILcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/NewTags;Ll/p8b;)V
    .locals 6

    .line 1
    const-string v0, "is_outdoor_full_uploaded"

    .line 2
    .line 3
    const-string v1, "task_center_photo_type"

    .line 4
    .line 5
    const-string v2, "e_task_center_upload_photo_success"

    .line 6
    .line 7
    const-string v3, "\u5ba1\u6838\u4e2d"

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    const/4 v5, 0x2

    .line 11
    if-ne p1, v5, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 14
    .line 15
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 19
    .line 20
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1, v5, v3, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 26
    .line 27
    new-instance p2, Ll/z8b;

    .line 28
    .line 29
    invoke-direct {p2, p0}, Ll/z8b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setRefusedClickCallback(Ll/x20;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 36
    .line 37
    new-instance p2, Ll/a9b;

    .line 38
    .line 39
    invoke-direct {p2}, Ll/a9b;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    if-eqz p3, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->h:Lv/VText;

    .line 48
    .line 49
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->h:Lv/VText;

    .line 53
    .line 54
    iget-object p2, p3, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    invoke-virtual {p4}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-string p2, "full"

    .line 68
    .line 69
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 74
    .line 75
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    filled-new-array {p2, p0}, [Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {v2, p1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_1
    if-ne p1, v4, :cond_3

    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 98
    .line 99
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 103
    .line 104
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {p1, v5, v3, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 110
    .line 111
    new-instance p2, Ll/b9b;

    .line 112
    .line 113
    invoke-direct {p2, p0}, Ll/b9b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setRefusedClickCallback(Ll/x20;)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 120
    .line 121
    new-instance p2, Ll/c9b;

    .line 122
    .line 123
    invoke-direct {p2}, Ll/c9b;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    if-eqz p3, :cond_2

    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->e:Lv/VText;

    .line 132
    .line 133
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->e:Lv/VText;

    .line 137
    .line 138
    iget-object p2, p3, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    :cond_2
    invoke-virtual {p4}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    const-string p2, "outdoor"

    .line 152
    .line 153
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 158
    .line 159
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    filled-new-array {p2, p0}, [Ll/pf60;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-static {v2, p1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 176
    .line 177
    .line 178
    :cond_3
    return-void
.end method

.method public final synthetic B0(Ll/p8b;IILcom/p1/mobile/putong/data/Media;)V
    .locals 8

    .line 1
    iget-object v0, p4, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p4, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/gj40;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :goto_0
    move-object v5, v0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    goto :goto_0

    .line 30
    :goto_1
    new-instance v1, Ll/y8b;

    .line 31
    .line 32
    move-object v2, p0

    .line 33
    move-object v6, p1

    .line 34
    move v3, p2

    .line 35
    move-object v4, p4

    .line 36
    invoke-direct/range {v1 .. v6}, Ll/y8b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;ILcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/NewTags;Ll/p8b;)V

    .line 37
    .line 38
    .line 39
    move-object v7, v1

    .line 40
    move-object v1, v2

    .line 41
    move-object v2, v6

    .line 42
    move-object v6, v5

    .line 43
    move-object v5, v4

    .line 44
    move v4, p3

    .line 45
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->U0(Ll/p8b;IILcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/NewTags;Ll/x20;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic D0(Lcom/p1/mobile/android/app/Act;ILl/p8b;Ljava/lang/String;IILandroid/content/Intent;)Z
    .locals 6

    .line 1
    const/4 p5, -0x1

    .line 2
    if-ne p6, p5, :cond_0

    .line 3
    .line 4
    const-string p6, "EXTRA_REPLACE_INDEX"

    .line 5
    .line 6
    invoke-virtual {p7, p6, p5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 7
    .line 8
    .line 9
    move-result v4

    .line 10
    move-object v0, p0

    .line 11
    move-object v1, p1

    .line 12
    move v2, p2

    .line 13
    move-object v3, p3

    .line 14
    move-object v5, p4

    .line 15
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->Y0(Lcom/p1/mobile/android/app/Act;ILl/p8b;ILjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public final synthetic E0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->f:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic G0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->c:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic H0(ILcom/p1/mobile/putong/data/Media;)V
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    const-string v2, "\u4e0a\u4f20\u5931\u8d25"

    .line 4
    .line 5
    const/4 v3, 0x5

    .line 6
    const/4 v4, 0x1

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 10
    .line 11
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 15
    .line 16
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, v3, v2, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 22
    .line 23
    new-instance p2, Ll/j9b;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/j9b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setRefusedClickCallback(Ll/x20;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 32
    .line 33
    new-instance p2, Ll/k9b;

    .line 34
    .line 35
    invoke-direct {p2}, Ll/k9b;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->h:Lv/VText;

    .line 42
    .line 43
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    if-ne p1, v4, :cond_1

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 50
    .line 51
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 55
    .line 56
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p1, v3, v2, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 62
    .line 63
    new-instance p2, Ll/l9b;

    .line 64
    .line 65
    invoke-direct {p2, p0}, Ll/l9b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setRefusedClickCallback(Ll/x20;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 72
    .line 73
    new-instance p2, Ll/m9b;

    .line 74
    .line 75
    invoke-direct {p2}, Ll/m9b;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->e:Lv/VText;

    .line 82
    .line 83
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    :cond_1
    return-void
.end method

.method public final synthetic I0(Lcom/p1/mobile/android/app/Act;Ll/p8b;Landroid/view/View;)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, -0x1

    .line 3
    const/4 v2, 0x1

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v3, p2

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->T0(Lcom/p1/mobile/android/app/Act;ILl/p8b;Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic J0(Lcom/p1/mobile/android/app/Act;Ll/p8b;Landroid/view/View;)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, -0x1

    .line 3
    const/4 v2, 0x2

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v3, p2

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->T0(Lcom/p1/mobile/android/app/Act;ILl/p8b;Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic K0(Lcom/p1/mobile/android/app/Act;Ll/p8b;)V
    .locals 1

    .line 1
    const-string v0, "using"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->W0(Lcom/p1/mobile/android/app/Act;Ll/p8b;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic L0(Ljava/lang/String;Ll/p8b;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p4, "satisfied"

    .line 2
    .line 3
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    const-string v0, "photo_award_boost_status"

    .line 8
    .line 9
    const-string v1, "e_photo_award_boost"

    .line 10
    .line 11
    if-eqz p4, :cond_0

    .line 12
    .line 13
    new-instance p1, Ll/t8b;

    .line 14
    .line 15
    invoke-direct {p1, p0, p3, p2}, Ll/t8b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;Ll/p8b;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, p1}, Ll/p8b;->s0(Ll/x20;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "start_boost"

    .line 26
    .line 27
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    filled-new-array {p1}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {v1, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    const-string p0, "using"

    .line 40
    .line 41
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    new-instance p0, Ll/u8b;

    .line 48
    .line 49
    invoke-direct {p0, p3}, Ll/u8b;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p3, p0}, Ll/b83;->l(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string p1, "boosting"

    .line 60
    .line 61
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    filled-new-array {p1}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {v1, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public final synthetic M0(Lcom/p1/mobile/android/app/Act;Ll/p8b;Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object p3, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p3, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    const/4 v0, 0x2

    .line 10
    if-ne p3, v0, :cond_0

    .line 11
    .line 12
    const-string p3, "used"

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->W0(Lcom/p1/mobile/android/app/Act;Ll/p8b;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic N0(Lcom/p1/mobile/android/app/Act;ILl/p8b;Lcom/p1/mobile/putong/core/data/RealPictureInfo;)V
    .locals 6

    .line 1
    iget-object v4, p4, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->reason:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Ll/u9b;

    .line 14
    .line 15
    invoke-direct {v1, p4}, Ll/u9b;-><init>(Lcom/p1/mobile/putong/core/data/RealPictureInfo;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    move-object v0, p0

    .line 23
    move-object v1, p1

    .line 24
    move v2, p2

    .line 25
    move-object v3, p3

    .line 26
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->T0(Lcom/p1/mobile/android/app/Act;ILl/p8b;Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic O0(Ll/p8b;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->t0(Ll/p8b;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final P0(Lcom/p1/mobile/putong/core/data/RealPictureInfo;I)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->status:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "pending"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "\u5ba1\u6838\u4e2d"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->status:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "passed"

    .line 17
    .line 18
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_2

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    if-ne p2, p0, :cond_1

    .line 26
    .line 27
    const-string p0, "\u6237\u5916\u7167\u901a\u8fc7"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    const-string p0, "\u5168\u8eab\u7167\u901a\u8fc7"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->status:Ljava/lang/String;

    .line 34
    .line 35
    const-string p2, "rejected"

    .line 36
    .line 37
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->reason:Ljava/lang/String;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_3
    const-string p0, ""

    .line 47
    .line 48
    return-object p0
.end method

.method public final Q0(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "landing_full_body"

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "landing_outdoor"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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
    const-string p0, "other"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    :goto_0
    const-string p0, "task_center"

    .line 22
    .line 23
    return-object p0
.end method

.method public final R0(Ljava/lang/String;)I
    .locals 0

    .line 1
    const-string p0, "pending"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x2

    .line 10
    return p0

    .line 11
    :cond_0
    const-string p0, "passed"

    .line 12
    .line 13
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const-string p0, "rejected"

    .line 22
    .line 23
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 p0, 0x4

    .line 30
    return p0

    .line 31
    :cond_2
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public final S0(Lcom/p1/mobile/putong/core/data/RealPictureInfo;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->status:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "pending"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p0, "review"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->status:Ljava/lang/String;

    .line 17
    .line 18
    const-string v0, "passed"

    .line 19
    .line 20
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    const-string p0, "success"

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->status:Ljava/lang/String;

    .line 30
    .line 31
    const-string p1, "rejected"

    .line 32
    .line 33
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    const-string p0, "failed"

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_2
    const-string p0, "upload"

    .line 43
    .line 44
    return-object p0
.end method

.method public final T0(Lcom/p1/mobile/android/app/Act;ILl/p8b;Ljava/lang/String;I)V
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isProfileJailed()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {p1}, Ll/ey0;->h(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-ne p2, v1, :cond_1

    .line 25
    .line 26
    const-string v2, "outdoor"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string v2, "full"

    .line 30
    .line 31
    :goto_0
    const-string v3, "task_center_photo_type"

    .line 32
    .line 33
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_2

    .line 42
    .line 43
    const-string v3, "upload"

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    const-string v3, "failed"

    .line 47
    .line 48
    :goto_1
    const-string v4, "photo_award_photo_status"

    .line 49
    .line 50
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    const-string v4, "photo_award_failed_reason"

    .line 55
    .line 56
    invoke-static {v4, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    filled-new-array {v2, v3, v4}, [Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const-string v3, "e_photo_award_photo"

    .line 65
    .line 66
    invoke-static {v3, v0, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 67
    .line 68
    .line 69
    if-gez p5, :cond_3

    .line 70
    .line 71
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    const/16 v2, 0x9

    .line 86
    .line 87
    if-eq v0, v2, :cond_4

    .line 88
    .line 89
    invoke-static {}, Ll/gra;->A2()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    const/4 v2, 0x6

    .line 110
    if-ne v0, v2, :cond_3

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_3
    move-object v2, p0

    .line 114
    move-object v3, p1

    .line 115
    move v4, p2

    .line 116
    move-object v5, p3

    .line 117
    move-object v7, p4

    .line 118
    move v6, p5

    .line 119
    goto :goto_4

    .line 120
    :cond_4
    :goto_2
    if-ne p2, v1, :cond_5

    .line 121
    .line 122
    const/16 p5, 0x10

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_5
    const/16 p5, 0x11

    .line 126
    .line 127
    :goto_3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    new-instance v1, Ll/s9b;

    .line 132
    .line 133
    move-object v2, p0

    .line 134
    move-object v3, p1

    .line 135
    move v4, p2

    .line 136
    move-object v5, p3

    .line 137
    move-object v6, p4

    .line 138
    invoke-direct/range {v1 .. v6}, Ll/s9b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;ILl/p8b;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v3, p5, v0, v1}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :goto_4
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->Y0(Lcom/p1/mobile/android/app/Act;ILl/p8b;ILjava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public final U0(Ll/p8b;IILcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/NewTags;Ll/x20;)V
    .locals 0

    .line 1
    new-instance p5, Ll/i9b;

    .line 2
    .line 3
    invoke-direct {p5, p0, p2, p4}, Ll/i9b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;ILcom/p1/mobile/putong/data/Media;)V

    .line 4
    .line 5
    .line 6
    move-object p0, p1

    .line 7
    move-object p1, p4

    .line 8
    move-object p4, p6

    .line 9
    invoke-virtual/range {p0 .. p5}, Ll/p8b;->D0(Lcom/p1/mobile/putong/data/Media;IILl/x20;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public V0(Lcom/p1/mobile/android/app/Act;Ll/p8b;Ll/mni0;)V
    .locals 7

    .line 1
    iget-object v1, p3, Ll/mni0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v2, v1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    .line 4
    .line 5
    if-eqz v2, :cond_0

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->k:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    .line 10
    .line 11
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->k:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 16
    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->e:Lv/VText;

    .line 18
    .line 19
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->outdoor:Lcom/p1/mobile/putong/core/data/RealPictureInfo;

    .line 20
    .line 21
    const/4 v5, 0x1

    .line 22
    move-object v0, p0

    .line 23
    move-object v1, p1

    .line 24
    move-object v6, p2

    .line 25
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->X0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;Lv/VText;Lcom/p1/mobile/putong/core/data/RealPictureInfo;ILl/p8b;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 29
    .line 30
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->h:Lv/VText;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->k:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    .line 33
    .line 34
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->fullBody:Lcom/p1/mobile/putong/core/data/RealPictureInfo;

    .line 35
    .line 36
    const/4 v5, 0x2

    .line 37
    move-object v1, p1

    .line 38
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->X0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;Lv/VText;Lcom/p1/mobile/putong/core/data/RealPictureInfo;ILl/p8b;)V

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->k:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->privilegeStatus:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0, p1, p2, v2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->W0(Lcom/p1/mobile/android/app/Act;Ll/p8b;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->c:Landroid/view/View;

    .line 49
    .line 50
    new-instance v3, Ll/s8b;

    .line 51
    .line 52
    invoke-direct {v3, p0, p1, p2}, Ll/s8b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;Ll/p8b;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->f:Landroid/view/View;

    .line 59
    .line 60
    new-instance v3, Ll/d9b;

    .line 61
    .line 62
    invoke-direct {v3, p0, p1, p2}, Ll/d9b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;Ll/p8b;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->j:Landroid/view/View;

    .line 69
    .line 70
    new-instance v2, Ll/n9b;

    .line 71
    .line 72
    invoke-direct {v2, p1}, Ll/n9b;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final W0(Lcom/p1/mobile/android/app/Act;Ll/p8b;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->i:Lv/VText;

    .line 2
    .line 3
    const-string v1, "satisfied"

    .line 4
    .line 5
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const-string v3, "using"

    .line 10
    .line 11
    if-nez v2, :cond_1

    .line 12
    .line 13
    invoke-virtual {v3, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v2, 0x0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    const/4 v2, 0x1

    .line 23
    :goto_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 24
    .line 25
    .line 26
    const-string v0, "unsatisfied"

    .line 27
    .line 28
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->i:Lv/VText;

    .line 35
    .line 36
    const-string v1, "\u5f85\u83b7\u5f97\u4f18\u5148\u63a8\u8350"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    const-string v0, "not_get_boost"

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_2
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->i:Lv/VText;

    .line 51
    .line 52
    const-string v1, "\u5df2\u83b7\u5f97\u4f18\u5148\u63a8\u8350\uff0c\u53bb\u4f53\u9a8c"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    const-string v0, "start_boost"

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_3
    invoke-virtual {v3, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->i:Lv/VText;

    .line 67
    .line 68
    const-string v1, "\u4f18\u5148\u63a8\u8350\u4e2d"

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    const-string v0, "boosting"

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_4
    const-string v0, "used"

    .line 77
    .line 78
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_5

    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->i:Lv/VText;

    .line 85
    .line 86
    const-string v1, "\u5df2\u4f7f\u7528"

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    const-string v0, "boost_used"

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_5
    const-string v0, ""

    .line 95
    .line 96
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    const-string v2, "photo_award_boost_status"

    .line 101
    .line 102
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    filled-new-array {v0}, [Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    const-string v2, "e_photo_award_boost"

    .line 111
    .line 112
    invoke-static {v2, v1, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->i:Lv/VText;

    .line 116
    .line 117
    new-instance v1, Ll/o9b;

    .line 118
    .line 119
    invoke-direct {v1, p0, p3, p2, p1}, Ll/o9b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Ljava/lang/String;Ll/p8b;Lcom/p1/mobile/android/app/Act;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->m:Ll/kcg0;

    .line 126
    .line 127
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v3, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result p3

    .line 134
    if-eqz p3, :cond_6

    .line 135
    .line 136
    invoke-static {}, Ll/y63;->j()Ll/y63;

    .line 137
    .line 138
    .line 139
    move-result-object p3

    .line 140
    new-instance v0, Ll/p9b;

    .line 141
    .line 142
    invoke-direct {v0, p0, p1, p2}, Ll/p9b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;Ll/p8b;)V

    .line 143
    .line 144
    .line 145
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p3, p1}, Ll/y63;->p(Ll/bb50;)Ll/kcg0;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->m:Ll/kcg0;

    .line 154
    .line 155
    :cond_6
    return-void
.end method

.method public final X0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;Lv/VText;Lcom/p1/mobile/putong/core/data/RealPictureInfo;ILl/p8b;)V
    .locals 10

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz p4, :cond_2

    .line 8
    .line 9
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p4, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->status:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->R0(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {p0, p4, p5}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->P0(Lcom/p1/mobile/putong/core/data/RealPictureInfo;I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget-object v4, p4, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p2, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v2, p4, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const-string v3, "rejected"

    .line 38
    .line 39
    if-nez v2, :cond_0

    .line 40
    .line 41
    iget-object v2, p4, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->status:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget-object v4, p4, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 54
    .line 55
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 56
    .line 57
    const/4 v5, 0x0

    .line 58
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    check-cast v4, Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v2, v4}, Ll/gj40;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    if-eqz v2, :cond_0

    .line 69
    .line 70
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    :cond_0
    new-instance v4, Ll/q9b;

    .line 79
    .line 80
    move-object v5, p0

    .line 81
    move-object v6, p1

    .line 82
    move-object v9, p4

    .line 83
    move v7, p5

    .line 84
    move-object/from16 v8, p6

    .line 85
    .line 86
    invoke-direct/range {v4 .. v9}, Ll/q9b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;ILl/p8b;Lcom/p1/mobile/putong/core/data/RealPictureInfo;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2, v4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setRefusedClickCallback(Ll/x20;)V

    .line 90
    .line 91
    .line 92
    new-instance p3, Ll/r9b;

    .line 93
    .line 94
    invoke-direct {p3}, Ll/r9b;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    .line 99
    .line 100
    iget-object p2, p4, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->status:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {p2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-eqz p2, :cond_1

    .line 107
    .line 108
    const-string p2, "photo_award_failed_reason"

    .line 109
    .line 110
    iget-object p3, p4, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->reason:Ljava/lang/String;

    .line 111
    .line 112
    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    :cond_1
    iget-object p2, p4, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->source:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->Q0(Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    const-string p3, "photo_uploaded_source"

    .line 122
    .line 123
    invoke-interface {v0, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    :cond_2
    const-string p2, "photo_award_photo_status"

    .line 127
    .line 128
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->S0(Lcom/p1/mobile/putong/core/data/RealPictureInfo;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-interface {v0, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    if-ne p5, v1, :cond_3

    .line 136
    .line 137
    const-string p0, "outdoor"

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_3
    const-string p0, "full"

    .line 141
    .line 142
    :goto_0
    const-string p2, "task_center_photo_type"

    .line 143
    .line 144
    invoke-interface {v0, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    const-string p0, "e_photo_award_photo"

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-static {p0, p1, v0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public final Y0(Lcom/p1/mobile/android/app/Act;ILl/p8b;ILjava/lang/String;)V
    .locals 0

    .line 1
    new-instance p5, Ll/g3k0;

    .line 2
    .line 3
    invoke-direct {p5, p1, p2}, Ll/g3k0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/t9b;

    .line 7
    .line 8
    invoke-direct {p1, p0, p3, p2, p4}, Ll/t9b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Ll/p8b;II)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p5, p1}, Ll/g3k0;->F(Ll/x20;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p5}, Ll/g3k0;->show()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->l9:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->c:Landroid/view/View;

    .line 11
    .line 12
    sget v0, Ll/adc0;->m9:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 21
    .line 22
    sget v0, Ll/adc0;->n9:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lv/VText;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->e:Lv/VText;

    .line 31
    .line 32
    sget v0, Ll/adc0;->G4:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->f:Landroid/view/View;

    .line 39
    .line 40
    sget v0, Ll/adc0;->H4:I

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 49
    .line 50
    sget v0, Ll/adc0;->I4:I

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lv/VText;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->h:Lv/VText;

    .line 59
    .line 60
    sget v0, Ll/adc0;->L0:I

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lv/VText;

    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->i:Lv/VText;

    .line 69
    .line 70
    sget v0, Ll/adc0;->i4:I

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->j:Landroid/view/View;

    .line 77
    .line 78
    sget v0, Ll/adc0;->wd:I

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->l:Lcom/tantan/library/svga/SVGAnimationView;

    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 89
    .line 90
    const/4 v1, 0x2

    .line 91
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setSizeType(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setSizeType(I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v1, "https://auto.tancdn.com/v1/raw/a65e326a-3d46-492c-9e18-73d717d82d8f14.svga"

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    const/4 v1, 0x1

    .line 114
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->l:Lcom/tantan/library/svga/SVGAnimationView;

    .line 119
    .line 120
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final t0(Ll/p8b;II)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->A2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    new-instance v2, Ll/v8b;

    .line 22
    .line 23
    invoke-direct {v2, p0, p1, p2, p3}, Ll/v8b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Ll/p8b;II)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->np(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    new-instance v2, Ll/w8b;

    .line 45
    .line 46
    invoke-direct {v2, p0, p1, p2, p3}, Ll/w8b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Ll/p8b;II)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uj(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic u0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->f:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->c:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic w0(ILcom/p1/mobile/putong/data/Media;Ll/p8b;)V
    .locals 6

    .line 1
    const-string v0, "is_outdoor_full_uploaded"

    .line 2
    .line 3
    const-string v1, "task_center_photo_type"

    .line 4
    .line 5
    const-string v2, "e_task_center_upload_photo_success"

    .line 6
    .line 7
    const-string v3, "\u5ba1\u6838\u4e2d"

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    const/4 v5, 0x2

    .line 11
    if-ne p1, v5, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 14
    .line 15
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 19
    .line 20
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1, v5, v3, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 26
    .line 27
    new-instance p2, Ll/e9b;

    .line 28
    .line 29
    invoke-direct {p2, p0}, Ll/e9b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setRefusedClickCallback(Ll/x20;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 36
    .line 37
    new-instance p2, Ll/f9b;

    .line 38
    .line 39
    invoke-direct {p2}, Ll/f9b;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p3}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string p2, "full"

    .line 54
    .line 55
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 60
    .line 61
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    filled-new-array {p2, p0}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {v2, p1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    if-ne p1, v4, :cond_1

    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 84
    .line 85
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 89
    .line 90
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {p1, v5, v3, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->d(ILjava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 96
    .line 97
    new-instance p2, Ll/g9b;

    .line 98
    .line 99
    invoke-direct {p2, p0}, Ll/g9b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;->setRefusedClickCallback(Ll/x20;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 106
    .line 107
    new-instance p2, Ll/h9b;

    .line 108
    .line 109
    invoke-direct {p2}, Ll/h9b;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p3}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    const-string p2, "outdoor"

    .line 124
    .line 125
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->g:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadGuideImageView;

    .line 130
    .line 131
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    filled-new-array {p2, p0}, [Ll/pf60;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-static {v2, p1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 148
    .line 149
    .line 150
    :cond_1
    return-void
.end method

.method public final synthetic x0(Ll/p8b;IILcom/p1/mobile/putong/data/Media;)V
    .locals 7

    .line 1
    new-instance v6, Ll/x8b;

    .line 2
    .line 3
    invoke-direct {v6, p0, p2, p4, p1}, Ll/x8b;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;ILcom/p1/mobile/putong/data/Media;Ll/p8b;)V

    .line 4
    .line 5
    .line 6
    const/4 v5, 0x0

    .line 7
    move-object v0, p0

    .line 8
    move-object v1, p1

    .line 9
    move v2, p2

    .line 10
    move v3, p3

    .line 11
    move-object v4, p4

    .line 12
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->U0(Ll/p8b;IILcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/NewTags;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic y0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->f:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic z0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->c:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
