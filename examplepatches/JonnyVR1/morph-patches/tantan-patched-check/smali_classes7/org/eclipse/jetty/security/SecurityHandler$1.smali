.class Lorg/eclipse/jetty/security/SecurityHandler$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mnl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/security/SecurityHandler;->doStart()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/security/SecurityHandler;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/security/SecurityHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/SecurityHandler$1;->this$0:Lorg/eclipse/jetty/security/SecurityHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public sessionCreated(Ljavax/servlet/http/HttpSessionEvent;)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getCurrentConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/Request;->isSecure()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p1}, Ljavax/servlet/http/HttpSessionEvent;->getSession()Ll/hnl;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "org.eclipse.jetty.security.sessionKnownOnlytoAuthenticated"

    .line 26
    .line 27
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-interface {p0, p1, v0}, Ll/hnl;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_2
    :goto_0
    return-void
.end method

.method public sessionDestroyed(Ljavax/servlet/http/HttpSessionEvent;)V
    .locals 0

    return-void
.end method
