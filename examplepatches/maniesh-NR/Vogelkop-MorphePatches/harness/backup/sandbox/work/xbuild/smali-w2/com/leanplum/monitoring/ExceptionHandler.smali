.class public Lcom/leanplum/monitoring/ExceptionHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final LEANPLUM_CRASH_REPORTER_CLASS:Ljava/lang/String; = "com.leanplum.monitoring.internal.LeanplumExceptionReporter"

.field private static final instance:Lcom/leanplum/monitoring/ExceptionHandler;


# instance fields
.field public exceptionReporter:Lcom/leanplum/monitoring/ExceptionReporting;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/monitoring/ExceptionHandler;

    invoke-direct {v0}, Lcom/leanplum/monitoring/ExceptionHandler;-><init>()V

    sput-object v0, Lcom/leanplum/monitoring/ExceptionHandler;->instance:Lcom/leanplum/monitoring/ExceptionHandler;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/leanplum/monitoring/ExceptionHandler;->exceptionReporter:Lcom/leanplum/monitoring/ExceptionReporting;

    return-void
.end method

.method public static getInstance()Lcom/leanplum/monitoring/ExceptionHandler;
    .registers 1

    sget-object v0, Lcom/leanplum/monitoring/ExceptionHandler;->instance:Lcom/leanplum/monitoring/ExceptionHandler;

    return-object v0
.end method


# virtual methods
.method public reportException(Ljava/lang/Throwable;)V
    .registers 2

    iget-object p0, p0, Lcom/leanplum/monitoring/ExceptionHandler;->exceptionReporter:Lcom/leanplum/monitoring/ExceptionReporting;

    if-eqz p0, :cond_e

    :try_start_4
    invoke-interface {p0, p1}, Lcom/leanplum/monitoring/ExceptionReporting;->reportException(Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_8

    return-void

    :catchall_8
    move-exception p0

    const-string p1, "LeanplumExceptionHandler"

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_e
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .registers 4

    const-string v0, "LeanplumExceptionHandler"

    :try_start_2
    const-string v1, "com.leanplum.monitoring.internal.LeanplumExceptionReporter"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    iget-object p0, p0, Lcom/leanplum/monitoring/ExceptionHandler;->exceptionReporter:Lcom/leanplum/monitoring/ExceptionReporting;
    :try_end_9
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_9} :catch_19
    .catchall {:try_start_2 .. :try_end_9} :catchall_14

    if-eqz p0, :cond_21

    :try_start_b
    invoke-interface {p0, p1}, Lcom/leanplum/monitoring/ExceptionReporting;->setContext(Landroid/content/Context;)V
    :try_end_e
    .catchall {:try_start_b .. :try_end_e} :catchall_f

    goto :goto_21

    :catchall_f
    move-exception p0

    :try_start_10
    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_13
    .catch Ljava/lang/ClassNotFoundException; {:try_start_10 .. :try_end_13} :catch_19
    .catchall {:try_start_10 .. :try_end_13} :catchall_14

    goto :goto_21

    :catchall_14
    move-exception p0

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_21

    :catch_19
    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string p1, "LeanplumExceptionHandler could not initialize Exception Reporting.This is expected if you have not included the leanplum-monitoring module"

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_21
    :goto_21
    return-void
.end method
