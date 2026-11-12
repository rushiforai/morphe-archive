.class public final Lj7k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:J

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:Z

.field public final i:Z

.field public final j:Z


# direct methods
.method public constructor <init>(IIJ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lj7k;->a:I

    iput p2, p0, Lj7k;->b:I

    iput-wide p3, p0, Lj7k;->c:J

    and-int/lit8 p2, p1, 0x2

    const/4 p3, 0x0

    const/4 p4, 0x1

    if-eqz p2, :cond_11

    move p2, p4

    goto :goto_12

    :cond_11
    move p2, p3

    :goto_12
    iput-boolean p2, p0, Lj7k;->d:Z

    and-int/lit8 p2, p1, 0x40

    if-eqz p2, :cond_1a

    move p2, p4

    goto :goto_1b

    :cond_1a
    move p2, p3

    :goto_1b
    iput-boolean p2, p0, Lj7k;->e:Z

    and-int/lit16 p2, p1, 0x80

    if-eqz p2, :cond_23

    move p2, p4

    goto :goto_24

    :cond_23
    move p2, p3

    :goto_24
    iput-boolean p2, p0, Lj7k;->f:Z

    and-int/lit16 p2, p1, 0x100

    if-eqz p2, :cond_2c

    move p2, p4

    goto :goto_2d

    :cond_2c
    move p2, p3

    :goto_2d
    iput-boolean p2, p0, Lj7k;->g:Z

    and-int/lit16 p2, p1, 0x200

    if-eqz p2, :cond_35

    move p2, p4

    goto :goto_36

    :cond_35
    move p2, p3

    :goto_36
    iput-boolean p2, p0, Lj7k;->h:Z

    and-int/lit16 p2, p1, 0x400

    if-eqz p2, :cond_3e

    move p2, p4

    goto :goto_3f

    :cond_3e
    move p2, p3

    :goto_3f
    iput-boolean p2, p0, Lj7k;->i:Z

    and-int/lit16 p1, p1, 0x800

    if-eqz p1, :cond_46

    move p3, p4

    :cond_46
    iput-boolean p3, p0, Lj7k;->j:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lj7k;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lj7k;

    iget v1, p0, Lj7k;->a:I

    iget v3, p1, Lj7k;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget v1, p0, Lj7k;->b:I

    iget v3, p1, Lj7k;->b:I

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget-wide v3, p0, Lj7k;->c:J

    iget-wide p0, p1, Lj7k;->c:J

    invoke-static {v3, v4, p0, p1}, Lpn7;->e(JJ)Z

    move-result p0

    if-nez p0, :cond_25

    return v2

    :cond_25
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lj7k;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lj7k;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    sget-object v1, Lpn7;->b:Lon7;

    iget-wide v1, p0, Lj7k;->c:J

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
