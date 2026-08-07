.class public Lcom/coremedia/iso/boxes/ItemLocationBox$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coremedia/iso/boxes/ItemLocationBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:J

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/coremedia/iso/boxes/ItemLocationBox$a;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic f:Lcom/coremedia/iso/boxes/ItemLocationBox;


# direct methods
.method public constructor <init>(Lcom/coremedia/iso/boxes/ItemLocationBox;IIIJLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIIJ",
            "Ljava/util/List<",
            "Lcom/coremedia/iso/boxes/ItemLocationBox$a;",
            ">;)V"
        }
    .end annotation

    .line 76
    iput-object p1, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->f:Lcom/coremedia/iso/boxes/ItemLocationBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 78
    iput p2, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->a:I

    .line 79
    iput p3, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->b:I

    .line 80
    iput p4, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->c:I

    .line 81
    iput-wide p5, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->d:J

    .line 82
    iput-object p7, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->e:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lcom/coremedia/iso/boxes/ItemLocationBox;Ljava/nio/ByteBuffer;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->f:Lcom/coremedia/iso/boxes/ItemLocationBox;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/LinkedList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->e:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p2}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->a:I

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/googlecode/mp4parser/AbstractFullBox;->getVersion()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-ne v0, v1, :cond_0

    .line 25
    .line 26
    invoke-static {p2}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    and-int/lit8 v0, v0, 0xf

    .line 31
    .line 32
    iput v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->b:I

    .line 33
    .line 34
    :cond_0
    invoke-static {p2}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->c:I

    .line 39
    .line 40
    iget v0, p1, Lcom/coremedia/iso/boxes/ItemLocationBox;->baseOffsetSize:I

    .line 41
    .line 42
    if-lez v0, :cond_1

    .line 43
    .line 44
    invoke-static {p2, v0}, Ll/a1q;->a(Ljava/nio/ByteBuffer;I)J

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    iput-wide v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->d:J

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const-wide/16 v0, 0x0

    .line 52
    .line 53
    iput-wide v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->d:J

    .line 54
    .line 55
    :goto_0
    invoke-static {p2}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/4 v1, 0x0

    .line 60
    :goto_1
    if-lt v1, v0, :cond_2

    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    iget-object v2, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->e:Ljava/util/List;

    .line 64
    .line 65
    new-instance v3, Lcom/coremedia/iso/boxes/ItemLocationBox$a;

    .line 66
    .line 67
    invoke-direct {v3, p1, p2}, Lcom/coremedia/iso/boxes/ItemLocationBox$a;-><init>(Lcom/coremedia/iso/boxes/ItemLocationBox;Ljava/nio/ByteBuffer;)V

    .line 68
    .line 69
    .line 70
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    add-int/lit8 v1, v1, 0x1

    .line 74
    .line 75
    goto :goto_1
.end method


# virtual methods
.method public a(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->a:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/b1q;->e(Ljava/nio/ByteBuffer;I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->f:Lcom/coremedia/iso/boxes/ItemLocationBox;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/googlecode/mp4parser/AbstractFullBox;->getVersion()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->b:I

    .line 16
    .line 17
    invoke-static {p1, v0}, Ll/b1q;->e(Ljava/nio/ByteBuffer;I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->c:I

    .line 21
    .line 22
    invoke-static {p1, v0}, Ll/b1q;->e(Ljava/nio/ByteBuffer;I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->f:Lcom/coremedia/iso/boxes/ItemLocationBox;

    .line 26
    .line 27
    iget v0, v0, Lcom/coremedia/iso/boxes/ItemLocationBox;->baseOffsetSize:I

    .line 28
    .line 29
    if-lez v0, :cond_1

    .line 30
    .line 31
    iget-wide v1, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->d:J

    .line 32
    .line 33
    invoke-static {v1, v2, p1, v0}, Ll/c1q;->a(JLjava/nio/ByteBuffer;I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->e:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-static {p1, v0}, Ll/b1q;->e(Ljava/nio/ByteBuffer;I)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->e:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/coremedia/iso/boxes/ItemLocationBox$a;

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Lcom/coremedia/iso/boxes/ItemLocationBox$a;->a(Ljava/nio/ByteBuffer;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0
.end method

.method public b()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->f:Lcom/coremedia/iso/boxes/ItemLocationBox;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/googlecode/mp4parser/AbstractFullBox;->getVersion()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x2

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x4

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v0, v2

    .line 14
    :goto_0
    add-int/2addr v0, v2

    .line 15
    iget-object v1, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->f:Lcom/coremedia/iso/boxes/ItemLocationBox;

    .line 16
    .line 17
    iget v1, v1, Lcom/coremedia/iso/boxes/ItemLocationBox;->baseOffsetSize:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    add-int/2addr v0, v2

    .line 21
    iget-object p0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->e:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    return v0

    .line 34
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/coremedia/iso/boxes/ItemLocationBox$a;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/coremedia/iso/boxes/ItemLocationBox$a;->b()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    add-int/2addr v0, v1

    .line 45
    goto :goto_1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

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
    goto :goto_1

    .line 19
    :cond_1
    check-cast p1, Lcom/coremedia/iso/boxes/ItemLocationBox$b;

    .line 20
    .line 21
    iget-wide v2, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->d:J

    .line 22
    .line 23
    iget-wide v4, p1, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->d:J

    .line 24
    .line 25
    cmp-long v2, v2, v4

    .line 26
    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    return v1

    .line 30
    :cond_2
    iget v2, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->b:I

    .line 31
    .line 32
    iget v3, p1, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->b:I

    .line 33
    .line 34
    if-eq v2, v3, :cond_3

    .line 35
    .line 36
    return v1

    .line 37
    :cond_3
    iget v2, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->c:I

    .line 38
    .line 39
    iget v3, p1, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->c:I

    .line 40
    .line 41
    if-eq v2, v3, :cond_4

    .line 42
    .line 43
    return v1

    .line 44
    :cond_4
    iget v2, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->a:I

    .line 45
    .line 46
    iget v3, p1, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->a:I

    .line 47
    .line 48
    if-eq v2, v3, :cond_5

    .line 49
    .line 50
    return v1

    .line 51
    :cond_5
    iget-object p0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->e:Ljava/util/List;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->e:Ljava/util/List;

    .line 54
    .line 55
    if-eqz p0, :cond_6

    .line 56
    .line 57
    invoke-interface {p0, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_7

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_6
    if-eqz p1, :cond_7

    .line 65
    .line 66
    :goto_0
    return v1

    .line 67
    :cond_7
    return v0

    .line 68
    :cond_8
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->a:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget v1, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->b:I

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    mul-int/lit8 v0, v0, 0x1f

    .line 9
    .line 10
    iget v1, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->c:I

    .line 11
    .line 12
    add-int/2addr v0, v1

    .line 13
    mul-int/lit8 v0, v0, 0x1f

    .line 14
    .line 15
    iget-wide v1, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->d:J

    .line 16
    .line 17
    const/16 v3, 0x20

    .line 18
    .line 19
    ushr-long v3, v1, v3

    .line 20
    .line 21
    xor-long/2addr v1, v3

    .line 22
    long-to-int v1, v1

    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x1f

    .line 25
    .line 26
    iget-object p0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->e:Ljava/util/List;

    .line 27
    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/List;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    :goto_0
    add-int/2addr v0, p0

    .line 37
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Item{baseOffset="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->d:J

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", itemId="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->a:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", constructionMethod="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->b:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", dataReferenceIndex="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->c:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", extents="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/coremedia/iso/boxes/ItemLocationBox$b;->e:Ljava/util/List;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/16 p0, 0x7d

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
