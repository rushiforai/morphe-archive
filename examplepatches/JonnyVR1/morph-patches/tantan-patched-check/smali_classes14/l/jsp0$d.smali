.class public Ll/jsp0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/RejectedExecutionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jsp0;->k(Ljava/lang/String;JLl/jsp0$i;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jsp0;


# direct methods
.method public constructor <init>(Ll/jsp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jsp0$d;->a:Ll/jsp0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public rejectedExecution(Ljava/lang/Runnable;Ljava/util/concurrent/ThreadPoolExecutor;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jsp0$d;->a:Ll/jsp0;

    .line 2
    .line 3
    new-instance p1, Ljava/util/concurrent/RejectedExecutionException;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/util/concurrent/RejectedExecutionException;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-virtual {p0, p1, p2}, Ll/jsp0;->f(Ljava/lang/Exception;Ll/i5d0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
