.class public Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$a;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ll/pf60;

    .line 2
    .line 3
    const-string v0, "mode_select"

    .line 4
    .line 5
    const-string v1, "love"

    .line 6
    .line 7
    invoke-direct {p1, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    filled-new-array {p1}, [Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "e_mode_sidebar"

    .line 15
    .line 16
    const-string v1, "p_suggest_users_home_view"

    .line 17
    .line 18
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$a;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->a:Landroidx/drawerlayout/widget/DrawerLayout;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->o:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->f(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$a;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->A(Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;)Lcom/p1/mobile/putong/core/newui/main/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 p1, 0x0

    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->P9(Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
