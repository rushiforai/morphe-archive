.class public Ll/b230;
.super Ll/o4;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;

.field public c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;

.field public d:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Ll/b230;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b230;->i(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b230;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b230;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b230;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadContentLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b230;->d:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/b230;->h(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/b230;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;

    .line 5
    .line 6
    new-instance v0, Ll/a230;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/a230;-><init>(Ll/b230;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;->setRenderUserCall(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public f(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->l3()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object v0, p0, Ll/b230;->a:Lv/VImage;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    const/4 v2, 0x1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/b230;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;

    .line 25
    .line 26
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/b230;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;

    .line 34
    .line 35
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/c230;->a(Ll/b230;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/b230;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/b230;->a:Lv/VImage;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/b230;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
