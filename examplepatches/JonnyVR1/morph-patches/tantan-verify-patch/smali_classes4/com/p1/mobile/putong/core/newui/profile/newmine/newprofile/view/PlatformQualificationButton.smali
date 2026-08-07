.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;->v(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;->v(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;->v(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;Lv/VButton;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;->B(Lv/VButton;Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;Landroid/content/Context;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;->w(Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;ZLv/VButton;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;->z(ZLv/VButton;Landroid/content/Context;)V

    return-void
.end method

.method private v(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->K8:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    sget v0, Ll/adc0;->L0:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lv/VButton;

    .line 17
    .line 18
    new-instance v1, Ll/dd80;

    .line 19
    .line 20
    invoke-direct {v1, p0, v0, p1}, Ll/dd80;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;Lv/VButton;Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final synthetic B(Lv/VButton;Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->K2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ll/ed80;

    .line 6
    .line 7
    invoke-direct {v1, p0, v0, p1, p2}, Ll/ed80;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;ZLv/VButton;Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setPageId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic w(Landroid/content/Context;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;->a:Ljava/lang/String;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    new-array p2, p2, [Ll/sfj0$a;

    .line 5
    .line 6
    const-string v0, "e_navigation_business_license_button"

    .line 7
    .line 8
    invoke-static {v0, p0, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "\u5e73\u53f0\u8d44\u8d28"

    .line 12
    .line 13
    const-string p2, "http://m.tantanapp.com/middle-platform/bussiness_license?rid=5"

    .line 14
    .line 15
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic z(ZLv/VButton;Landroid/content/Context;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 p1, 0x1

    .line 9
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ll/fd80;

    .line 13
    .line 14
    invoke-direct {p1, p0, p3}, Ll/fd80;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p2, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
