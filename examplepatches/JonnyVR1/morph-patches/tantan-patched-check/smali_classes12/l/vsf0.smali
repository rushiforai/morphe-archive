.class public Ll/vsf0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Z

.field private static volatile b:Lcom/jiechic/library/android/snappy/SnappyNative;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static declared-synchronized a()V
    .locals 2

    .line 1
    const-class v0, Ll/vsf0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Ll/vsf0;->a:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const-string v1, "snappy-android"

    .line 9
    .line 10
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    sput-boolean v1, Ll/vsf0;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v1
.end method

.method public static declared-synchronized b()Lcom/jiechic/library/android/snappy/SnappyNative;
    .locals 2

    .line 1
    const-class v0, Ll/vsf0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/vsf0;->b:Lcom/jiechic/library/android/snappy/SnappyNative;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    sget-object v1, Ll/vsf0;->b:Lcom/jiechic/library/android/snappy/SnappyNative;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-object v1

    .line 12
    :catchall_0
    move-exception v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    :try_start_1
    invoke-static {}, Ll/vsf0;->a()V

    .line 15
    .line 16
    .line 17
    new-instance v1, Lcom/jiechic/library/android/snappy/SnappyNative;

    .line 18
    .line 19
    invoke-direct {v1}, Lcom/jiechic/library/android/snappy/SnappyNative;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/vsf0;->c(Lcom/jiechic/library/android/snappy/SnappyNative;)V

    .line 23
    .line 24
    .line 25
    sget-object v1, Ll/vsf0;->b:Lcom/jiechic/library/android/snappy/SnappyNative;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-object v1

    .line 29
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 30
    throw v1
.end method

.method public static declared-synchronized c(Lcom/jiechic/library/android/snappy/SnappyNative;)V
    .locals 1

    .line 1
    const-class v0, Ll/vsf0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sput-object p0, Ll/vsf0;->b:Lcom/jiechic/library/android/snappy/SnappyNative;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw p0
.end method
