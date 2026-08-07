.class public Ll/oxd0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:[B

.field public b:Ljava/nio/ByteBuffer;

.field public c:J

.field public d:Ljava/lang/String;

.field public e:I

.field public f:I

.field private g:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 51
    iput-object v0, p0, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    const/4 v1, 0x2

    .line 52
    iput v1, p0, Ll/oxd0;->f:I

    const/4 v1, 0x1

    .line 53
    iput-boolean v1, p0, Ll/oxd0;->g:Z

    const/4 v1, 0x0

    .line 54
    iput v1, p0, Ll/oxd0;->e:I

    .line 55
    new-array v1, v1, [B

    iput-object v1, p0, Ll/oxd0;->a:[B

    const-wide/16 v1, 0x0

    .line 56
    iput-wide v1, p0, Ll/oxd0;->c:J

    .line 57
    iput-object v0, p0, Ll/oxd0;->d:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;JI)V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput-object v0, p0, Ll/oxd0;->a:[B

    .line 42
    iput-object v0, p0, Ll/oxd0;->d:Ljava/lang/String;

    const/4 v0, 0x0

    .line 43
    iput v0, p0, Ll/oxd0;->e:I

    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Ll/oxd0;->g:Z

    .line 45
    iput-object p1, p0, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 46
    iput-wide p2, p0, Ll/oxd0;->c:J

    .line 47
    iput p4, p0, Ll/oxd0;->f:I

    .line 48
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    iput-object p1, p0, Ll/oxd0;->a:[B

    if-eqz p1, :cond_0

    .line 49
    iget-object p1, p0, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    move-result p1

    iput p1, p0, Ll/oxd0;->e:I

    :cond_0
    return-void
.end method

.method public constructor <init>([BJI)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    iput-wide v1, p0, Ll/oxd0;->c:J

    .line 10
    .line 11
    iput-object v0, p0, Ll/oxd0;->d:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Ll/oxd0;->e:I

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    iput v0, p0, Ll/oxd0;->f:I

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Ll/oxd0;->g:Z

    .line 21
    .line 22
    iput-object p1, p0, Ll/oxd0;->a:[B

    .line 23
    .line 24
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    iput p4, p0, Ll/oxd0;->f:I

    .line 31
    .line 32
    iput-wide p2, p0, Ll/oxd0;->c:J

    .line 33
    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    array-length p1, p1

    .line 37
    iput p1, p0, Ll/oxd0;->e:I

    .line 38
    .line 39
    :cond_0
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/oxd0;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public b()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oxd0;->a:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public d()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/oxd0;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/oxd0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public f()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/oxd0;->e:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/oxd0;->a:[B

    .line 6
    .line 7
    iput-object v0, p0, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    iput-wide v1, p0, Ll/oxd0;->c:J

    .line 12
    .line 13
    iput-object v0, p0, Ll/oxd0;->d:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/oxd0;->g:Z

    .line 2
    .line 3
    return-void
.end method
