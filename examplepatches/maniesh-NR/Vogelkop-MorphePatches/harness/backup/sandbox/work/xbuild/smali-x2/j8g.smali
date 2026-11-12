.class public final Lj8g;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public final a:Lo8f;

.field public final b:I

.field public final c:I

.field public final d:I

.field public final synthetic e:Lro9;


# direct methods
.method public constructor <init>(Lro9;IIILo8f;)V
    .registers 6

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lj8g;->e:Lro9;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput p2, p0, Lj8g;->b:I

    iput p3, p0, Lj8g;->c:I

    iput p4, p0, Lj8g;->d:I

    iput-object p5, p0, Lj8g;->a:Lo8f;

    return-void
.end method


# virtual methods
.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, [Ljava/lang/Void;

    iget p1, p0, Lj8g;->d:I

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iget v1, p0, Lj8g;->c:I

    invoke-static {v1, p1, v0}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_10

    return-object v0

    :cond_10
    iget-object v1, p0, Lj8g;->e:Lro9;

    iget-object v1, v1, Lro9;->c:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/pdf/PdfRenderer;

    iget p0, p0, Lj8g;->b:I

    invoke-virtual {v1, p0}, Landroid/graphics/pdf/PdfRenderer;->openPage(I)Landroid/graphics/pdf/PdfRenderer$Page;

    move-result-object p0

    const/4 v1, 0x1

    :try_start_1d
    invoke-virtual {p0, p1, v0, v0, v1}, Landroid/graphics/pdf/PdfRenderer$Page;->render(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Matrix;I)V
    :try_end_20
    .catchall {:try_start_1d .. :try_end_20} :catchall_24

    invoke-virtual {p0}, Landroid/graphics/pdf/PdfRenderer$Page;->close()V

    return-object p1

    :catchall_24
    move-exception p1

    invoke-virtual {p0}, Landroid/graphics/pdf/PdfRenderer$Page;->close()V

    throw p1
.end method

.method public final onPostExecute(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Landroid/graphics/Bitmap;

    iget-object p0, p0, Lj8g;->a:Lo8f;

    invoke-virtual {p0, p1}, Lo8f;->run(Ljava/lang/Object;)V

    return-void
.end method
