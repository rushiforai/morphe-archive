.class public Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field a:I

.field b:I

.field c:I

.field d:I

.field e:I

.field f:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xff

    .line 5
    .line 6
    filled-new-array {v0, v0, v0, v0}, [I

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->f:[I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->a:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/b1q;->e(Ljava/nio/ByteBuffer;I)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->b:I

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/b1q;->e(Ljava/nio/ByteBuffer;I)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->c:I

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/b1q;->e(Ljava/nio/ByteBuffer;I)V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->d:I

    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/b1q;->j(Ljava/nio/ByteBuffer;I)V

    .line 19
    .line 20
    .line 21
    iget v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->e:I

    .line 22
    .line 23
    invoke-static {p1, v0}, Ll/b1q;->j(Ljava/nio/ByteBuffer;I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->f:[I

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    aget v0, v0, v1

    .line 30
    .line 31
    invoke-static {p1, v0}, Ll/b1q;->j(Ljava/nio/ByteBuffer;I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->f:[I

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    aget v0, v0, v1

    .line 38
    .line 39
    invoke-static {p1, v0}, Ll/b1q;->j(Ljava/nio/ByteBuffer;I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->f:[I

    .line 43
    .line 44
    const/4 v1, 0x2

    .line 45
    aget v0, v0, v1

    .line 46
    .line 47
    invoke-static {p1, v0}, Ll/b1q;->j(Ljava/nio/ByteBuffer;I)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->f:[I

    .line 51
    .line 52
    const/4 v0, 0x3

    .line 53
    aget p0, p0, v0

    .line 54
    .line 55
    invoke-static {p1, p0}, Ll/b1q;->j(Ljava/nio/ByteBuffer;I)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public b(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->a:I

    .line 6
    .line 7
    invoke-static {p1}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->b:I

    .line 12
    .line 13
    invoke-static {p1}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->c:I

    .line 18
    .line 19
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->d:I

    .line 24
    .line 25
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->e:I

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    new-array v0, v0, [I

    .line 33
    .line 34
    iput-object v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->f:[I

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    aput v2, v0, v1

    .line 42
    .line 43
    iget-object v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->f:[I

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    aput v2, v0, v1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->f:[I

    .line 53
    .line 54
    const/4 v1, 0x2

    .line 55
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    aput v2, v0, v1

    .line 60
    .line 61
    iget-object p0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->f:[I

    .line 62
    .line 63
    const/4 v0, 0x3

    .line 64
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    aput p1, p0, v0

    .line 69
    .line 70
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_8

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;

    .line 20
    .line 21
    iget v2, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->b:I

    .line 22
    .line 23
    iget v3, p1, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->b:I

    .line 24
    .line 25
    if-eq v2, v3, :cond_2

    .line 26
    .line 27
    return v1

    .line 28
    :cond_2
    iget v2, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->d:I

    .line 29
    .line 30
    iget v3, p1, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->d:I

    .line 31
    .line 32
    if-eq v2, v3, :cond_3

    .line 33
    .line 34
    return v1

    .line 35
    :cond_3
    iget v2, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->c:I

    .line 36
    .line 37
    iget v3, p1, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->c:I

    .line 38
    .line 39
    if-eq v2, v3, :cond_4

    .line 40
    .line 41
    return v1

    .line 42
    :cond_4
    iget v2, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->e:I

    .line 43
    .line 44
    iget v3, p1, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->e:I

    .line 45
    .line 46
    if-eq v2, v3, :cond_5

    .line 47
    .line 48
    return v1

    .line 49
    :cond_5
    iget v2, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->a:I

    .line 50
    .line 51
    iget v3, p1, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->a:I

    .line 52
    .line 53
    if-eq v2, v3, :cond_6

    .line 54
    .line 55
    return v1

    .line 56
    :cond_6
    iget-object p0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->f:[I

    .line 57
    .line 58
    iget-object p1, p1, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->f:[I

    .line 59
    .line 60
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([I[I)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_7

    .line 65
    .line 66
    return v1

    .line 67
    :cond_7
    return v0

    .line 68
    :cond_8
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->a:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget v1, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->b:I

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    mul-int/lit8 v0, v0, 0x1f

    .line 9
    .line 10
    iget v1, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->c:I

    .line 11
    .line 12
    add-int/2addr v0, v1

    .line 13
    mul-int/lit8 v0, v0, 0x1f

    .line 14
    .line 15
    iget v1, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->d:I

    .line 16
    .line 17
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x1f

    .line 19
    .line 20
    iget v1, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->e:I

    .line 21
    .line 22
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x1f

    .line 24
    .line 25
    iget-object p0, p0, Lcom/coremedia/iso/boxes/sampleentry/TextSampleEntry$b;->f:[I

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([I)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    :goto_0
    add-int/2addr v0, p0

    .line 36
    return v0
.end method
