.class public Ll/e7h0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o30$a;


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/e7h0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/view/ActionMode$Callback;

.field public final b:Landroid/content/Context;

.field public final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/e7h0;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/oof0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/oof0<",
            "Landroid/view/Menu;",
            "Landroid/view/Menu;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/ActionMode$Callback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e7h0$a;->b:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/e7h0$a;->a:Landroid/view/ActionMode$Callback;

    .line 7
    .line 8
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/e7h0$a;->c:Ljava/util/ArrayList;

    .line 14
    .line 15
    new-instance p1, Ll/oof0;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/oof0;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/e7h0$a;->d:Ll/oof0;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a(Ll/o30;Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e7h0$a;->a:Landroid/view/ActionMode$Callback;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e7h0$a;->e(Ll/o30;)Landroid/view/ActionMode;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v1, Landroidx/appcompat/view/menu/MenuItemWrapperICS;

    .line 8
    .line 9
    iget-object p0, p0, Ll/e7h0$a;->b:Landroid/content/Context;

    .line 10
    .line 11
    check-cast p2, Ll/h7h0;

    .line 12
    .line 13
    invoke-direct {v1, p0, p2}, Landroidx/appcompat/view/menu/MenuItemWrapperICS;-><init>(Landroid/content/Context;Ll/h7h0;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, p1, v1}, Landroid/view/ActionMode$Callback;->onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public b(Ll/o30;Landroid/view/Menu;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e7h0$a;->a:Landroid/view/ActionMode$Callback;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e7h0$a;->e(Ll/o30;)Landroid/view/ActionMode;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p2}, Ll/e7h0$a;->f(Landroid/view/Menu;)Landroid/view/Menu;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {v0, p1, p0}, Landroid/view/ActionMode$Callback;->onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public c(Ll/o30;Landroid/view/Menu;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e7h0$a;->a:Landroid/view/ActionMode$Callback;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e7h0$a;->e(Ll/o30;)Landroid/view/ActionMode;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p2}, Ll/e7h0$a;->f(Landroid/view/Menu;)Landroid/view/Menu;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {v0, p1, p0}, Landroid/view/ActionMode$Callback;->onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public d(Ll/o30;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e7h0$a;->a:Landroid/view/ActionMode$Callback;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e7h0$a;->e(Ll/o30;)Landroid/view/ActionMode;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Landroid/view/ActionMode$Callback;->onDestroyActionMode(Landroid/view/ActionMode;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e(Ll/o30;)Landroid/view/ActionMode;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e7h0$a;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Ll/e7h0$a;->c:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Ll/e7h0;

    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    iget-object v3, v2, Ll/e7h0;->b:Ll/o30;

    .line 21
    .line 22
    if-ne v3, p1, :cond_0

    .line 23
    .line 24
    return-object v2

    .line 25
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    new-instance v0, Ll/e7h0;

    .line 29
    .line 30
    iget-object v1, p0, Ll/e7h0$a;->b:Landroid/content/Context;

    .line 31
    .line 32
    invoke-direct {v0, v1, p1}, Ll/e7h0;-><init>(Landroid/content/Context;Ll/o30;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/e7h0$a;->c:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public final f(Landroid/view/Menu;)Landroid/view/Menu;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e7h0$a;->d:Ll/oof0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/Menu;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/qqy;

    .line 12
    .line 13
    iget-object v1, p0, Ll/e7h0$a;->b:Landroid/content/Context;

    .line 14
    .line 15
    move-object v2, p1

    .line 16
    check-cast v2, Ll/f7h0;

    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Ll/qqy;-><init>(Landroid/content/Context;Ll/f7h0;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/e7h0$a;->d:Ll/oof0;

    .line 22
    .line 23
    invoke-virtual {p0, p1, v0}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    :cond_0
    return-object v0
.end method
