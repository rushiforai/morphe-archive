.class public final Ll/j4s0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:[Ljava/lang/String;


# instance fields
.field public a:J

.field public b:J

.field public c:J

.field public d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "android:establish_vpn_service"

    .line 2
    .line 3
    const-string v1, "android:establish_vpn_manager"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/j4s0;->e:[Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;[Ljava/lang/String;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/j4s0;->a:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/j4s0;->b:J

    .line 9
    .line 10
    const-wide/16 v0, -0x1

    .line 11
    .line 12
    iput-wide v0, p0, Ll/j4s0;->c:J

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Ll/j4s0;->d:Z

    .line 16
    .line 17
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 18
    .line 19
    const/16 v1, 0x1e

    .line 20
    .line 21
    if-ge v0, v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v0, Ll/h4s0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/h4s0;-><init>(Ll/j4s0;)V

    .line 27
    .line 28
    .line 29
    :try_start_0
    const-string p0, "appops"

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Landroid/app/AppOpsManager;

    .line 36
    .line 37
    invoke-static {p0, p3, p2, v0}, Ll/i4s0;->a(Landroid/app/AppOpsManager;[Ljava/lang/String;Ljava/util/concurrent/Executor;Landroid/app/AppOpsManager$OnOpActiveChangedListener;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    :catch_0
    :goto_0
    return-void
.end method

.method public static bridge synthetic a(Ll/j4s0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/j4s0;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static d(Landroid/content/Context;Ljava/util/concurrent/Executor;)Ll/j4s0;
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/j4s0;->e:[Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ll/j4s0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, v0}, Ll/j4s0;-><init>(Landroid/content/Context;Ljava/util/concurrent/Executor;[Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v1
.end method

.method public static bridge synthetic e(Ll/j4s0;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/j4s0;->c:J

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic f(Ll/j4s0;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/j4s0;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic g(Ll/j4s0;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/j4s0;->a:J

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final b()J
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/j4s0;->c:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    iput-wide v2, p0, Ll/j4s0;->c:J

    .line 6
    .line 7
    return-wide v0
.end method

.method public final c()J
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/j4s0;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Ll/j4s0;->b:J

    .line 6
    .line 7
    iget-wide v2, p0, Ll/j4s0;->a:J

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    return-wide v0

    .line 11
    :cond_0
    const-wide/16 v0, -0x1

    .line 12
    .line 13
    return-wide v0
.end method

.method public final h()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/j4s0;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iput-wide v0, p0, Ll/j4s0;->b:J

    .line 10
    .line 11
    :cond_0
    return-void
.end method
