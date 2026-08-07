.class public Ll/pmf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/kmf0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VScroll;

.field public b:Lv/VText;

.field public c:Lv/VLinear;

.field public d:Lv/VText;

.field public e:Lv/VDraweeView;

.field public f:Lv/VImage;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public m:Lv/VImage;

.field public n:Lv/VImage;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public final q:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;

.field public r:Ll/kmf0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pmf0;->q:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/pmf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pmf0;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/pmf0;Lcom/p1/mobile/putong/data/SignUpData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pmf0;->l(Lcom/p1/mobile/putong/data/SignUpData;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/pmf0;Lcom/p1/mobile/putong/data/SignUpData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pmf0;->n(Lcom/p1/mobile/putong/data/SignUpData;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/pmf0;Lcom/p1/mobile/putong/data/SignUpData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pmf0;->p(Lcom/p1/mobile/putong/data/SignUpData;Landroid/view/View;)V

    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pmf0;->r:Ll/kmf0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/kmf0;->J0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pmf0;->q:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

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

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qmf0;->b(Ll/pmf0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pmf0;->q:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ll/kmf0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pmf0;->r:Ll/kmf0;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/kmf0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pmf0;->i(Ll/kmf0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pmf0;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pmf0;->m:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/pmf0;->o:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/pmf0;->c:Lv/VLinear;

    .line 13
    .line 14
    new-instance v1, Ll/mmf0;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/mmf0;-><init>(Ll/pmf0;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/pmf0;->j:Lv/VText;

    .line 23
    .line 24
    new-instance v1, Ll/nmf0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/nmf0;-><init>(Ll/pmf0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/pmf0;->k:Lv/VText;

    .line 33
    .line 34
    new-instance v1, Ll/omf0;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Ll/omf0;-><init>(Ll/pmf0;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/pmf0;->q(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pmf0;->c:Lv/VLinear;

    .line 2
    .line 3
    new-instance v1, Ll/lmf0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/lmf0;-><init>(Ll/pmf0;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/pmf0;->q(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/data/SignUpData;Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p2, p0, Ll/pmf0;->q:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p1, "empty"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "uploaded"

    .line 19
    .line 20
    :goto_0
    const-string v0, "photo_type"

    .line 21
    .line 22
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    filled-new-array {p1}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "e_imagepage_signup_photo"

    .line 31
    .line 32
    invoke-static {v0, p2, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/pmf0;->q:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->pageId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p2, p0, Ll/pmf0;->r:Ll/kmf0;

    .line 42
    .line 43
    invoke-virtual {p2}, Ll/kmf0;->H0()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    const-string v0, "phone_num"

    .line 48
    .line 49
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    filled-new-array {p2}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const-string v0, "e_imagepage_signup_upload_button"

    .line 58
    .line 59
    invoke-static {v0, p1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const/4 v5, 0x1

    .line 67
    const-string v6, "from_sign_up"

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    const/4 v3, 0x0

    .line 71
    const/4 v4, 0x0

    .line 72
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZLjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/data/SignUpData;Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p2, p0, Ll/pmf0;->q:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p1, "empty"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "uploaded"

    .line 19
    .line 20
    :goto_0
    const-string v0, "photo_type"

    .line 21
    .line 22
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    filled-new-array {p1}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "e_imagepage_signup_photo"

    .line 31
    .line 32
    invoke-static {v0, p2, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/pmf0;->q:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->pageId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p2, p0, Ll/pmf0;->r:Ll/kmf0;

    .line 42
    .line 43
    invoke-virtual {p2}, Ll/kmf0;->H0()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    const-string v0, "phone_num"

    .line 48
    .line 49
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    filled-new-array {p2}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const-string v0, "e_imagepage_signup_upload_button"

    .line 58
    .line 59
    invoke-static {v0, p1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const/4 v5, 0x1

    .line 67
    const-string v6, "from_sign_up"

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    const/4 v3, 0x0

    .line 71
    const/4 v4, 0x0

    .line 72
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZLjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/data/SignUpData;Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p2, p0, Ll/pmf0;->q:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p1, "empty"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "uploaded"

    .line 19
    .line 20
    :goto_0
    const-string v0, "photo_type"

    .line 21
    .line 22
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    filled-new-array {p1}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "e_imagepage_signup_photo"

    .line 31
    .line 32
    invoke-static {v0, p2, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/pmf0;->q:Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->pageId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p2, p0, Ll/pmf0;->r:Ll/kmf0;

    .line 42
    .line 43
    invoke-virtual {p2}, Ll/kmf0;->H0()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    const-string v0, "phone_num"

    .line 48
    .line 49
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    filled-new-array {p2}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const-string v0, "e_imagepage_signup_upload_button"

    .line 58
    .line 59
    invoke-static {v0, p1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const/4 v5, 0x1

    .line 67
    const-string v6, "from_sign_up"

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    const/4 v3, 0x0

    .line 71
    const/4 v4, 0x0

    .line 72
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZLjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/pmf0;->c:Lv/VLinear;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/pmf0;->e:Lv/VDraweeView;

    .line 17
    .line 18
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/pmf0;->i:Lv/VLinear;

    .line 22
    .line 23
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 27
    .line 28
    iget-object v1, p0, Ll/pmf0;->e:Lv/VDraweeView;

    .line 29
    .line 30
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v2}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/pmf0;->e:Lv/VDraweeView;

    .line 44
    .line 45
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/pmf0;->i:Lv/VLinear;

    .line 49
    .line 50
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {p0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sget v1, Lcom/p1/mobile/putong/account/R$string;->B3:I

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0}, Ll/pmf0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    sget v2, Lcom/p1/mobile/putong/account/R$string;->C3:I

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object v2, p0, Ll/pmf0;->d:Lv/VText;

    .line 74
    .line 75
    filled-new-array {v1}, [Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const-string v4, "#FE7E1D"

    .line 84
    .line 85
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    const/4 v5, 0x2

    .line 90
    invoke-static {v5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    invoke-static {v0, v1, v4, v6}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    sget-object v0, Ll/ino;->INSTANCE:Ll/ino;

    .line 102
    .line 103
    const-string v1, "female"

    .line 104
    .line 105
    invoke-virtual {v0, v1, p1}, Ll/ino;->h(Ljava/lang/String;Lcom/p1/mobile/putong/data/SignUpData;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    const/4 v2, 0x3

    .line 110
    if-eqz v1, :cond_4

    .line 111
    .line 112
    sget-object p1, Ll/pmf0$a;->a:[I

    .line 113
    .line 114
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->c()Lcom/p1/mobile/putong/ab/IntlCountryCodeController$ModelRegion;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    aget p1, p1, v0

    .line 123
    .line 124
    if-eq p1, v3, :cond_3

    .line 125
    .line 126
    if-eq p1, v5, :cond_2

    .line 127
    .line 128
    iget-object p0, p0, Ll/pmf0;->f:Lv/VImage;

    .line 129
    .line 130
    if-eq p1, v2, :cond_1

    .line 131
    .line 132
    sget p1, Ll/bbc0;->a:I

    .line 133
    .line 134
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_1
    sget p1, Ll/bbc0;->b:I

    .line 139
    .line 140
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_2
    iget-object p0, p0, Ll/pmf0;->f:Lv/VImage;

    .line 145
    .line 146
    sget p1, Ll/bbc0;->c:I

    .line 147
    .line 148
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_3
    iget-object p0, p0, Ll/pmf0;->f:Lv/VImage;

    .line 153
    .line 154
    sget p1, Ll/bbc0;->d:I

    .line 155
    .line 156
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_4
    const-string v1, "male"

    .line 161
    .line 162
    invoke-virtual {v0, v1, p1}, Ll/ino;->h(Ljava/lang/String;Lcom/p1/mobile/putong/data/SignUpData;)Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-eqz v1, :cond_8

    .line 167
    .line 168
    sget-object p1, Ll/pmf0$a;->a:[I

    .line 169
    .line 170
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->c()Lcom/p1/mobile/putong/ab/IntlCountryCodeController$ModelRegion;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    aget p1, p1, v0

    .line 179
    .line 180
    if-eq p1, v3, :cond_7

    .line 181
    .line 182
    if-eq p1, v5, :cond_6

    .line 183
    .line 184
    iget-object p0, p0, Ll/pmf0;->f:Lv/VImage;

    .line 185
    .line 186
    if-eq p1, v2, :cond_5

    .line 187
    .line 188
    sget p1, Ll/bbc0;->e:I

    .line 189
    .line 190
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_5
    sget p1, Ll/bbc0;->f:I

    .line 195
    .line 196
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :cond_6
    iget-object p0, p0, Ll/pmf0;->f:Lv/VImage;

    .line 201
    .line 202
    sget p1, Ll/bbc0;->g:I

    .line 203
    .line 204
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 205
    .line 206
    .line 207
    return-void

    .line 208
    :cond_7
    iget-object p0, p0, Ll/pmf0;->f:Lv/VImage;

    .line 209
    .line 210
    sget p1, Ll/bbc0;->h:I

    .line 211
    .line 212
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :cond_8
    const-string v1, "nonbinary"

    .line 217
    .line 218
    invoke-virtual {v0, v1, p1}, Ll/ino;->h(Ljava/lang/String;Lcom/p1/mobile/putong/data/SignUpData;)Z

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    if-eqz p1, :cond_c

    .line 223
    .line 224
    iget-object p1, p0, Ll/pmf0;->g:Lv/VImage;

    .line 225
    .line 226
    sget v0, Ll/bbc0;->i:I

    .line 227
    .line 228
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 229
    .line 230
    .line 231
    sget-object p1, Ll/pmf0$a;->a:[I

    .line 232
    .line 233
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->c()Lcom/p1/mobile/putong/ab/IntlCountryCodeController$ModelRegion;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    aget p1, p1, v0

    .line 242
    .line 243
    if-eq p1, v3, :cond_b

    .line 244
    .line 245
    if-eq p1, v5, :cond_a

    .line 246
    .line 247
    iget-object p0, p0, Ll/pmf0;->f:Lv/VImage;

    .line 248
    .line 249
    if-eq p1, v2, :cond_9

    .line 250
    .line 251
    sget p1, Ll/bbc0;->j:I

    .line 252
    .line 253
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :cond_9
    sget p1, Ll/bbc0;->k:I

    .line 258
    .line 259
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 260
    .line 261
    .line 262
    return-void

    .line 263
    :cond_a
    iget-object p0, p0, Ll/pmf0;->f:Lv/VImage;

    .line 264
    .line 265
    sget p1, Ll/bbc0;->l:I

    .line 266
    .line 267
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :cond_b
    iget-object p0, p0, Ll/pmf0;->f:Lv/VImage;

    .line 272
    .line 273
    sget p1, Ll/bbc0;->m:I

    .line 274
    .line 275
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 276
    .line 277
    .line 278
    :cond_c
    return-void
.end method
