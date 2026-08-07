.class public Ll/b2j0$e;
.super Ll/mfq0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b2j0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field public final synthetic b:Ll/b2j0;


# direct methods
.method public constructor <init>(Ll/b2j0;Landroid/view/Window$Callback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b2j0$e;->b:Ll/b2j0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/mfq0;-><init>(Landroid/view/Window$Callback;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCreatePanelView(I)Landroid/view/View;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Landroid/view/View;

    .line 4
    .line 5
    iget-object p0, p0, Ll/b2j0$e;->b:Ll/b2j0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/qid;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-object p1

    .line 17
    :cond_0
    invoke-super {p0, p1}, Ll/mfq0;->onCreatePanelView(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/mfq0;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Ll/b2j0$e;->b:Ll/b2j0;

    .line 8
    .line 9
    iget-boolean p3, p2, Ll/b2j0;->b:Z

    .line 10
    .line 11
    if-nez p3, :cond_0

    .line 12
    .line 13
    iget-object p2, p2, Ll/b2j0;->a:Ll/qid;

    .line 14
    .line 15
    invoke-interface {p2}, Ll/qid;->f()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/b2j0$e;->b:Ll/b2j0;

    .line 19
    .line 20
    const/4 p2, 0x1

    .line 21
    iput-boolean p2, p0, Ll/b2j0;->b:Z

    .line 22
    .line 23
    :cond_0
    return p1
.end method
