.class public Ll/orc0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final j:Ljava/lang/Object;

.field public static k:I

.field public static l:Ll/orc0;


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Z

.field public f:I

.field public g:Ll/ns2;

.field public h:I

.field public i:Ll/orc0;


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
    sput-object v0, Ll/orc0;->j:Ljava/lang/Object;

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
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/orc0;->e:Z

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Ll/orc0;->f:I

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput v0, p0, Ll/orc0;->h:I

    .line 12
    .line 13
    return-void
.end method

.method public static a()Ll/orc0;
    .locals 3

    .line 1
    sget-object v0, Ll/orc0;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/orc0;->l:Ll/orc0;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v2, v1, Ll/orc0;->i:Ll/orc0;

    .line 9
    .line 10
    sput-object v2, Ll/orc0;->l:Ll/orc0;

    .line 11
    .line 12
    sget v2, Ll/orc0;->k:I

    .line 13
    .line 14
    add-int/lit8 v2, v2, -0x1

    .line 15
    .line 16
    sput v2, Ll/orc0;->k:I

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    iput-object v2, v1, Ll/orc0;->i:Ll/orc0;

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
    new-instance v0, Ll/orc0;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/orc0;-><init>()V

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
.method public b()V
    .locals 3

    .line 1
    sget-object v0, Ll/orc0;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget v1, Ll/orc0;->k:I

    .line 5
    .line 6
    const/16 v2, 0x28

    .line 7
    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    sget-object v2, Ll/orc0;->l:Ll/orc0;

    .line 11
    .line 12
    iput-object v2, p0, Ll/orc0;->i:Ll/orc0;

    .line 13
    .line 14
    sput-object p0, Ll/orc0;->l:Ll/orc0;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    add-int/2addr v1, v2

    .line 18
    sput v1, Ll/orc0;->k:I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-object v1, p0, Ll/orc0;->g:Ll/ns2;

    .line 22
    .line 23
    iput v2, p0, Ll/orc0;->h:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method
