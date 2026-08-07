.class public final Ll/uyx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/ump/ConsentInformation;


# instance fields
.field public final a:Ll/tqr0;

.field public final b:Ll/qyy0;

.field public final c:Ll/ols0;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public f:Z

.field public g:Z

.field public h:Ll/wx5;


# direct methods
.method public constructor <init>(Ll/tqr0;Ll/qyy0;Ll/ols0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/uyx0;->d:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/uyx0;->e:Ljava/lang/Object;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/uyx0;->f:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Ll/uyx0;->g:Z

    .line 22
    .line 23
    new-instance v0, Ll/wx5$a;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/wx5$a;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ll/wx5$a;->a()Ll/wx5;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/uyx0;->h:Ll/wx5;

    .line 33
    .line 34
    iput-object p1, p0, Ll/uyx0;->a:Ll/tqr0;

    .line 35
    .line 36
    iput-object p2, p0, Ll/uyx0;->b:Ll/qyy0;

    .line 37
    .line 38
    iput-object p3, p0, Ll/uyx0;->c:Ll/ols0;

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final a(Landroid/app/Activity;Ll/wx5;Lcom/google/android/ump/ConsentInformation$b;Lcom/google/android/ump/ConsentInformation$a;)V
    .locals 2
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/uyx0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/uyx0;->f:Z

    .line 6
    .line 7
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    iput-object p2, p0, Ll/uyx0;->h:Ll/wx5;

    .line 9
    .line 10
    iget-object p0, p0, Ll/uyx0;->b:Ll/qyy0;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/qyy0;->c(Landroid/app/Activity;Ll/wx5;Lcom/google/android/ump/ConsentInformation$b;Lcom/google/android/ump/ConsentInformation$a;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw p0
.end method

.method public final b()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uyx0;->a:Ll/tqr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/tqr0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/uyx0;->c()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v2, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    move p0, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p0, p0, Ll/uyx0;->a:Ll/tqr0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/tqr0;->a()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    :goto_0
    if-eq p0, v1, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x3

    .line 28
    if-ne p0, v0, :cond_1

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    return v2

    .line 32
    :cond_2
    :goto_1
    return v1
.end method

.method public final c()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uyx0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Ll/uyx0;->f:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method
