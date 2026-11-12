.class public final Lzu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltvb;


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    iput-object p1, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->A0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkwf;

    invoke-virtual {p0}, Lo73;->k()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final run()V
    .registers 4

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_36

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez p0, :cond_f

    const/4 p0, 0x0

    :cond_f
    iget-object v0, p0, Lgbf;->j:Lvbf;

    iget-object v0, v0, Lvbf;->t:Ltbf;

    const-wide/16 v1, 0x20

    invoke-virtual {v0, v1, v2}, Ltbf;->b(J)Z

    move-result v1

    if-eqz v1, :cond_23

    const-wide/16 v1, 0x10

    invoke-virtual {v0, v1, v2}, Ltbf;->b(J)Z

    move-result v1

    if-nez v1, :cond_2b

    :cond_23
    const-wide/16 v1, 0x40

    invoke-virtual {v0, v1, v2}, Ltbf;->b(J)Z

    move-result v0

    if-nez v0, :cond_36

    :cond_2b
    invoke-virtual {p0}, Lgbf;->p()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_36

    iget-object p0, p0, Lgbf;->m:Ldbf;

    invoke-virtual {p0, v0}, Ldbf;->b(Landroid/view/View;)V

    :cond_36
    return-void
.end method
