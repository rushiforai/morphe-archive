.class public final Lmp9;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public a:J

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    iput-wide p1, p0, Lmp9;->a:J

    iput-object p3, p0, Lmp9;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f1403bf

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f1404ca

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 5

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f1401b7

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f141387

    invoke-virtual {p1, v2}, Laz0;->b(I)V

    iget-object p0, p0, Lmp9;->b:Ljava/lang/String;

    filled-new-array {p0, v1}, [Ljava/lang/Object;

    move-result-object p0

    const v1, 0x7f141386

    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-object p0, p1, Lwy0;->f:Ljava/lang/CharSequence;

    const/4 p0, 0x1

    iput-boolean p0, p1, Lwy0;->k:Z

    return-void
.end method

.method public final onFinished(Lhjm;)V
    .registers 6

    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_12

    iget-wide v0, p0, Lmp9;->a:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_12

    const/4 p1, 0x0

    invoke-static {v0, v1, p1}, LJ/N;->M89iwLkI(JZ)V

    iput-wide v2, p0, Lmp9;->a:J

    :cond_12
    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 6

    iget-wide v0, p0, Lmp9;->a:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_9

    return-void

    :cond_9
    const/4 p1, 0x0

    invoke-static {v0, v1, p1}, LJ/N;->M89iwLkI(JZ)V

    iput-wide v2, p0, Lmp9;->a:J

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 6

    iget-wide v0, p0, Lmp9;->a:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_9

    return-void

    :cond_9
    const/4 p1, 0x1

    invoke-static {v0, v1, p1}, LJ/N;->M89iwLkI(JZ)V

    iput-wide v2, p0, Lmp9;->a:J

    return-void
.end method
