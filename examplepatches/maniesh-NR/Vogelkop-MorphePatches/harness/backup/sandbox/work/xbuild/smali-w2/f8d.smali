.class public final Lf8d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final synthetic c:B

.field public final d:F


# direct methods
.method public constructor <init>(F)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lf8d;->c:B

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lf8d;-><init>(ZZ)V

    iput p1, p0, Lf8d;->d:F

    return-void
.end method

.method public constructor <init>(FZ)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lf8d;->c:B

    .line 11
    invoke-direct {p0, p2, v0}, Lf8d;-><init>(ZZ)V

    .line 12
    iput p1, p0, Lf8d;->d:F

    return-void
.end method

.method public constructor <init>(ZZ)V
    .registers 3

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-boolean p1, p0, Lf8d;->a:Z

    .line 15
    iput-boolean p2, p0, Lf8d;->b:Z

    return-void
.end method

.method public static a(Lwlk;Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 7

    iget-object v0, p0, Lwlk;->c:Lo9g;

    iget v1, p0, Lwlk;->d:F

    float-to-double v1, v1

    iget v3, v0, Lo9g;->a:I

    iget v0, v0, Lo9g;->b:I

    iget-object p0, p0, Lwlk;->b:Ljava/lang/String;

    if-nez v3, :cond_12

    const/4 v4, 0x2

    if-ge v0, v4, :cond_12

    const/4 p0, 0x0

    return-object p0

    :cond_12
    mul-int/lit8 v3, v3, 0xc

    add-int/2addr v3, v0

    int-to-double v3, v3

    div-double/2addr v1, v3

    invoke-static {p0, v1, v2}, Lz7h;->k(Ljava/lang/String;D)Ljava/lang/String;

    move-result-object p0

    const v0, 0x7f1411aa

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
