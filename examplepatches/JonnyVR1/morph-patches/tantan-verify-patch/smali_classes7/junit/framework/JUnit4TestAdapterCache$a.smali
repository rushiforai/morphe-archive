.class Ljunit/framework/JUnit4TestAdapterCache$a;
.super Lorg/junit/runner/notification/RunListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljunit/framework/JUnit4TestAdapterCache;->getNotifier(Ll/tqi0;Ll/blq;)Lorg/junit/runner/notification/RunNotifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/tqi0;

.field final synthetic b:Ljunit/framework/JUnit4TestAdapterCache;


# direct methods
.method public constructor <init>(Ljunit/framework/JUnit4TestAdapterCache;Ll/tqi0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ljunit/framework/JUnit4TestAdapterCache$a;->b:Ljunit/framework/JUnit4TestAdapterCache;

    .line 2
    .line 3
    iput-object p2, p0, Ljunit/framework/JUnit4TestAdapterCache$a;->a:Ll/tqi0;

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/junit/runner/notification/RunListener;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public testFailure(Lorg/junit/runner/notification/Failure;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ljunit/framework/JUnit4TestAdapterCache$a;->a:Ll/tqi0;

    .line 2
    .line 3
    iget-object p0, p0, Ljunit/framework/JUnit4TestAdapterCache$a;->b:Ljunit/framework/JUnit4TestAdapterCache;

    .line 4
    .line 5
    invoke-virtual {p1}, Lorg/junit/runner/notification/Failure;->getDescription()Lorg/junit/runner/Description;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0, v1}, Ljunit/framework/JUnit4TestAdapterCache;->asTest(Lorg/junit/runner/Description;)Ll/mqi0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1}, Lorg/junit/runner/notification/Failure;->getException()Ljava/lang/Throwable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p0, p1}, Ll/tqi0;->a(Ll/mqi0;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public testFinished(Lorg/junit/runner/Description;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ljunit/framework/JUnit4TestAdapterCache$a;->a:Ll/tqi0;

    .line 2
    .line 3
    iget-object p0, p0, Ljunit/framework/JUnit4TestAdapterCache$a;->b:Ljunit/framework/JUnit4TestAdapterCache;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljunit/framework/JUnit4TestAdapterCache;->asTest(Lorg/junit/runner/Description;)Ll/mqi0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/tqi0;->e(Ll/mqi0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public testStarted(Lorg/junit/runner/Description;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ljunit/framework/JUnit4TestAdapterCache$a;->a:Ll/tqi0;

    .line 2
    .line 3
    iget-object p0, p0, Ljunit/framework/JUnit4TestAdapterCache$a;->b:Ljunit/framework/JUnit4TestAdapterCache;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljunit/framework/JUnit4TestAdapterCache;->asTest(Lorg/junit/runner/Description;)Ll/mqi0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/tqi0;->i(Ll/mqi0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
