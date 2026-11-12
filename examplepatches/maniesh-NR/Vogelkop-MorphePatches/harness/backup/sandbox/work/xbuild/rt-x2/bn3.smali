.class public final Lbn3;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final a:Lwm3;

.field public final b:I


# direct methods
.method public constructor <init>(Lwm3;I)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Lbn3;->a:Lwm3;

    iput p2, p0, Lbn3;->b:I

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
    .registers 4

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget p0, p0, Lbn3;->b:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const v1, 0x7f140399

    invoke-virtual {v0, v1, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-object p0, p1, Lwy0;->f:Ljava/lang/CharSequence;

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 2

    iget-object p0, p0, Lbn3;->a:Lwm3;

    invoke-virtual {p0}, Lwm3;->run()V

    return-void
.end method
