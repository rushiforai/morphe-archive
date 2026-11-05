.class public final synthetic Le/e/a/CrashDiagnostics$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field public final synthetic f$0:Ljava/io/File;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/Thread$UncaughtExceptionHandler;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CrashDiagnostics$$ExternalSyntheticLambda0;->f$0:Ljava/io/File;

    iput-object p2, p0, Le/e/a/CrashDiagnostics$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/CrashDiagnostics$$ExternalSyntheticLambda0;->f$2:Ljava/lang/Thread$UncaughtExceptionHandler;

    return-void
.end method


# virtual methods
.method public final uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/CrashDiagnostics$$ExternalSyntheticLambda0;->f$0:Ljava/io/File;

    iget-object v1, p0, Le/e/a/CrashDiagnostics$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/CrashDiagnostics$$ExternalSyntheticLambda0;->f$2:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-static {v0, v1, v2, p1, p2}, Le/e/a/CrashDiagnostics;->lambda$0(Ljava/io/File;Ljava/lang/String;Ljava/lang/Thread$UncaughtExceptionHandler;Ljava/lang/Thread;Ljava/lang/Throwable;)V

    return-void
.end method
