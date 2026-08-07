.class public Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Tinker.TinkerLog"

.field private static debugLog:Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;

.field private static tinkerLogImp:Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog;->debugLog:Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;

    .line 7
    .line 8
    sput-object v0, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog;->tinkerLogImp:Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;

    .line 9
    .line 10
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

.method public static varargs d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog;->tinkerLogImp:Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static varargs e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog;->tinkerLogImp:Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static getImpl()Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog;->tinkerLogImp:Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;

    .line 2
    .line 3
    return-object v0
.end method

.method public static varargs i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog;->tinkerLogImp:Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static varargs printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog;->tinkerLogImp:Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2, p3}, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static setTinkerLogImp(Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog;->tinkerLogImp:Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;

    .line 2
    .line 3
    return-void
.end method

.method public static varargs v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog;->tinkerLogImp:Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static varargs w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog;->tinkerLogImp:Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLog$TinkerLogImp;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
