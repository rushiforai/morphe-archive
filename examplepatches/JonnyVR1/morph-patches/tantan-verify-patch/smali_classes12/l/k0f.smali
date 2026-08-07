.class public Ll/k0f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Ll/vsl;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/kod;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/kod;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/k0f;->a:Ll/vsl;

    .line 7
    .line 8
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

.method public static declared-synchronized a()Ll/vsl;
    .locals 2

    .line 1
    const-class v0, Ll/k0f;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/k0f;->a:Ll/vsl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object v1

    .line 8
    :catchall_0
    move-exception v1

    .line 9
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw v1
.end method

.method public static b(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string v0, "momoenc"

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
