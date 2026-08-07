.class Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pse0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/session/AbstractSessionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/session/AbstractSessionManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getComment()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_sessionComment:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public getDomain()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_sessionDomain:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public getMaxAge()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iget p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_maxCookieAge:I

    .line 4
    .line 5
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_sessionCookie:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public getPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_sessionPath:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public isHttpOnly()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_httpOnly:Z

    .line 4
    .line 5
    return p0
.end method

.method public isSecure()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_secureCookies:Z

    .line 4
    .line 5
    return p0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iput-object p1, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_sessionComment:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public setDomain(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iput-object p1, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_sessionDomain:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public setHttpOnly(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_httpOnly:Z

    .line 4
    .line 5
    return-void
.end method

.method public setMaxAge(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iput p1, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_maxCookieAge:I

    .line 4
    .line 5
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iput-object p1, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_sessionCookie:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iput-object p1, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_sessionPath:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public setSecure(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 2
    .line 3
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_secureCookies:Z

    .line 4
    .line 5
    return-void
.end method
