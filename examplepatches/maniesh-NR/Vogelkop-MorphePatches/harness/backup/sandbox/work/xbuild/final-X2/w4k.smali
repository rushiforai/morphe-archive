.class public final Lw4k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lc5k;


# direct methods
.method public constructor <init>(Lc5k;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw4k;->a:Lc5k;

    return-void
.end method


# virtual methods
.method public a(Lu6d;)V
    .registers 4
    .param p1    # Lu6d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object p1, p1, Lu6d;->a:Lt6d;

    sget-object v0, Lt6d;->a:Lt6d;

    iget-object p0, p0, Lw4k;->a:Lc5k;

    iget-object v1, p0, Lc5k;->F:Lbp;

    if-ne p1, v0, :cond_19

    iget-object p0, v1, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    if-eqz p0, :cond_15

    iget p1, v1, Lbp;->a:I

    invoke-virtual {p0, p1}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_15
    const/4 p0, 0x0

    iput-object p0, v1, Lbp;->b:Ljava/lang/Object;

    return-void

    :cond_19
    iget-object p0, p0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    iget-object p1, v1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    if-ne p1, p0, :cond_22

    return-void

    :cond_22
    if-eqz p1, :cond_29

    iget v0, v1, Lbp;->a:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_29
    iput-object p0, v1, Lbp;->b:Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/view/View;->getImportantForAccessibility()I

    move-result p1

    iput p1, v1, Lbp;->a:I

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/view/View;->setImportantForAccessibility(I)V

    return-void
.end method

.method public b(Laqe;)V
    .registers 5
    .param p1    # Laqe;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-boolean v0, p1, Laqe;->b:Z

    const/4 v1, 0x1

    iget-object p0, p0, Lw4k;->a:Lc5k;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lc5k;->j:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "enable_newsfeed"

    invoke-virtual {v0, v1, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_e
    iget-object v0, p0, Lc5k;->C:Lqt3;

    invoke-virtual {v0}, Lqt3;->run()V

    new-instance v0, Lf1p;

    sget-object v2, Lcue;->c:Lcue;

    iget-object p1, p1, Laqe;->a:Ljava/lang/String;

    invoke-direct {v0, v2, p1}, Lf1p;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, v0, v1, v1}, Lc5k;->g(Lf1p;ZZ)V

    return-void
.end method
