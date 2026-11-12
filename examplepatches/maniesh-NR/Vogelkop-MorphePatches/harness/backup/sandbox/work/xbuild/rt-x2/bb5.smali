.class public abstract Lbb5;
.super Lf83;
.source "SourceFile"


# static fields
.field public static final synthetic j:I


# instance fields
.field public final i:I


# direct methods
.method public constructor <init>(Ljava/util/List;ILeya;)V
    .registers 4

    invoke-direct {p0, p1, p3}, Lf83;-><init>(Ljava/util/List;Leya;)V

    iput p2, p0, Lbb5;->i:I

    iget-object p0, p0, Lf83;->h:Landroid/graphics/Paint;

    invoke-virtual {p0, p2}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/graphics/Canvas;Lkk7;)V
    .registers 3

    invoke-virtual {p0, p2}, Lbb5;->f(Lkk7;)Landroid/graphics/Paint;

    invoke-super {p0, p1, p2}, Lf83;->b(Landroid/graphics/Canvas;Lkk7;)V

    return-void
.end method

.method public f(Lkk7;)Landroid/graphics/Paint;
    .registers 5

    iget-object v0, p1, Lkk7;->e:Landroid/content/res/Resources;

    iget-object p1, p1, Lkk7;->b:Li97;

    iget p1, p1, Li97;->c:F

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/4 v1, 0x1

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v1, v2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    int-to-float v0, v0

    mul-float/2addr v0, p1

    iget-object p0, p0, Lf83;->h:Landroid/graphics/Paint;

    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-object p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Lf83;->writeToParcel(Landroid/os/Parcel;I)V

    iget p0, p0, Lbb5;->i:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
