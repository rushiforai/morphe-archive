.class public interface abstract Lorg/eclipse/jetty/server/SessionIdManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/component/LifeCycle;


# virtual methods
.method public abstract addSession(Ll/hnl;)V
.end method

.method public abstract getClusterId(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getNodeId(Ljava/lang/String;Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;
.end method

.method public abstract getWorkerName()Ljava/lang/String;
.end method

.method public abstract idInUse(Ljava/lang/String;)Z
.end method

.method public abstract invalidateAll(Ljava/lang/String;)V
.end method

.method public abstract newSessionId(Ljavax/servlet/http/HttpServletRequest;J)Ljava/lang/String;
.end method

.method public abstract removeSession(Ll/hnl;)V
.end method
