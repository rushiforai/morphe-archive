.class public final Le18;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;


# instance fields
.field public final a:Lsxh;

.field public b:Landroid/view/View;

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Lsxh;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Le18;->a:Lsxh;

    invoke-virtual {p1}, Landroid/view/View;->hasWindowFocus()Z

    move-result p2

    iput-boolean p2, p0, Le18;->c:Z

    iput-object p1, p0, Le18;->b:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-boolean v0, p0, Le18;->d:Z

    if-eqz v0, :cond_15

    iget-object v0, p0, Le18;->b:Landroid/view/View;

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    if-eqz v0, :cond_11

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    :cond_11
    const/4 v0, 0x0

    iput-object v0, p0, Le18;->b:Landroid/view/View;

    return-void

    :cond_15
    const/4 v0, 0x1

    iput-boolean v0, p0, Le18;->g:Z

    return-void
.end method

.method public final b(Z)V
    .registers 4

    iget-boolean v0, p0, Le18;->f:Z

    if-nez v0, :cond_33

    iget-boolean v0, p0, Le18;->d:Z

    if-eqz v0, :cond_33

    if-nez p1, :cond_12

    iget-boolean p1, p0, Le18;->e:Z

    if-nez p1, :cond_12

    iget-boolean p1, p0, Le18;->c:Z

    if-nez p1, :cond_33

    :cond_12
    iget-object p1, p0, Le18;->b:Landroid/view/View;

    if-eqz p1, :cond_33

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    if-eqz p1, :cond_33

    const/4 v0, 0x1

    iput-boolean v0, p0, Le18;->f:Z

    invoke-virtual {p0}, Le18;->a()V

    iget-object p0, p0, Le18;->a:Lsxh;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-static {p1, p0, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_33
    return-void
.end method

.method public final onWindowFocusChanged(Z)V
    .registers 2

    iput-boolean p1, p0, Le18;->c:Z

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Le18;->b(Z)V

    return-void
.end method
