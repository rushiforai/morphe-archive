.class public Ll/cxf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zwf;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VLinear;

.field public e:Lv/VImage;

.field public f:Lv/VImage;

.field public g:Lv/VImage;

.field public h:Lv/VButton_FakeShadow;

.field public i:Lv/VText;

.field public final j:Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

.field public k:Ll/zwf;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cxf;->j:Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/cxf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cxf;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/cxf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cxf;->i(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/cxf;->d()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/cxf;->d()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

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
    invoke-static {p0, p1, p2}, Ll/dxf;->b(Ll/cxf;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cxf;->j:Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/zwf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cxf;->k:Ll/zwf;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/cxf;->j:Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "fbimagepage_signup_value_button"

    .line 8
    .line 9
    const-string v1, "change"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "e_fbimagepage_signup_value_button"

    .line 20
    .line 21
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/cxf;->k:Ll/zwf;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/zwf;->F0()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/cxf;->j:Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "fbimagepage_signup_value_button"

    .line 8
    .line 9
    const-string v1, "upload"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "e_fbimagepage_signup_value_button"

    .line 20
    .line 21
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/cxf;->k:Ll/zwf;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/zwf;->E0()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zwf;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cxf;->e(Ll/zwf;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cxf;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/cxf;->i:Lv/VText;

    .line 6
    .line 7
    new-instance v0, Ll/axf;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/axf;-><init>(Ll/cxf;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/cxf;->h:Lv/VButton_FakeShadow;

    .line 16
    .line 17
    new-instance v0, Ll/bxf;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/bxf;-><init>(Ll/cxf;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    return-object p1
.end method

.method public j(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/cxf;->k(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cxf;->a:Lv/VDraweeView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/wlj;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 15
    .line 16
    const-string v2, "female"

    .line 17
    .line 18
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget p1, Ll/bbc0;->T1:I

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/wlj;->D(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/cxf;->e:Lv/VImage;

    .line 30
    .line 31
    sget p1, Ll/bbc0;->Q1:I

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 38
    .line 39
    const-string v1, "male"

    .line 40
    .line 41
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    sget p1, Ll/bbc0;->U1:I

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ll/wlj;->D(I)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/cxf;->e:Lv/VImage;

    .line 53
    .line 54
    sget p1, Ll/bbc0;->R1:I

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/cxf;->a:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/cxf;->h:Lv/VButton_FakeShadow;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p0, Ll/cxf;->h:Lv/VButton_FakeShadow;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
