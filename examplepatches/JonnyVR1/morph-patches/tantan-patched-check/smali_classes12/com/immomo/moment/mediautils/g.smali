.class public Lcom/immomo/moment/mediautils/g;
.super Lcom/immomo/moment/mediautils/m;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/g$b;,
        Lcom/immomo/moment/mediautils/g$c;
    }
.end annotation


# instance fields
.field private K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

.field private L:Lcom/immomo/moment/mediautils/g$c;

.field private M:Lcom/immomo/moment/mediautils/g$b;

.field private N:Ljava/lang/Thread;

.field private O:Ljava/lang/Thread;

.field private P:Z

.field private Q:Z

.field private R:Z

.field private S:Z

.field private T:J

.field private U:J

.field private V:Ljava/lang/Thread;

.field private W:Z

.field private X:Z

.field private Y:Z

.field private Z:Z

.field private a0:Z

.field private b0:Ljava/lang/Boolean;

.field private c0:Ljava/lang/Object;

.field private d0:Ljava/lang/Object;

.field private e0:Ljava/lang/Object;

.field private f0:I

.field private g0:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field protected h0:J

.field protected i0:J

.field protected j0:J

.field k0:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/m;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/FFVideoDecoder;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 10
    .line 11
    new-instance v0, Lcom/immomo/moment/mediautils/g$c;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/g$c;-><init>(Lcom/immomo/moment/mediautils/g;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->L:Lcom/immomo/moment/mediautils/g$c;

    .line 17
    .line 18
    new-instance v0, Lcom/immomo/moment/mediautils/g$b;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/g$b;-><init>(Lcom/immomo/moment/mediautils/g;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->M:Lcom/immomo/moment/mediautils/g$b;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->N:Ljava/lang/Thread;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->O:Ljava/lang/Thread;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/g;->P:Z

    .line 32
    .line 33
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/g;->Q:Z

    .line 34
    .line 35
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/g;->R:Z

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/g;->S:Z

    .line 39
    .line 40
    const-wide/16 v3, 0x0

    .line 41
    .line 42
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/g;->T:J

    .line 43
    .line 44
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/g;->U:J

    .line 45
    .line 46
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->V:Ljava/lang/Thread;

    .line 47
    .line 48
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/g;->W:Z

    .line 49
    .line 50
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/g;->X:Z

    .line 51
    .line 52
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/g;->Y:Z

    .line 53
    .line 54
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/g;->Z:Z

    .line 55
    .line 56
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/g;->a0:Z

    .line 57
    .line 58
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->b0:Ljava/lang/Boolean;

    .line 61
    .line 62
    new-instance v0, Ljava/lang/Object;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->c0:Ljava/lang/Object;

    .line 68
    .line 69
    new-instance v0, Ljava/lang/Object;

    .line 70
    .line 71
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->d0:Ljava/lang/Object;

    .line 75
    .line 76
    new-instance v0, Ljava/lang/Object;

    .line 77
    .line 78
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->e0:Ljava/lang/Object;

    .line 82
    .line 83
    iput v2, p0, Lcom/immomo/moment/mediautils/g;->f0:I

    .line 84
    .line 85
    new-instance v0, Ljava/util/LinkedList;

    .line 86
    .line 87
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->g0:Ljava/util/LinkedList;

    .line 91
    .line 92
    const-wide/16 v0, -0x1

    .line 93
    .line 94
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/g;->h0:J

    .line 95
    .line 96
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/g;->i0:J

    .line 97
    .line 98
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/g;->j0:J

    .line 99
    .line 100
    new-instance v2, Lcom/immomo/moment/mediautils/g$a;

    .line 101
    .line 102
    invoke-direct {v2, p0}, Lcom/immomo/moment/mediautils/g$a;-><init>(Lcom/immomo/moment/mediautils/g;)V

    .line 103
    .line 104
    .line 105
    iput-object v2, p0, Lcom/immomo/moment/mediautils/g;->k0:Ljava/lang/Runnable;

    .line 106
    .line 107
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 108
    .line 109
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 110
    .line 111
    return-void
.end method

.method public static synthetic D(Lcom/immomo/moment/mediautils/g;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/g;->R:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic E(Lcom/immomo/moment/mediautils/g;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/g;->W:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic F(Lcom/immomo/moment/mediautils/g;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/g;->Q:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic G(Lcom/immomo/moment/mediautils/g;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/g;->Q:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic H(Lcom/immomo/moment/mediautils/g;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/g;->f0:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic I(Lcom/immomo/moment/mediautils/g;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/g;->c0:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic J(Lcom/immomo/moment/mediautils/g;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/g;->Y:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic K(Lcom/immomo/moment/mediautils/g;J)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/g;->Y(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic L(Lcom/immomo/moment/mediautils/g;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/g;->d0:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M(Lcom/immomo/moment/mediautils/g;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/g;->X:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic N(Lcom/immomo/moment/mediautils/g;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/g;->U:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic O(Lcom/immomo/moment/mediautils/g;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/g;->U:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic P(Lcom/immomo/moment/mediautils/g;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/g;->T:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic Q(Lcom/immomo/moment/mediautils/g;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/g;->T:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic R(Lcom/immomo/moment/mediautils/g;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/g;->P:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic S(Lcom/immomo/moment/mediautils/g;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/g;->P:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic T(Lcom/immomo/moment/mediautils/g;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/g;->a0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic U(Lcom/immomo/moment/mediautils/g;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/g;->g0:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic V(Lcom/immomo/moment/mediautils/g;)Lcom/immomo/moment/mediautils/FFVideoDecoder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic W(Lcom/immomo/moment/mediautils/g;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/g;->e0:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X(Lcom/immomo/moment/mediautils/g;J)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/g;->Z(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private Y(J)Z
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/g;->h0:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    const/4 v5, 0x1

    .line 8
    if-ltz v4, :cond_1

    .line 9
    .line 10
    iget-wide v6, p0, Lcom/immomo/moment/mediautils/g;->j0:J

    .line 11
    .line 12
    cmp-long v2, v6, v2

    .line 13
    .line 14
    if-lez v2, :cond_1

    .line 15
    .line 16
    cmp-long v0, v6, v0

    .line 17
    .line 18
    if-lez v0, :cond_1

    .line 19
    .line 20
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/g;->i0:J

    .line 21
    .line 22
    cmp-long v0, p1, v0

    .line 23
    .line 24
    if-ltz v0, :cond_0

    .line 25
    .line 26
    cmp-long v0, p1, v6

    .line 27
    .line 28
    if-gtz v0, :cond_0

    .line 29
    .line 30
    return v5

    .line 31
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v1, "out of range curPts:"

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p1, " mStartPtsUs:"

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-wide p1, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 47
    .line 48
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p1, " mEndPtsUs:"

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-wide p1, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 57
    .line 58
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p1, " mSeekStartPts:"

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-wide p0, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 67
    .line 68
    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "FFDecoderWrapper"

    .line 76
    .line 77
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    const/4 p0, 0x0

    .line 81
    return p0

    .line 82
    :cond_1
    return v5
.end method

.method private Z(J)Z
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    const/4 v5, 0x1

    .line 8
    if-ltz v4, :cond_1

    .line 9
    .line 10
    iget-wide v6, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 11
    .line 12
    cmp-long v2, v6, v2

    .line 13
    .line 14
    if-lez v2, :cond_1

    .line 15
    .line 16
    cmp-long v0, v6, v0

    .line 17
    .line 18
    if-lez v0, :cond_1

    .line 19
    .line 20
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 21
    .line 22
    cmp-long v0, p1, v0

    .line 23
    .line 24
    if-ltz v0, :cond_0

    .line 25
    .line 26
    cmp-long v0, p1, v6

    .line 27
    .line 28
    if-gtz v0, :cond_0

    .line 29
    .line 30
    return v5

    .line 31
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v1, "out of range curPts:"

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p1, " mStartPtsUs:"

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-wide p1, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 47
    .line 48
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p1, " mEndPtsUs:"

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-wide p1, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 57
    .line 58
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p1, " mSeekStartPts:"

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-wide p0, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 67
    .line 68
    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "FFDecoderWrapper"

    .line 76
    .line 77
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    const/4 p0, 0x0

    .line 81
    return p0

    .line 82
    :cond_1
    return v5
.end method


# virtual methods
.method public B()Z
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "start pid:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "FFDecoderWrapper"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->b0:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Lcom/immomo/moment/mediautils/g;->a0(J)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/g;->s()V

    .line 42
    .line 43
    .line 44
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 45
    .line 46
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->start()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->b0:Ljava/lang/Boolean;

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/g;->W:Z

    .line 64
    .line 65
    new-instance v0, Ljava/lang/Thread;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/immomo/moment/mediautils/g;->L:Lcom/immomo/moment/mediautils/g$c;

    .line 68
    .line 69
    const-string v2, "getMeidaTh"

    .line 70
    .line 71
    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->N:Ljava/lang/Thread;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 77
    .line 78
    .line 79
    new-instance v0, Ljava/lang/Thread;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/immomo/moment/mediautils/g;->M:Lcom/immomo/moment/mediautils/g$b;

    .line 82
    .line 83
    const-string v2, "getAMeidaTh"

    .line 84
    .line 85
    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->O:Ljava/lang/Thread;

    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 91
    .line 92
    .line 93
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 94
    .line 95
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 96
    .line 97
    iget-object p0, p0, Lcom/immomo/moment/mediautils/g;->b0:Ljava/lang/Boolean;

    .line 98
    .line 99
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    return p0
.end method

.method public C(J)Z
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "startWidthTime ptsUs:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " pid:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "FFDecoderWrapper"

    .line 32
    .line 33
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->b0:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const-wide/16 v2, 0x0

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    const-string v0, "already decoding"

    .line 47
    .line 48
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/m;->I:Z

    .line 52
    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 56
    .line 57
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 58
    .line 59
    sub-long/2addr v0, p1

    .line 60
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 61
    .line 62
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/g;->h0:J

    .line 63
    .line 64
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/g;->i0:J

    .line 65
    .line 66
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->m:J

    .line 67
    .line 68
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/g;->j0:J

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 72
    .line 73
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/immomo/moment/mediautils/g;->a0(J)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/g;->s()V

    .line 77
    .line 78
    .line 79
    const/4 p0, 0x1

    .line 80
    return p0

    .line 81
    :cond_1
    const-string v0, "start decoding"

    .line 82
    .line 83
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 87
    .line 88
    invoke-virtual {v0, p1, p2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->seek(J)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->start()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->b0:Ljava/lang/Boolean;

    .line 102
    .line 103
    new-instance v0, Ljava/lang/Thread;

    .line 104
    .line 105
    iget-object v1, p0, Lcom/immomo/moment/mediautils/g;->L:Lcom/immomo/moment/mediautils/g$c;

    .line 106
    .line 107
    const-string v4, "getMeidaTh"

    .line 108
    .line 109
    invoke-direct {v0, v1, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->N:Ljava/lang/Thread;

    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 115
    .line 116
    .line 117
    new-instance v0, Ljava/lang/Thread;

    .line 118
    .line 119
    iget-object v1, p0, Lcom/immomo/moment/mediautils/g;->M:Lcom/immomo/moment/mediautils/g$b;

    .line 120
    .line 121
    const-string v4, "getAMeidaTh"

    .line 122
    .line 123
    invoke-direct {v0, v1, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    iput-object v0, p0, Lcom/immomo/moment/mediautils/g;->O:Ljava/lang/Thread;

    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 129
    .line 130
    .line 131
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/m;->I:Z

    .line 132
    .line 133
    if-eqz v0, :cond_2

    .line 134
    .line 135
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 136
    .line 137
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 138
    .line 139
    sub-long/2addr v0, p1

    .line 140
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_2
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 144
    .line 145
    :goto_1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/g;->b0:Ljava/lang/Boolean;

    .line 146
    .line 147
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    return p0
.end method

.method public a0(J)V
    .locals 3

    .line 1
    const-string v0, "FFDecoderWrapper"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "seek:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->e0:Ljava/lang/Object;

    .line 21
    .line 22
    monitor-enter v0

    .line 23
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/g;->g0:Ljava/util/LinkedList;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 26
    .line 27
    .line 28
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 30
    .line 31
    const-wide/16 v1, 0x3e8

    .line 32
    .line 33
    div-long/2addr p1, v1

    .line 34
    invoke-virtual {v0, p1, p2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->seek(J)V

    .line 35
    .line 36
    .line 37
    const-wide/16 p1, 0x0

    .line 38
    .line 39
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/g;->U:J

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/g;->P:Z

    .line 43
    .line 44
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/g;->Q:Z

    .line 45
    .line 46
    return-void

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    throw p0
.end method

.method public o()V
    .locals 4

    .line 1
    const-string v0, "FFDecoderWrapper"

    .line 2
    .line 3
    const-string v1, "pause"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/g;->W:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->pause()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->c0:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-enter v0

    .line 19
    :goto_0
    const-wide/16 v1, 0xf

    .line 20
    .line 21
    :try_start_0
    iget-boolean v3, p0, Lcom/immomo/moment/mediautils/g;->Y:Z

    .line 22
    .line 23
    if-nez v3, :cond_0

    .line 24
    .line 25
    iget-object v3, p0, Lcom/immomo/moment/mediautils/g;->c0:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-virtual {v3, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_3

    .line 33
    :catch_0
    move-exception v3

    .line 34
    :try_start_1
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 35
    .line 36
    .line 37
    :cond_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    iget-object v3, p0, Lcom/immomo/moment/mediautils/g;->d0:Ljava/lang/Object;

    .line 39
    .line 40
    monitor-enter v3

    .line 41
    :goto_1
    :try_start_2
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/g;->X:Z

    .line 42
    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->d0:Ljava/lang/Object;

    .line 46
    .line 47
    invoke-virtual {v0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :catchall_1
    move-exception p0

    .line 52
    goto :goto_2

    .line 53
    :catch_1
    move-exception p0

    .line 54
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 55
    .line 56
    .line 57
    :cond_1
    monitor-exit v3

    .line 58
    return-void

    .line 59
    :goto_2
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 60
    throw p0

    .line 61
    :goto_3
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 62
    throw p0
.end method

.method public p(Ljava/lang/String;I)Z
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "prepare path:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " sourceType:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " mStartPtsUs:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-wide v1, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, " mEndPtsUs:"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-wide v1, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "FFDecoderWrapper"

    .line 44
    .line 45
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    if-nez p1, :cond_0

    .line 50
    .line 51
    return v0

    .line 52
    :cond_0
    iput p2, p0, Lcom/immomo/moment/mediautils/g;->f0:I

    .line 53
    .line 54
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 55
    .line 56
    invoke-virtual {v2, p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->setDataSource(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->selectMeidaTrack(I)V

    .line 62
    .line 63
    .line 64
    iget-wide v3, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 65
    .line 66
    iget-wide v5, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 67
    .line 68
    iget-boolean v7, p0, Lcom/immomo/moment/mediautils/m;->I:Z

    .line 69
    .line 70
    move-object v2, p0

    .line 71
    invoke-super/range {v2 .. v7}, Lcom/immomo/moment/mediautils/m;->t(JJZ)V

    .line 72
    .line 73
    .line 74
    iget-object v3, v2, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 75
    .line 76
    iget-wide p0, v2, Lcom/immomo/moment/mediautils/m;->o:J

    .line 77
    .line 78
    const-wide/16 v4, 0x3e8

    .line 79
    .line 80
    div-long/2addr p0, v4

    .line 81
    iget-wide v6, v2, Lcom/immomo/moment/mediautils/m;->q:J

    .line 82
    .line 83
    div-long/2addr v6, v4

    .line 84
    iget-boolean v8, v2, Lcom/immomo/moment/mediautils/m;->I:Z

    .line 85
    .line 86
    move-wide v4, p0

    .line 87
    invoke-virtual/range {v3 .. v8}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->setDecoderRange(JJZ)V

    .line 88
    .line 89
    .line 90
    iget-object p0, v2, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 91
    .line 92
    iget p1, v2, Lcom/immomo/moment/mediautils/m;->f:I

    .line 93
    .line 94
    iget p2, v2, Lcom/immomo/moment/mediautils/m;->h:I

    .line 95
    .line 96
    iget v3, v2, Lcom/immomo/moment/mediautils/m;->g:I

    .line 97
    .line 98
    invoke-virtual {p0, p1, p2, v3}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->setOutAudioInfo(III)V

    .line 99
    .line 100
    .line 101
    iget-object p0, v2, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->prepare()Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_9

    .line 108
    .line 109
    iget-object p1, v2, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getSampleRate()I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    iget-object p2, v2, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 116
    .line 117
    invoke-virtual {p2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getAudioChannel()I

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    iget-object v3, v2, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 122
    .line 123
    invoke-virtual {v3}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getAudioBits()I

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    iget v4, v2, Lcom/immomo/moment/mediautils/m;->f:I

    .line 128
    .line 129
    if-gtz v4, :cond_1

    .line 130
    .line 131
    if-eqz p1, :cond_1

    .line 132
    .line 133
    iput p1, v2, Lcom/immomo/moment/mediautils/m;->f:I

    .line 134
    .line 135
    :cond_1
    iget v4, v2, Lcom/immomo/moment/mediautils/m;->h:I

    .line 136
    .line 137
    if-gtz v4, :cond_2

    .line 138
    .line 139
    if-eqz p2, :cond_2

    .line 140
    .line 141
    iput p2, v2, Lcom/immomo/moment/mediautils/m;->h:I

    .line 142
    .line 143
    :cond_2
    iget v4, v2, Lcom/immomo/moment/mediautils/m;->g:I

    .line 144
    .line 145
    if-gtz v4, :cond_3

    .line 146
    .line 147
    if-eqz v3, :cond_3

    .line 148
    .line 149
    iput v3, v2, Lcom/immomo/moment/mediautils/m;->g:I

    .line 150
    .line 151
    :cond_3
    iget-object v4, v2, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 152
    .line 153
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getWidth()I

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    iput v4, v2, Lcom/immomo/moment/mediautils/m;->a:I

    .line 158
    .line 159
    iget-object v4, v2, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 160
    .line 161
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getHeight()I

    .line 162
    .line 163
    .line 164
    move-result v4

    .line 165
    iput v4, v2, Lcom/immomo/moment/mediautils/m;->b:I

    .line 166
    .line 167
    iget-object v4, v2, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 168
    .line 169
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getRotation()I

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    iput v4, v2, Lcom/immomo/moment/mediautils/m;->k:I

    .line 174
    .line 175
    iget-object v4, v2, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 176
    .line 177
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getVideoDuration()I

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    int-to-long v4, v4

    .line 182
    iput-wide v4, v2, Lcom/immomo/moment/mediautils/m;->m:J

    .line 183
    .line 184
    iget-object v4, v2, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 185
    .line 186
    if-nez v4, :cond_4

    .line 187
    .line 188
    new-instance v4, Landroid/media/MediaFormat;

    .line 189
    .line 190
    invoke-direct {v4}, Landroid/media/MediaFormat;-><init>()V

    .line 191
    .line 192
    .line 193
    iput-object v4, v2, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 194
    .line 195
    :cond_4
    iget-object v4, v2, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 196
    .line 197
    const-string v5, "width"

    .line 198
    .line 199
    iget v6, v2, Lcom/immomo/moment/mediautils/m;->a:I

    .line 200
    .line 201
    invoke-virtual {v4, v5, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 202
    .line 203
    .line 204
    iget-object v4, v2, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 205
    .line 206
    const-string v5, "height"

    .line 207
    .line 208
    iget v6, v2, Lcom/immomo/moment/mediautils/m;->b:I

    .line 209
    .line 210
    invoke-virtual {v4, v5, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 211
    .line 212
    .line 213
    iget-object v4, v2, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 214
    .line 215
    const-string v5, "rotation-degrees"

    .line 216
    .line 217
    iget v6, v2, Lcom/immomo/moment/mediautils/m;->k:I

    .line 218
    .line 219
    invoke-virtual {v4, v5, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 220
    .line 221
    .line 222
    new-instance v4, Ljava/lang/StringBuilder;

    .line 223
    .line 224
    const-string v5, "mVideoWidth:"

    .line 225
    .line 226
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    iget v5, v2, Lcom/immomo/moment/mediautils/m;->a:I

    .line 230
    .line 231
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    const-string v5, " mVideoHeight:"

    .line 235
    .line 236
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    iget v5, v2, Lcom/immomo/moment/mediautils/m;->b:I

    .line 240
    .line 241
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    const-string v5, " mRotation:"

    .line 245
    .line 246
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    iget v5, v2, Lcom/immomo/moment/mediautils/m;->k:I

    .line 250
    .line 251
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v4

    .line 258
    invoke-static {v1, v4}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    const-string v4, "channel-count"

    .line 262
    .line 263
    const-string v5, "sample-rate"

    .line 264
    .line 265
    if-eqz v3, :cond_6

    .line 266
    .line 267
    if-eqz p2, :cond_6

    .line 268
    .line 269
    if-eqz p1, :cond_6

    .line 270
    .line 271
    iget-object v0, v2, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 272
    .line 273
    if-nez v0, :cond_5

    .line 274
    .line 275
    new-instance v0, Landroid/media/MediaFormat;

    .line 276
    .line 277
    invoke-direct {v0}, Landroid/media/MediaFormat;-><init>()V

    .line 278
    .line 279
    .line 280
    iput-object v0, v2, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 281
    .line 282
    :cond_5
    const-string v0, "Set audio media format !!"

    .line 283
    .line 284
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    iget-object v0, v2, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 288
    .line 289
    invoke-virtual {v0, v5, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 290
    .line 291
    .line 292
    iget-object p1, v2, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 293
    .line 294
    invoke-virtual {p1, v4, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 295
    .line 296
    .line 297
    goto :goto_0

    .line 298
    :cond_6
    if-nez p1, :cond_8

    .line 299
    .line 300
    if-nez p2, :cond_8

    .line 301
    .line 302
    if-nez v3, :cond_8

    .line 303
    .line 304
    iget p1, v2, Lcom/immomo/moment/mediautils/g;->f0:I

    .line 305
    .line 306
    and-int/lit8 p1, p1, 0x1

    .line 307
    .line 308
    if-eqz p1, :cond_8

    .line 309
    .line 310
    iget-boolean p1, v2, Lcom/immomo/moment/mediautils/g;->S:Z

    .line 311
    .line 312
    if-eqz p1, :cond_8

    .line 313
    .line 314
    iput-boolean v0, v2, Lcom/immomo/moment/mediautils/g;->R:Z

    .line 315
    .line 316
    iget-object p1, v2, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 317
    .line 318
    if-nez p1, :cond_7

    .line 319
    .line 320
    new-instance p1, Landroid/media/MediaFormat;

    .line 321
    .line 322
    invoke-direct {p1}, Landroid/media/MediaFormat;-><init>()V

    .line 323
    .line 324
    .line 325
    iput-object p1, v2, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 326
    .line 327
    :cond_7
    const-string p1, "Set dumy audio media format !!"

    .line 328
    .line 329
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    iget-object p1, v2, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 333
    .line 334
    iget p2, v2, Lcom/immomo/moment/mediautils/m;->f:I

    .line 335
    .line 336
    invoke-virtual {p1, v5, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 337
    .line 338
    .line 339
    iget-object p1, v2, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 340
    .line 341
    iget p2, v2, Lcom/immomo/moment/mediautils/m;->h:I

    .line 342
    .line 343
    invoke-virtual {p1, v4, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 344
    .line 345
    .line 346
    new-instance p1, Ljava/lang/Thread;

    .line 347
    .line 348
    iget-object p2, v2, Lcom/immomo/moment/mediautils/g;->k0:Ljava/lang/Runnable;

    .line 349
    .line 350
    new-instance v0, Ljava/lang/StringBuilder;

    .line 351
    .line 352
    const-string v3, "InsertMuteAudioData"

    .line 353
    .line 354
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    invoke-static {}, Ll/g8g0;->b()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v3

    .line 361
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    invoke-direct {p1, p2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    iput-object p1, v2, Lcom/immomo/moment/mediautils/g;->V:Ljava/lang/Thread;

    .line 372
    .line 373
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 374
    .line 375
    .line 376
    :cond_8
    :goto_0
    iget-object p1, v2, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 377
    .line 378
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->start()Z

    .line 379
    .line 380
    .line 381
    const-string p1, "Prepare Complete  Success!!"

    .line 382
    .line 383
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    return p0

    .line 387
    :cond_9
    const-string p1, "Prepare Complete Failed !!"

    .line 388
    .line 389
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    return p0
.end method

.method public q()V
    .locals 3

    .line 1
    const-string v0, "FFDecoderWrapper"

    .line 2
    .line 3
    const-string v1, "release"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/g;->R:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->V:Ljava/lang/Thread;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catch_0
    move-exception v0

    .line 21
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 22
    .line 23
    .line 24
    :goto_0
    iput-object v1, p0, Lcom/immomo/moment/mediautils/g;->V:Ljava/lang/Thread;

    .line 25
    .line 26
    :cond_0
    const-string v0, "FFDecoderWrapper"

    .line 27
    .line 28
    const-string v2, "release0"

    .line 29
    .line 30
    invoke-static {v0, v2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->N:Ljava/lang/Thread;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :catch_1
    move-exception v0

    .line 42
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 43
    .line 44
    .line 45
    :goto_1
    iput-object v1, p0, Lcom/immomo/moment/mediautils/g;->N:Ljava/lang/Thread;

    .line 46
    .line 47
    :cond_1
    const-string v0, "FFDecoderWrapper"

    .line 48
    .line 49
    const-string v2, "release1"

    .line 50
    .line 51
    invoke-static {v0, v2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->O:Ljava/lang/Thread;

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :catch_2
    move-exception v0

    .line 63
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 64
    .line 65
    .line 66
    :goto_2
    iput-object v1, p0, Lcom/immomo/moment/mediautils/g;->O:Ljava/lang/Thread;

    .line 67
    .line 68
    :cond_2
    const-string v0, "FFDecoderWrapper"

    .line 69
    .line 70
    const-string v1, "release end"

    .line 71
    .line 72
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->e0:Ljava/lang/Object;

    .line 76
    .line 77
    monitor-enter v0

    .line 78
    :try_start_3
    iget-object v1, p0, Lcom/immomo/moment/mediautils/g;->g0:Ljava/util/LinkedList;

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 81
    .line 82
    .line 83
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 84
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->release()V

    .line 87
    .line 88
    .line 89
    invoke-super {p0}, Lcom/immomo/moment/mediautils/m;->q()V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :catchall_0
    move-exception p0

    .line 94
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 95
    throw p0
.end method

.method public r(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->e0:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/g;->g0:Ljava/util/LinkedList;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-lez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Lcom/immomo/moment/mediautils/g;->g0:Ljava/util/LinkedList;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    const/4 v1, 0x0

    .line 33
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 43
    .line 44
    invoke-interface {p0, v1}, Lcom/immomo/moment/mediautils/m$e;->b(Ljava/nio/ByteBuffer;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    throw p0

    .line 50
    :cond_2
    :goto_2
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    const-string v0, "FFDecoderWrapper"

    .line 2
    .line 3
    const-string v1, "resume"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->resume()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/g;->W:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/g;->X:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/g;->Y:Z

    .line 19
    .line 20
    return-void
.end method

.method public t(JJZ)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    move-wide/from16 v3, p3

    .line 6
    .line 7
    new-instance v5, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v6, "startPtsUs:"

    .line 10
    .line 11
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v6, " endPtsUs:"

    .line 18
    .line 19
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v6, " mStartPtsUs:"

    .line 26
    .line 27
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-wide v6, v0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 31
    .line 32
    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v6, " mEndPtsUs:"

    .line 36
    .line 37
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-wide v7, v0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 41
    .line 42
    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v7, " mNeedReverse:"

    .line 46
    .line 47
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-boolean v7, v0, Lcom/immomo/moment/mediautils/m;->I:Z

    .line 51
    .line 52
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    const-string v7, "FFDecoderWrapper"

    .line 60
    .line 61
    invoke-static {v7, v5}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-wide v8, v0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 65
    .line 66
    iget-wide v10, v0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 67
    .line 68
    iget-boolean v5, v0, Lcom/immomo/moment/mediautils/m;->I:Z

    .line 69
    .line 70
    invoke-super/range {p0 .. p5}, Lcom/immomo/moment/mediautils/m;->t(JJZ)V

    .line 71
    .line 72
    .line 73
    iget-wide v12, v0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 74
    .line 75
    cmp-long v8, v8, v12

    .line 76
    .line 77
    if-nez v8, :cond_1

    .line 78
    .line 79
    iget-wide v8, v0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 80
    .line 81
    cmp-long v8, v10, v8

    .line 82
    .line 83
    if-nez v8, :cond_1

    .line 84
    .line 85
    iget-boolean v8, v0, Lcom/immomo/moment/mediautils/m;->I:Z

    .line 86
    .line 87
    if-eq v5, v8, :cond_0

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    const-string v0, "no change"

    .line 91
    .line 92
    invoke-static {v7, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_1
    :goto_0
    const-wide/16 v8, 0x0

    .line 97
    .line 98
    cmp-long v5, v1, v8

    .line 99
    .line 100
    if-ltz v5, :cond_2

    .line 101
    .line 102
    iput-wide v1, v0, Lcom/immomo/moment/mediautils/g;->h0:J

    .line 103
    .line 104
    :cond_2
    if-ltz v5, :cond_3

    .line 105
    .line 106
    cmp-long v1, v1, v3

    .line 107
    .line 108
    if-gez v1, :cond_3

    .line 109
    .line 110
    iput-wide v3, v0, Lcom/immomo/moment/mediautils/g;->j0:J

    .line 111
    .line 112
    :cond_3
    iget-object v14, v0, Lcom/immomo/moment/mediautils/g;->K:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 113
    .line 114
    const-wide/16 v1, 0x3e8

    .line 115
    .line 116
    div-long v15, v12, v1

    .line 117
    .line 118
    iget-wide v3, v0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 119
    .line 120
    div-long v17, v3, v1

    .line 121
    .line 122
    iget-boolean v1, v0, Lcom/immomo/moment/mediautils/m;->I:Z

    .line 123
    .line 124
    move/from16 v19, v1

    .line 125
    .line 126
    invoke-virtual/range {v14 .. v19}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->setDecoderRange(JJZ)V

    .line 127
    .line 128
    .line 129
    new-instance v1, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string v2, "changed, mStartPtsUs:"

    .line 132
    .line 133
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-wide v2, v0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 137
    .line 138
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget-wide v2, v0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 145
    .line 146
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-static {v7, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method
