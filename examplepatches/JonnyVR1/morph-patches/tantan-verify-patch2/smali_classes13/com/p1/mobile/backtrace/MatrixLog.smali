.class public Lcom/p1/mobile/backtrace/MatrixLog;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;
    }
.end annotation


# static fields
.field private static debugLog:Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;

.field private static matrixLogImp:Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/backtrace/MatrixLog$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/backtrace/MatrixLog$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/backtrace/MatrixLog;->debugLog:Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;

    .line 7
    .line 8
    sput-object v0, Lcom/p1/mobile/backtrace/MatrixLog;->matrixLogImp:Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;

    .line 9
    .line 10
    return-void
.end method

.method private constructor <init>()V
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
    sget-object v0, Lcom/p1/mobile/backtrace/MatrixLog;->matrixLogImp:Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static varargs e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/MatrixLog;->matrixLogImp:Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static getImpl()Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/MatrixLog;->matrixLogImp:Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;

    .line 2
    .line 3
    return-object v0
.end method

.method public static varargs i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/MatrixLog;->matrixLogImp:Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static varargs printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/MatrixLog;->matrixLogImp:Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2, p3}, Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static setMatrixLogImp(Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/p1/mobile/backtrace/MatrixLog;->matrixLogImp:Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;

    .line 2
    .line 3
    return-void
.end method

.method public static varargs v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/MatrixLog;->matrixLogImp:Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static varargs w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/MatrixLog;->matrixLogImp:Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Lcom/p1/mobile/backtrace/MatrixLog$MatrixLogImp;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
