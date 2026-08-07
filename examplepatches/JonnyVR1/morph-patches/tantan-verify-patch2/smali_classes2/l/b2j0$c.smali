.class public final Ll/b2j0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/view/menu/g$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b2j0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Ll/b2j0;


# direct methods
.method public constructor <init>(Ll/b2j0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b2j0$c;->b:Ll/b2j0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroidx/appcompat/view/menu/MenuBuilder;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/b2j0$c;->b:Ll/b2j0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/b2j0;->c:Landroid/view/Window$Callback;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x6c

    .line 8
    .line 9
    invoke-interface {p0, v0, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public onCloseMenu(Landroidx/appcompat/view/menu/MenuBuilder;Z)V
    .locals 1

    .line 1
    iget-boolean p2, p0, Ll/b2j0$c;->a:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 p2, 0x1

    .line 7
    iput-boolean p2, p0, Ll/b2j0$c;->a:Z

    .line 8
    .line 9
    iget-object p2, p0, Ll/b2j0$c;->b:Ll/b2j0;

    .line 10
    .line 11
    iget-object p2, p2, Ll/b2j0;->a:Ll/qid;

    .line 12
    .line 13
    invoke-interface {p2}, Ll/qid;->m()V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Ll/b2j0$c;->b:Ll/b2j0;

    .line 17
    .line 18
    iget-object p2, p2, Ll/b2j0;->c:Landroid/view/Window$Callback;

    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    const/16 v0, 0x6c

    .line 23
    .line 24
    invoke-interface {p2, v0, p1}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    const/4 p1, 0x0

    .line 28
    iput-boolean p1, p0, Ll/b2j0$c;->a:Z

    .line 29
    .line 30
    return-void
.end method
