.class public final Lt2c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Z


# direct methods
.method public constructor <init>(IIZ)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lt2c;->a:I

    iput p2, p0, Lt2c;->b:I

    iput-boolean p3, p0, Lt2c;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lt2c;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lt2c;

    iget v1, p0, Lt2c;->a:I

    iget v3, p1, Lt2c;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget v1, p0, Lt2c;->b:I

    iget v3, p1, Lt2c;->b:I

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget-boolean p0, p0, Lt2c;->c:Z

    iget-boolean p1, p1, Lt2c;->c:Z

    if-eq p0, p1, :cond_21

    return v2

    :cond_21
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lt2c;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lt2c;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean p0, p0, Lt2c;->c:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 6

    const-string v0, ", end="

    const-string v1, ", isRtl="

    iget v2, p0, Lt2c;->a:I

    iget v3, p0, Lt2c;->b:I

    const-string v4, "BidiRun(start="

    invoke-static {v2, v3, v4, v0, v1}, Lsko;->o(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    iget-boolean p0, p0, Lt2c;->c:Z

    invoke-static {v0, p0, v1}, Lz1m;->m(Ljava/lang/StringBuilder;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
