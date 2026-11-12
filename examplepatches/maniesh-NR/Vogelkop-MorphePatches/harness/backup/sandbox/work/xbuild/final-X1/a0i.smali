.class public final La0i;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public a:Lbz0;

.field public final b:Lpjg;

.field public final c:Ly1n;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Lpjg;Ly1n;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, La0i;->b:Lpjg;

    iput-object p2, p0, La0i;->c:Ly1n;

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140b4b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f141330

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 6

    const v0, 0x7f1411c4

    invoke-virtual {p1, v0}, Laz0;->b(I)V

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lphj;->J(Landroid/content/Context;)Lcom/opera/android/custom_views/StylingTextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const v3, 0x7f1411c2

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v3, 0x7f1411c3

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lzzh;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v0, v2}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    invoke-virtual {p1, v1}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void
.end method

.method public final onDialogCreated(Lbz0;)V
    .registers 2

    invoke-super {p0, p1}, Lnz0;->onDialogCreated(Lbz0;)V

    iput-object p1, p0, La0i;->a:Lbz0;

    return-void
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 3

    const/4 p1, 0x0

    iput-object p1, p0, La0i;->a:Lbz0;

    return-void
.end method

.method public final onFinished(Lhjm;)V
    .registers 2

    invoke-super {p0, p1}, Ld63;->onFinished(Lhjm;)V

    iget-boolean p1, p0, La0i;->d:Z

    if-eqz p1, :cond_e

    iget-object p1, p0, La0i;->b:Lpjg;

    if-eqz p1, :cond_e

    invoke-virtual {p1}, Lpjg;->run()V

    :cond_e
    iget-boolean p1, p0, La0i;->e:Z

    if-eqz p1, :cond_19

    iget-object p0, p0, La0i;->c:Ly1n;

    if-eqz p0, :cond_19

    invoke-virtual {p0}, Ly1n;->run()V

    :cond_19
    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 2

    const/4 p1, 0x1

    iput-boolean p1, p0, La0i;->d:Z

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 2

    const/4 p1, 0x1

    iput-boolean p1, p0, La0i;->e:Z

    return-void
.end method
