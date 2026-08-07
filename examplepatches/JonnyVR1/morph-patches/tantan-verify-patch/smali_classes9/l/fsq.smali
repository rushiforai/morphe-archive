.class public Ll/fsq;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final i:Ljava/lang/Object;

.field public static j:I

.field public static k:Ll/fsq;


# instance fields
.field public a:I

.field public b:I

.field public c:Z

.field public d:Z

.field public e:J

.field public f:I

.field public g:Z

.field public h:Ll/fsq;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/fsq;->i:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/fsq;->a:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/fsq;->c:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/fsq;->d:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Ll/fsq;->g:Z

    .line 13
    .line 14
    return-void
.end method

.method public static a()Ll/fsq;
    .locals 3

    .line 1
    sget-object v0, Ll/fsq;->i:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/fsq;->k:Ll/fsq;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v2, v1, Ll/fsq;->h:Ll/fsq;

    .line 9
    .line 10
    sput-object v2, Ll/fsq;->k:Ll/fsq;

    .line 11
    .line 12
    sget v2, Ll/fsq;->j:I

    .line 13
    .line 14
    add-int/lit8 v2, v2, -0x1

    .line 15
    .line 16
    sput v2, Ll/fsq;->j:I

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    iput-object v2, v1, Ll/fsq;->h:Ll/fsq;

    .line 20
    .line 21
    monitor-exit v0

    .line 22
    return-object v1

    .line 23
    :catchall_0
    move-exception v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    new-instance v0, Ll/fsq;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/fsq;-><init>()V

    .line 29
    .line 30
    .line 31
    return-object v0

    .line 32
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw v1
.end method


# virtual methods
.method public b(Z)Ll/fsq;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fsq;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Z)Ll/fsq;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fsq;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public d(J)Ll/fsq;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/fsq;->e:J

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Z)Ll/fsq;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fsq;->g:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public f(I)Ll/fsq;
    .locals 0

    .line 1
    iput p1, p0, Ll/fsq;->a:I

    .line 2
    .line 3
    return-object p0
.end method

.method public g(I)Ll/fsq;
    .locals 0

    .line 1
    iput p1, p0, Ll/fsq;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public h(I)Ll/fsq;
    .locals 0

    .line 1
    iput p1, p0, Ll/fsq;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "jumpInfo"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/fsq;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "."

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v2, p0, Ll/fsq;->b:I

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-boolean v2, p0, Ll/fsq;->c:Z

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-boolean v2, p0, Ll/fsq;->d:Z

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-wide v2, p0, Ll/fsq;->e:J

    .line 43
    .line 44
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget v2, p0, Ll/fsq;->f:I

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-boolean p0, p0, Ll/fsq;->g:Z

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method
