.class public Ltech/sud/runtime/component/g/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:[B

.field private b:J

.field private c:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 15
    new-array v0, v0, [B

    iput-object v0, p0, Ltech/sud/runtime/component/g/d;->a:[B

    return-void
.end method

.method public constructor <init>(JJ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v0, v0, [B

    .line 6
    .line 7
    iput-object v0, p0, Ltech/sud/runtime/component/g/d;->a:[B

    .line 8
    .line 9
    iput-wide p1, p0, Ltech/sud/runtime/component/g/d;->b:J

    .line 10
    .line 11
    iput-wide p3, p0, Ltech/sud/runtime/component/g/d;->c:J

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 64
    iget-wide v0, p0, Ltech/sud/runtime/component/g/d;->b:J

    return-wide v0
.end method

.method public a(Ltech/sud/runtime/component/g/b;)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/g/d;->a:[B

    .line 2
    .line 3
    invoke-virtual {p1}, Ltech/sud/runtime/component/g/b;->b()B

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    aput-byte v1, v0, v2

    .line 9
    .line 10
    iget-object v0, p0, Ltech/sud/runtime/component/g/d;->a:[B

    .line 11
    .line 12
    invoke-virtual {p1}, Ltech/sud/runtime/component/g/b;->b()B

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x1

    .line 17
    aput-byte v1, v0, v2

    .line 18
    .line 19
    iget-object v0, p0, Ltech/sud/runtime/component/g/d;->a:[B

    .line 20
    .line 21
    invoke-virtual {p1}, Ltech/sud/runtime/component/g/b;->b()B

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v2, 0x2

    .line 26
    aput-byte v1, v0, v2

    .line 27
    .line 28
    iget-object v0, p0, Ltech/sud/runtime/component/g/d;->a:[B

    .line 29
    .line 30
    invoke-virtual {p1}, Ltech/sud/runtime/component/g/b;->b()B

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/4 v2, 0x3

    .line 35
    aput-byte v1, v0, v2

    .line 36
    .line 37
    const-wide/16 v0, 0x4

    .line 38
    .line 39
    invoke-virtual {p1, v0, v1}, Ltech/sud/runtime/component/g/b;->b(J)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ltech/sud/runtime/component/g/b;->e()J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    iput-wide v0, p0, Ltech/sud/runtime/component/g/d;->b:J

    .line 47
    .line 48
    invoke-virtual {p1}, Ltech/sud/runtime/component/g/b;->e()J

    .line 49
    .line 50
    .line 51
    move-result-wide v0

    .line 52
    iput-wide v0, p0, Ltech/sud/runtime/component/g/d;->c:J

    .line 53
    .line 54
    new-instance p1, Ljava/lang/String;

    .line 55
    .line 56
    iget-object p0, p0, Ltech/sud/runtime/component/g/d;->a:[B

    .line 57
    .line 58
    const-string v0, "ISO-8859-1"

    .line 59
    .line 60
    invoke-direct {p1, p0, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Read dir tab ["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltech/sud/runtime/component/g/d;->a:[B

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    aget-byte v1, v1, v2

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Ltech/sud/runtime/component/g/d;->a:[B

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    aget-byte v2, v2, v3

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Ltech/sud/runtime/component/g/d;->a:[B

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    aget-byte v2, v2, v3

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ltech/sud/runtime/component/g/d;->a:[B

    .line 44
    .line 45
    const/4 v2, 0x3

    .line 46
    aget-byte v1, v1, v2

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v1, "] offset: "

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-wide v1, p0, Ltech/sud/runtime/component/g/d;->b:J

    .line 57
    .line 58
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, " bytesToUpload: "

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-wide v1, p0, Ltech/sud/runtime/component/g/d;->c:J

    .line 67
    .line 68
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v1, " name: "

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Ltech/sud/runtime/component/g/d;->a:[B

    .line 77
    .line 78
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method
