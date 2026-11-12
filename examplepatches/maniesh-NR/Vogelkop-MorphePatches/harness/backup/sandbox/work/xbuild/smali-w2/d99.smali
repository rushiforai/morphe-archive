.class public final Ld99;
.super Landroid/view/ActionMode$Callback2;
.source "SourceFile"

# interfaces
.implements Landroid/view/ActionMode$Callback;


# instance fields
.field public final a:Lcb1;


# direct methods
.method public constructor <init>(Lcb1;)V
    .registers 2

    invoke-direct {p0}, Landroid/view/ActionMode$Callback2;-><init>()V

    iput-object p1, p0, Ld99;->a:Lcb1;

    return-void
.end method


# virtual methods
.method public final onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .registers 3

    iget-object p0, p0, Ld99;->a:Lcb1;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return p0
.end method

.method public final onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 3

    iget-object p0, p0, Ld99;->a:Lcb1;

    invoke-virtual {p0, p2}, Lcb1;->a(Landroid/view/Menu;)Z

    invoke-interface {p2}, Landroid/view/Menu;->size()I

    move-result p0

    if-lez p0, :cond_d

    const/4 p0, 0x1

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public final onDestroyActionMode(Landroid/view/ActionMode;)V
    .registers 2

    iget-object p0, p0, Ld99;->a:Lcb1;

    iget-object p0, p0, Lcb1;->a:Ldb1;

    invoke-virtual {p0}, Ldb1;->close()V

    return-void
.end method

.method public final onGetContentRect(Landroid/view/ActionMode;Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 5

    iget-object p0, p0, Ld99;->a:Lcb1;

    iget-object p0, p0, Lcb1;->c:Lab1;

    invoke-virtual {p0}, Lab1;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvoh;

    iget p1, p0, Lvoh;->a:F

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iget p2, p0, Lvoh;->b:F

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iget v0, p0, Lvoh;->c:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget p0, p0, Lvoh;->d:F

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-virtual {p3, p1, p2, v0, p0}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public final onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 3

    iget-object p0, p0, Ld99;->a:Lcb1;

    invoke-virtual {p0, p2}, Lcb1;->a(Landroid/view/Menu;)Z

    move-result p0

    return p0
.end method
