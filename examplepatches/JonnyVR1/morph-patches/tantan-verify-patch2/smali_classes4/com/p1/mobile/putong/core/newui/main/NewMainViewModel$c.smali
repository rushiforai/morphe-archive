.class public Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/drawerlayout/widget/DrawerLayout$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->S()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$c;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$c;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->P0()V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    iget-object p0, p0, Ll/dkb;->b4:Ll/jxd0;

    .line 11
    .line 12
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/dkb;->a8()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const-string p0, "marry"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p0, "love"

    .line 31
    .line 32
    :goto_0
    const-string p1, "mode_select"

    .line 33
    .line 34
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    filled-new-array {p0}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "e_mode_sidebar"

    .line 43
    .line 44
    const-string v0, "p_suggest_users_home_view"

    .line 45
    .line 46
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public b(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public c(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/View;F)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    float-to-double p1, p2

    .line 2
    const-wide v0, 0x3f947ae147ae147bL    # 0.02

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    cmpg-double p1, p1, v0

    .line 8
    .line 9
    if-gez p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/jj40;->e()Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$c;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0, p1}, Ll/fbl;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$c;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->O0()V

    .line 28
    .line 29
    .line 30
    return-void
.end method
