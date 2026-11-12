.class public final Lol5;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final a:Lnrl;

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:Z

.field public g:Z


# direct methods
.method public constructor <init>(IIILnl5;Z)V
    .registers 7

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    iput p1, p0, Lol5;->b:I

    iput p2, p0, Lol5;->c:I

    iput p3, p0, Lol5;->d:I

    const p1, 0x7f1403bf

    iput p1, p0, Lol5;->e:I

    new-instance p1, Lnrl;

    invoke-direct {p1, p4}, Lnrl;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lol5;->a:Lnrl;

    iput-boolean p5, p0, Lol5;->f:Z

    return-void
.end method

.method public constructor <init>(IILnl5;)V
    .registers 10

    const/4 v1, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    .line 25
    invoke-direct/range {v0 .. v5}, Lol5;-><init>(IIILnl5;Z)V

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget p0, p0, Lol5;->e:I

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget p0, p0, Lol5;->d:I

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 3

    iget v0, p0, Lol5;->c:I

    invoke-virtual {p1, v0}, Laz0;->a(I)V

    iget p0, p0, Lol5;->b:I

    if-eqz p0, :cond_c

    invoke-virtual {p1, p0}, Laz0;->b(I)V

    :cond_c
    return-void
.end method

.method public final onDialogCreated(Lbz0;)V
    .registers 2

    iget-boolean p0, p0, Lol5;->f:Z

    invoke-virtual {p1, p0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-void
.end method

.method public final onFinished(Lhjm;)V
    .registers 2

    iget-object p0, p0, Lol5;->a:Lnrl;

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lnrl;->b(I)V

    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 2

    iget-object p0, p0, Lol5;->a:Lnrl;

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lnrl;->b(I)V

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 2

    iget-object p0, p0, Lol5;->a:Lnrl;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lnrl;->b(I)V

    return-void
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 2

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lq9n;->h(Landroid/content/Context;)V

    return-void
.end method

.method public final useTapStealingProtection()Z
    .registers 1

    iget-boolean p0, p0, Lol5;->g:Z

    return p0
.end method
