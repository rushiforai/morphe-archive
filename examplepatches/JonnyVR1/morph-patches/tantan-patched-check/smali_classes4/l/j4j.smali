.class public Ll/j4j;
.super Ll/eoi0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/j4j$a;
    }
.end annotation


# instance fields
.field public e:Ljava/lang/String;

.field public f:J

.field public g:J

.field public h:Ll/j4j$a;

.field public i:Ll/j4j$a;

.field public j:Ll/j4j$a;


# direct methods
.method public constructor <init>(Ljava/lang/String;JJIIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eoi0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j4j;->e:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/j4j;->f:J

    .line 7
    .line 8
    iput-wide p4, p0, Ll/j4j;->g:J

    .line 9
    .line 10
    new-instance p1, Ll/j4j$a;

    .line 11
    .line 12
    invoke-direct {p1, p0, p6, p7}, Ll/j4j$a;-><init>(Ll/j4j;II)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/j4j;->h:Ll/j4j$a;

    .line 16
    .line 17
    new-instance p1, Ll/j4j$a;

    .line 18
    .line 19
    invoke-direct {p1, p0, p8, p9}, Ll/j4j$a;-><init>(Ll/j4j;II)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/j4j;->i:Ll/j4j$a;

    .line 23
    .line 24
    new-instance p1, Ll/j4j$a;

    .line 25
    .line 26
    invoke-direct {p1, p0, p10, p11}, Ll/j4j$a;-><init>(Ll/j4j;II)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/j4j;->j:Ll/j4j$a;

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, " scene:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/j4j;->e:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " startTime:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-wide v1, p0, Ll/j4j;->f:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, " endTime:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-wide v1, p0, Ll/j4j;->g:J

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, " mFrozen:"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ll/j4j;->h:Ll/j4j$a;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/j4j$a;->b()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, " mHigh:"

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Ll/j4j;->i:Ll/j4j$a;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/j4j$a;->b()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, " mMiddle:"

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/j4j;->j:Ll/j4j$a;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/j4j$a;->b()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0
.end method
