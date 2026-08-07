.class public interface abstract Lorg/eclipse/jetty/continuation/Continuation;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ATTRIBUTE:Ljava/lang/String; = "org.eclipse.jetty.continuation"


# virtual methods
.method public abstract addContinuationListener(Lorg/eclipse/jetty/continuation/ContinuationListener;)V
.end method

.method public abstract complete()V
.end method

.method public abstract getAttribute(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract getServletResponse()Ll/lse0;
.end method

.method public abstract isExpired()Z
.end method

.method public abstract isInitial()Z
.end method

.method public abstract isResponseWrapped()Z
.end method

.method public abstract isResumed()Z
.end method

.method public abstract isSuspended()Z
.end method

.method public abstract removeAttribute(Ljava/lang/String;)V
.end method

.method public abstract resume()V
.end method

.method public abstract setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract setTimeout(J)V
.end method

.method public abstract suspend()V
.end method

.method public abstract suspend(Ll/lse0;)V
.end method

.method public abstract undispatch()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jetty/continuation/ContinuationThrowable;
        }
    .end annotation
.end method
