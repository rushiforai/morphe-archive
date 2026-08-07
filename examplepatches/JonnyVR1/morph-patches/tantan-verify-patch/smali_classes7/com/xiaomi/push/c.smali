.class public final Lcom/xiaomi/push/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/c$a;
    }
.end annotation


# instance fields
.field private final a:[B

.field private final b:I

.field private c:I

.field private final d:Ljava/io/OutputStream;


# direct methods
.method private constructor <init>(Ljava/io/OutputStream;[B)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/xiaomi/push/c;->d:Ljava/io/OutputStream;

    .line 17
    iput-object p2, p0, Lcom/xiaomi/push/c;->a:[B

    const/4 p1, 0x0

    .line 18
    iput p1, p0, Lcom/xiaomi/push/c;->c:I

    .line 19
    array-length p1, p2

    iput p1, p0, Lcom/xiaomi/push/c;->b:I

    return-void
.end method

.method private constructor <init>([BII)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/xiaomi/push/c;->d:Ljava/io/OutputStream;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/xiaomi/push/c;->a:[B

    .line 8
    .line 9
    iput p2, p0, Lcom/xiaomi/push/c;->c:I

    .line 10
    .line 11
    add-int/2addr p2, p3

    .line 12
    iput p2, p0, Lcom/xiaomi/push/c;->b:I

    .line 13
    .line 14
    return-void
.end method

.method public static G(I)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/c;->V(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static H(II)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/c;->P(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Lcom/xiaomi/push/c;->G(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/2addr p0, p1

    .line 10
    return p0
.end method

.method public static I(IJ)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/c;->P(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1, p2}, Lcom/xiaomi/push/c;->J(J)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/2addr p0, p1

    .line 10
    return p0
.end method

.method public static J(J)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/xiaomi/push/c;->Q(J)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static P(I)I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/s1r0;->b(II)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    invoke-static {p0}, Lcom/xiaomi/push/c;->V(I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public static Q(J)I
    .locals 4

    .line 1
    const-wide/16 v0, -0x80

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const-wide/16 v0, -0x4000

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/4 p0, 0x2

    return p0

    :cond_1
    const-wide/32 v0, -0x200000

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    const/4 p0, 0x3

    return p0

    :cond_2
    const-wide/32 v0, -0x10000000

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_3

    const/4 p0, 0x4

    return p0

    :cond_3
    const-wide v0, -0x800000000L

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_4

    const/4 p0, 0x5

    return p0

    :cond_4
    const-wide v0, -0x40000000000L

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_5

    const/4 p0, 0x6

    return p0

    :cond_5
    const-wide/high16 v0, -0x2000000000000L

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_6

    const/4 p0, 0x7

    return p0

    :cond_6
    const-wide/high16 v0, -0x100000000000000L

    and-long/2addr v0, p0

    cmp-long v0, v0, v2

    if-nez v0, :cond_7

    const/16 p0, 0x8

    return p0

    :cond_7
    const-wide/high16 v0, -0x8000000000000000L

    and-long/2addr p0, v0

    cmp-long p0, p0, v2

    if-nez p0, :cond_8

    const/16 p0, 0x9

    return p0

    :cond_8
    const/16 p0, 0xa

    return p0
.end method

.method private R()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/c;->d:Ljava/io/OutputStream;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/xiaomi/push/c;->a:[B

    .line 6
    .line 7
    iget v2, p0, Lcom/xiaomi/push/c;->c:I

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 11
    .line 12
    .line 13
    iput v3, p0, Lcom/xiaomi/push/c;->c:I

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance p0, Lcom/xiaomi/push/c$a;

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/xiaomi/push/c$a;-><init>()V

    .line 19
    .line 20
    .line 21
    throw p0
.end method

.method public static V(I)I
    .locals 1

    .line 1
    and-int/lit8 v0, p0, -0x80

    if-nez v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    and-int/lit16 v0, p0, -0x4000

    if-nez v0, :cond_1

    const/4 p0, 0x2

    return p0

    :cond_1
    const/high16 v0, -0x200000

    and-int/2addr v0, p0

    if-nez v0, :cond_2

    const/4 p0, 0x3

    return p0

    :cond_2
    const/high16 v0, -0x10000000

    and-int/2addr p0, v0

    if-nez p0, :cond_3

    const/4 p0, 0x4

    return p0

    :cond_3
    const/4 p0, 0x5

    return p0
.end method

.method public static b(I)I
    .locals 0

    .line 1
    if-ltz p0, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Lcom/xiaomi/push/c;->V(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0

    .line 8
    :cond_0
    const/16 p0, 0xa

    .line 9
    .line 10
    return p0
.end method

.method public static c(II)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/c;->P(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Lcom/xiaomi/push/c;->b(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/2addr p0, p1

    .line 10
    return p0
.end method

.method public static d(IJ)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/c;->P(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1, p2}, Lcom/xiaomi/push/c;->i(J)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/2addr p0, p1

    .line 10
    return p0
.end method

.method public static e(ILjava/lang/String;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/c;->P(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Lcom/xiaomi/push/c;->j(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/2addr p0, p1

    .line 10
    return p0
.end method

.method public static f(ILl/asq0;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/c;->P(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Lcom/xiaomi/push/c;->k(Ll/asq0;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/2addr p0, p1

    .line 10
    return p0
.end method

.method public static g(ILl/e0r0;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/c;->P(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Lcom/xiaomi/push/c;->l(Ll/e0r0;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/2addr p0, p1

    .line 10
    return p0
.end method

.method public static h(IZ)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/c;->P(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Lcom/xiaomi/push/c;->m(Z)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    add-int/2addr p0, p1

    .line 10
    return p0
.end method

.method public static i(J)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/xiaomi/push/c;->Q(J)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static j(Ljava/lang/String;)I
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "UTF-8"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    array-length v0, p0

    .line 8
    invoke-static {v0}, Lcom/xiaomi/push/c;->V(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    array-length p0, p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    add-int/2addr v0, p0

    .line 14
    return v0

    .line 15
    :catch_0
    const-string p0, "UTF-8 not supported."

    .line 16
    .line 17
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public static k(Ll/asq0;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/asq0;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Lcom/xiaomi/push/c;->V(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Ll/asq0;->a()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    add-int/2addr v0, p0

    .line 14
    return v0
.end method

.method public static l(Ll/e0r0;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/e0r0;->i()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Lcom/xiaomi/push/c;->V(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public static m(Z)I
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public static n(Ljava/io/OutputStream;)Lcom/xiaomi/push/c;
    .locals 1

    .line 1
    const/16 v0, 0x1000

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/xiaomi/push/c;->o(Ljava/io/OutputStream;I)Lcom/xiaomi/push/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static o(Ljava/io/OutputStream;I)Lcom/xiaomi/push/c;
    .locals 1

    .line 1
    new-instance v0, Lcom/xiaomi/push/c;

    .line 2
    .line 3
    new-array p1, p1, [B

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Lcom/xiaomi/push/c;-><init>(Ljava/io/OutputStream;[B)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static p([BII)Lcom/xiaomi/push/c;
    .locals 1

    .line 1
    new-instance v0, Lcom/xiaomi/push/c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/xiaomi/push/c;-><init>([BII)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public A(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "UTF-8"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    array-length v0, p1

    .line 8
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/c;->W(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/c;->E([B)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public B(Ll/asq0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/asq0;->d()[B

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    array-length v0, p1

    .line 6
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/c;->W(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/c;->E([B)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public C(Ll/e0r0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/e0r0;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/c;->W(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Ll/e0r0;->e(Lcom/xiaomi/push/c;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public D(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/c;->S(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public E([B)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    array-length v1, p1

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lcom/xiaomi/push/c;->F([BII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F([BII)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/xiaomi/push/c;->b:I

    .line 2
    .line 3
    iget v1, p0, Lcom/xiaomi/push/c;->c:I

    .line 4
    .line 5
    sub-int v2, v0, v1

    .line 6
    .line 7
    iget-object v3, p0, Lcom/xiaomi/push/c;->a:[B

    .line 8
    .line 9
    if-lt v2, p3, :cond_0

    .line 10
    .line 11
    invoke-static {p1, p2, v3, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    iget p1, p0, Lcom/xiaomi/push/c;->c:I

    .line 15
    .line 16
    add-int/2addr p1, p3

    .line 17
    iput p1, p0, Lcom/xiaomi/push/c;->c:I

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sub-int/2addr v0, v1

    .line 21
    invoke-static {p1, p2, v3, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 22
    .line 23
    .line 24
    add-int/2addr p2, v0

    .line 25
    sub-int/2addr p3, v0

    .line 26
    iget v0, p0, Lcom/xiaomi/push/c;->b:I

    .line 27
    .line 28
    iput v0, p0, Lcom/xiaomi/push/c;->c:I

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/xiaomi/push/c;->R()V

    .line 31
    .line 32
    .line 33
    iget v0, p0, Lcom/xiaomi/push/c;->b:I

    .line 34
    .line 35
    if-gt p3, v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/xiaomi/push/c;->a:[B

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 41
    .line 42
    .line 43
    iput p3, p0, Lcom/xiaomi/push/c;->c:I

    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object p0, p0, Lcom/xiaomi/push/c;->d:Ljava/io/OutputStream;

    .line 47
    .line 48
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public K()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/c;->a()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "Did not write as much data as expected."

    .line 9
    .line 10
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public L(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/c;->W(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public M(II)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/c;->T(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/xiaomi/push/c;->L(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public N(IJ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/c;->T(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2, p3}, Lcom/xiaomi/push/c;->O(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public O(J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/xiaomi/push/c;->U(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public S(I)V
    .locals 0

    .line 1
    int-to-byte p1, p1

    .line 2
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/c;->r(B)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public T(II)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/s1r0;->b(II)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/c;->W(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public U(J)V
    .locals 4

    .line 1
    :goto_0
    const-wide/16 v0, -0x80

    .line 2
    .line 3
    and-long/2addr v0, p1

    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    long-to-int p1, p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/c;->S(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    long-to-int v0, p1

    .line 16
    and-int/lit8 v0, v0, 0x7f

    .line 17
    .line 18
    or-int/lit16 v0, v0, 0x80

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/c;->S(I)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x7

    .line 24
    ushr-long/2addr p1, v0

    .line 25
    goto :goto_0
.end method

.method public W(I)V
    .locals 1

    .line 1
    :goto_0
    and-int/lit8 v0, p1, -0x80

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/c;->S(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    and-int/lit8 v0, p1, 0x7f

    .line 10
    .line 11
    or-int/lit16 v0, v0, 0x80

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/c;->S(I)V

    .line 14
    .line 15
    .line 16
    ushr-int/lit8 p1, p1, 0x7

    .line 17
    .line 18
    goto :goto_0
.end method

.method public a()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/c;->d:Ljava/io/OutputStream;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/xiaomi/push/c;->b:I

    .line 6
    .line 7
    iget p0, p0, Lcom/xiaomi/push/c;->c:I

    .line 8
    .line 9
    sub-int/2addr v0, p0

    .line 10
    return v0

    .line 11
    :cond_0
    const-string p0, "spaceLeft() can only be called on CodedOutputStreams that are writing to a flat array."

    .line 12
    .line 13
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/c;->d:Ljava/io/OutputStream;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/xiaomi/push/c;->R()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public r(B)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/xiaomi/push/c;->c:I

    .line 2
    .line 3
    iget v1, p0, Lcom/xiaomi/push/c;->b:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/xiaomi/push/c;->R()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/c;->a:[B

    .line 11
    .line 12
    iget v1, p0, Lcom/xiaomi/push/c;->c:I

    .line 13
    .line 14
    add-int/lit8 v2, v1, 0x1

    .line 15
    .line 16
    iput v2, p0, Lcom/xiaomi/push/c;->c:I

    .line 17
    .line 18
    aput-byte p1, v0, v1

    .line 19
    .line 20
    return-void
.end method

.method public s(I)V
    .locals 2

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/c;->W(I)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    int-to-long v0, p1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/push/c;->U(J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t(II)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/c;->T(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/xiaomi/push/c;->s(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public u(IJ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/c;->T(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2, p3}, Lcom/xiaomi/push/c;->z(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public v(ILjava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/c;->T(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/xiaomi/push/c;->A(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public w(ILl/asq0;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/c;->T(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/xiaomi/push/c;->B(Ll/asq0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public x(ILl/e0r0;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/c;->T(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/xiaomi/push/c;->C(Ll/e0r0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public y(IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/c;->T(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/xiaomi/push/c;->D(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z(J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/xiaomi/push/c;->U(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
