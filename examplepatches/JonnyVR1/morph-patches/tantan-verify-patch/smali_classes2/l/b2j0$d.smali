.class public final Ll/b2j0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/view/menu/MenuBuilder$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b2j0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "d"
.end annotation


# instance fields
.field public final synthetic a:Ll/b2j0;


# direct methods
.method public constructor <init>(Ll/b2j0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b2j0$d;->a:Ll/b2j0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onMenuItemSelected(Landroidx/appcompat/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onMenuModeChange(Landroidx/appcompat/view/menu/MenuBuilder;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/b2j0$d;->a:Ll/b2j0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/b2j0;->c:Landroid/view/Window$Callback;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-object v0, v0, Ll/b2j0;->a:Ll/qid;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/qid;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/b2j0$d;->a:Ll/b2j0;

    .line 14
    .line 15
    const/16 v2, 0x6c

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, v1, Ll/b2j0;->c:Landroid/view/Window$Callback;

    .line 20
    .line 21
    invoke-interface {p0, v2, p1}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v0, v1, Ll/b2j0;->c:Landroid/view/Window$Callback;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-interface {v0, v1, v3, p1}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Ll/b2j0$d;->a:Ll/b2j0;

    .line 36
    .line 37
    iget-object p0, p0, Ll/b2j0;->c:Landroid/view/Window$Callback;

    .line 38
    .line 39
    invoke-interface {p0, v2, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method
