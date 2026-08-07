.class public final Lcom/tencent/cloud/ai/network/okio/s;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[B

.field public b:I

.field public c:I

.field public d:Z

.field public e:Z

.field public f:Lcom/tencent/cloud/ai/network/okio/s;

.field public g:Lcom/tencent/cloud/ai/network/okio/s;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x2000

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->e:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->d:Z

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>([BIIZZ)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 19
    iput p2, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 20
    iput p3, p0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 21
    iput-boolean p4, p0, Lcom/tencent/cloud/ai/network/okio/s;->d:Z

    .line 22
    iput-boolean p5, p0, Lcom/tencent/cloud/ai/network/okio/s;->e:Z

    return-void
.end method


# virtual methods
.method public a()Lcom/tencent/cloud/ai/network/okio/s;
    .locals 4

    .line 77
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    const/4 v1, 0x0

    if-eq v0, p0, :cond_0

    move-object v2, v0

    goto :goto_0

    :cond_0
    move-object v2, v1

    .line 78
    :goto_0
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    iput-object v0, v3, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 79
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    iput-object v3, v0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 80
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 81
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    return-object v2
.end method

.method public a(Lcom/tencent/cloud/ai/network/okio/s;)Lcom/tencent/cloud/ai/network/okio/s;
    .locals 1

    .line 73
    iput-object p0, p1, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 74
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    iput-object v0, p1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 75
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    iput-object p1, v0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 76
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    return-object p1
.end method

.method public a(Lcom/tencent/cloud/ai/network/okio/s;I)V
    .locals 4

    .line 1
    iget-boolean v0, p1, Lcom/tencent/cloud/ai/network/okio/s;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget v0, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 6
    .line 7
    add-int v1, v0, p2

    .line 8
    .line 9
    const/16 v2, 0x2000

    .line 10
    .line 11
    if-le v1, v2, :cond_2

    .line 12
    .line 13
    iget-boolean v3, p1, Lcom/tencent/cloud/ai/network/okio/s;->d:Z

    .line 14
    .line 15
    if-nez v3, :cond_1

    .line 16
    .line 17
    iget v3, p1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 18
    .line 19
    sub-int/2addr v1, v3

    .line 20
    if-gt v1, v2, :cond_0

    .line 21
    .line 22
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 23
    .line 24
    sub-int/2addr v0, v3

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-static {v1, v3, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    iget v0, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 30
    .line 31
    iget v1, p1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 32
    .line 33
    sub-int/2addr v0, v1

    .line 34
    iput v0, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 35
    .line 36
    iput v2, p1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 48
    .line 49
    iget v1, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 50
    .line 51
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 52
    .line 53
    iget v3, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 54
    .line 55
    invoke-static {v0, v1, v2, v3, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 56
    .line 57
    .line 58
    iget v0, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 59
    .line 60
    add-int/2addr v0, p2

    .line 61
    iput v0, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 62
    .line 63
    iget p1, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 64
    .line 65
    add-int/2addr p1, p2

    .line 66
    iput p1, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    invoke-static {}, Ll/fig0;->a()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public b()Lcom/tencent/cloud/ai/network/okio/s;
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->d:Z

    .line 3
    .line 4
    new-instance v1, Lcom/tencent/cloud/ai/network/okio/s;

    .line 5
    .line 6
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 7
    .line 8
    iget v3, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 9
    .line 10
    iget v4, p0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 11
    .line 12
    const/4 v5, 0x1

    .line 13
    const/4 v6, 0x0

    .line 14
    invoke-direct/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okio/s;-><init>([BIIZZ)V

    .line 15
    .line 16
    .line 17
    return-object v1
.end method
