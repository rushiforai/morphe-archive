.class public Ll/i13;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/nio/ByteBuffer;

.field b:I

.field c:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/i13;->c:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/i13;->a:Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Ll/i13;->b:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 5

    .line 1
    iget v0, p0, Ll/i13;->c:I

    .line 2
    .line 3
    rem-int/lit8 v1, v0, 0x8

    .line 4
    .line 5
    rsub-int/lit8 v1, v1, 0x8

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-gt p2, v1, :cond_2

    .line 9
    .line 10
    iget-object v3, p0, Ll/i13;->a:Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    iget v4, p0, Ll/i13;->b:I

    .line 13
    .line 14
    div-int/lit8 v0, v0, 0x8

    .line 15
    .line 16
    add-int/2addr v4, v0

    .line 17
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->get(I)B

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-gez v0, :cond_0

    .line 22
    .line 23
    add-int/lit16 v0, v0, 0x100

    .line 24
    .line 25
    :cond_0
    sub-int/2addr v1, p2

    .line 26
    shl-int/2addr p1, v1

    .line 27
    add-int/2addr v0, p1

    .line 28
    iget-object p1, p0, Ll/i13;->a:Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    iget v1, p0, Ll/i13;->b:I

    .line 31
    .line 32
    iget v3, p0, Ll/i13;->c:I

    .line 33
    .line 34
    div-int/lit8 v3, v3, 0x8

    .line 35
    .line 36
    add-int/2addr v1, v3

    .line 37
    const/16 v3, 0x7f

    .line 38
    .line 39
    if-le v0, v3, :cond_1

    .line 40
    .line 41
    add-int/lit16 v0, v0, -0x100

    .line 42
    .line 43
    :cond_1
    int-to-byte v0, v0

    .line 44
    invoke-virtual {p1, v1, v0}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    iget p1, p0, Ll/i13;->c:I

    .line 48
    .line 49
    add-int/2addr p1, p2

    .line 50
    iput p1, p0, Ll/i13;->c:I

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    sub-int/2addr p2, v1

    .line 54
    shr-int v0, p1, p2

    .line 55
    .line 56
    invoke-virtual {p0, v0, v1}, Ll/i13;->a(II)V

    .line 57
    .line 58
    .line 59
    shl-int v0, v2, p2

    .line 60
    .line 61
    sub-int/2addr v0, v2

    .line 62
    and-int/2addr p1, v0

    .line 63
    invoke-virtual {p0, p1, p2}, Ll/i13;->a(II)V

    .line 64
    .line 65
    .line 66
    :goto_0
    iget-object p1, p0, Ll/i13;->a:Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    iget p2, p0, Ll/i13;->b:I

    .line 69
    .line 70
    iget p0, p0, Ll/i13;->c:I

    .line 71
    .line 72
    div-int/lit8 v0, p0, 0x8

    .line 73
    .line 74
    add-int/2addr p2, v0

    .line 75
    rem-int/lit8 p0, p0, 0x8

    .line 76
    .line 77
    if-lez p0, :cond_3

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    const/4 v2, 0x0

    .line 81
    :goto_1
    add-int/2addr p2, v2

    .line 82
    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 83
    .line 84
    .line 85
    return-void
.end method
