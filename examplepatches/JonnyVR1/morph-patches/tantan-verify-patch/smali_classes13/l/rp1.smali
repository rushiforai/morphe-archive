.class public Ll/rp1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static f:I = 0x1e


# instance fields
.field private a:I

.field private b:Z

.field private c:J

.field private d:J

.field private e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x41

    .line 5
    .line 6
    iput v0, p0, Ll/rp1;->a:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/rp1;->b:Z

    .line 10
    .line 11
    const-wide/16 v0, -0x1

    .line 12
    .line 13
    iput-wide v0, p0, Ll/rp1;->c:J

    .line 14
    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    iput-wide v0, p0, Ll/rp1;->d:J

    .line 18
    .line 19
    new-instance v0, Ljava/util/LinkedList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/rp1;->e:Ljava/util/List;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a(J)J
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/rp1;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iput-boolean v1, p0, Ll/rp1;->b:Z

    .line 9
    .line 10
    iput-wide v2, p0, Ll/rp1;->d:J

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-wide v4, p0, Ll/rp1;->c:J

    .line 14
    .line 15
    sub-long v4, p1, v4

    .line 16
    .line 17
    iget-object v0, p0, Ll/rp1;->e:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-wide v6, p0, Ll/rp1;->d:J

    .line 27
    .line 28
    add-long/2addr v6, v4

    .line 29
    iput-wide v6, p0, Ll/rp1;->d:J

    .line 30
    .line 31
    :goto_0
    iput-wide p1, p0, Ll/rp1;->c:J

    .line 32
    .line 33
    iget-object p1, p0, Ll/rp1;->e:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    sget p2, Ll/rp1;->f:I

    .line 40
    .line 41
    if-le p1, p2, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Ll/rp1;->e:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p1, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/lang/Long;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 52
    .line 53
    .line 54
    move-result-wide p1

    .line 55
    iget-wide v0, p0, Ll/rp1;->d:J

    .line 56
    .line 57
    sub-long/2addr v0, p1

    .line 58
    iput-wide v0, p0, Ll/rp1;->d:J

    .line 59
    .line 60
    :cond_1
    iget-object p1, p0, Ll/rp1;->e:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-lez p1, :cond_2

    .line 67
    .line 68
    iget-wide p1, p0, Ll/rp1;->d:J

    .line 69
    .line 70
    iget-object p0, p0, Ll/rp1;->e:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    int-to-long v0, p0

    .line 77
    div-long/2addr p1, v0

    .line 78
    return-wide p1

    .line 79
    :cond_2
    return-wide v2
.end method
