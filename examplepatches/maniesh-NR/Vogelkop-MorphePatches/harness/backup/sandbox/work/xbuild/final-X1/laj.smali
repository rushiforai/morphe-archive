.class public final Llaj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Llaj;


# instance fields
.field public final a:F

.field public final b:F

.field public final c:F

.field public final d:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Llaj;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v1, v1, v2}, Llaj;-><init>(FFFI)V

    sput-object v0, Llaj;->e:Llaj;

    return-void
.end method

.method public constructor <init>(FFFI)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Llaj;->a:F

    iput p2, p0, Llaj;->b:F

    iput p3, p0, Llaj;->c:F

    iput p4, p0, Llaj;->d:I

    return-void
.end method


# virtual methods
.method public final a(Landroid/widget/TextView;)V
    .registers 5

    iget v0, p0, Llaj;->c:F

    iget v1, p0, Llaj;->d:I

    iget v2, p0, Llaj;->a:F

    iget p0, p0, Llaj;->b:F

    invoke-virtual {p1, v2, p0, v0, v1}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_36

    const-class v2, Llaj;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_36

    check-cast p1, Llaj;

    iget v2, p1, Llaj;->a:F

    iget v3, p0, Llaj;->a:F

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-nez v2, :cond_36

    iget v2, p1, Llaj;->b:F

    iget v3, p0, Llaj;->b:F

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-nez v2, :cond_36

    iget v2, p1, Llaj;->c:F

    iget v3, p0, Llaj;->c:F

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-nez v2, :cond_36

    iget p0, p0, Llaj;->d:I

    iget p1, p1, Llaj;->d:I

    if-ne p0, p1, :cond_36

    return v0

    :cond_36
    return v1
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Llaj;->a:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iget v1, p0, Llaj;->b:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iget v2, p0, Llaj;->c:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iget p0, p0, Llaj;->d:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {v0, v1, v2, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
