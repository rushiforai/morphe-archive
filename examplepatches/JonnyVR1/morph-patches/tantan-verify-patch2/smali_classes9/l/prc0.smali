.class public Ll/prc0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Ljava/lang/Object;

.field public static f:I

.field public static g:Ll/prc0;


# instance fields
.field public a:Ll/prc0;

.field public b:I

.field public c:J

.field public d:I


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
    sput-object v0, Ll/prc0;->e:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/prc0;->b:I

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Ll/prc0;->c:J

    .line 10
    .line 11
    return-void
.end method

.method public static c()Ll/prc0;
    .locals 3

    .line 1
    sget-object v0, Ll/prc0;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/prc0;->g:Ll/prc0;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    sget-object v1, Ll/prc0;->g:Ll/prc0;

    .line 13
    .line 14
    iget-object v2, v1, Ll/prc0;->a:Ll/prc0;

    .line 15
    .line 16
    sput-object v2, Ll/prc0;->g:Ll/prc0;

    .line 17
    .line 18
    sget v2, Ll/prc0;->f:I

    .line 19
    .line 20
    add-int/lit8 v2, v2, -0x1

    .line 21
    .line 22
    sput v2, Ll/prc0;->f:I

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    iput-object v2, v1, Ll/prc0;->a:Ll/prc0;

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-object v1

    .line 29
    :catchall_0
    move-exception v1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    new-instance v0, Ll/prc0;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/prc0;-><init>()V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    throw v1
.end method


# virtual methods
.method public a(I)Ll/prc0;
    .locals 0

    .line 1
    iput p1, p0, Ll/prc0;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/prc0;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d(J)Ll/prc0;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/prc0;->c:J

    .line 2
    .line 3
    return-object p0
.end method

.method public e()V
    .locals 3

    .line 1
    sget-object v0, Ll/prc0;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget v1, Ll/prc0;->f:I

    .line 5
    .line 6
    const/16 v2, 0x14

    .line 7
    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    sget-object v2, Ll/prc0;->g:Ll/prc0;

    .line 11
    .line 12
    iput-object v2, p0, Ll/prc0;->a:Ll/prc0;

    .line 13
    .line 14
    sput-object p0, Ll/prc0;->g:Ll/prc0;

    .line 15
    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    sput v1, Ll/prc0;->f:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method

.method public f(I)Ll/prc0;
    .locals 0

    .line 1
    iput p1, p0, Ll/prc0;->d:I

    .line 2
    .line 3
    return-object p0
.end method
