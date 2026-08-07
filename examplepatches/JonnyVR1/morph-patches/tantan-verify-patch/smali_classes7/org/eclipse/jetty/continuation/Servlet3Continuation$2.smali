.class Lorg/eclipse/jetty/continuation/Servlet3Continuation$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/r21;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/continuation/Servlet3Continuation;->addContinuationListener(Lorg/eclipse/jetty/continuation/ContinuationListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/continuation/Servlet3Continuation;

.field final synthetic val$listener:Lorg/eclipse/jetty/continuation/ContinuationListener;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/continuation/Servlet3Continuation;Lorg/eclipse/jetty/continuation/ContinuationListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation$2;->this$0:Lorg/eclipse/jetty/continuation/Servlet3Continuation;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation$2;->val$listener:Lorg/eclipse/jetty/continuation/ContinuationListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onComplete(Ll/p21;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation$2;->val$listener:Lorg/eclipse/jetty/continuation/ContinuationListener;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation$2;->this$0:Lorg/eclipse/jetty/continuation/Servlet3Continuation;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/continuation/ContinuationListener;->onComplete(Lorg/eclipse/jetty/continuation/Continuation;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onError(Ll/p21;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation$2;->val$listener:Lorg/eclipse/jetty/continuation/ContinuationListener;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation$2;->this$0:Lorg/eclipse/jetty/continuation/Servlet3Continuation;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/continuation/ContinuationListener;->onComplete(Lorg/eclipse/jetty/continuation/Continuation;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onStartAsync(Ll/p21;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/p21;->getAsyncContext()Ll/o21;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1, p0}, Ll/o21;->addListener(Ll/r21;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onTimeout(Ll/p21;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation$2;->this$0:Lorg/eclipse/jetty/continuation/Servlet3Continuation;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->access$102(Lorg/eclipse/jetty/continuation/Servlet3Continuation;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation$2;->val$listener:Lorg/eclipse/jetty/continuation/ContinuationListener;

    .line 8
    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation$2;->this$0:Lorg/eclipse/jetty/continuation/Servlet3Continuation;

    .line 10
    .line 11
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/continuation/ContinuationListener;->onTimeout(Lorg/eclipse/jetty/continuation/Continuation;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
