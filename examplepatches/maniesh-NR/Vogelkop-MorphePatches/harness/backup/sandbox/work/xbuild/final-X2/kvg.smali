.class public final Lkvg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:J


# direct methods
.method public constructor <init>(IJ)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lkvg;->a:I

    iput-wide p2, p0, Lkvg;->b:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 8

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_20

    const-class v2, Lkvg;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_20

    check-cast p1, Lkvg;

    iget-wide v2, p0, Lkvg;->b:J

    iget-wide v4, p1, Lkvg;->b:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_20

    iget p0, p0, Lkvg;->a:I

    iget p1, p1, Lkvg;->a:I

    if-ne p0, p1, :cond_20

    return v0

    :cond_20
    return v1
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lkvg;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-wide v1, p0, Lkvg;->b:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
