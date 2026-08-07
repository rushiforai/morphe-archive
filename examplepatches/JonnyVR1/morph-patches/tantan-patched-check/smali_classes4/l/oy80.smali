.class public Ll/oy80;
.super Ll/n4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/n4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yna;->X3()V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-static {p0}, Ll/v5b0;->z(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oy80;->d(Ll/p8l$a;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oy80;->e(Ll/p8l$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Ll/p8l$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/v5b0;->z(Z)V

    .line 3
    .line 4
    .line 5
    new-instance p0, Ll/ly80;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, ""

    .line 12
    .line 13
    invoke-direct {p0, p1, v0}, Ll/ly80;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/ny80;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/ny80;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 25
    .line 26
    .line 27
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 28
    .line 29
    return-object p0
.end method

.method public e(Ll/p8l$a;)Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yna;->E3()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/yna;->q3()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    return v0

    .line 24
    :cond_1
    iget-object p0, p1, Ll/p8l$a;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    instance-of p0, p0, Ll/cvl;

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    iget-object p0, p1, Ll/p8l$a;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/cvl;

    .line 41
    .line 42
    invoke-interface {p0}, Ll/cvl;->T()Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 47
    .line 48
    if-ne p0, p1, :cond_2

    .line 49
    .line 50
    invoke-static {}, Ll/v5b0;->h()Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_2

    .line 55
    .line 56
    const/4 p0, 0x1

    .line 57
    return p0

    .line 58
    :cond_2
    return v0
.end method
