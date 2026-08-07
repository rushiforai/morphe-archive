.class public interface abstract Lorg/eclipse/jetty/server/SessionManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/component/LifeCycle;


# static fields
.field public static final __CheckRemoteSessionEncoding:Ljava/lang/String; = "org.eclipse.jetty.servlet.CheckingRemoteSessionIdEncoding"

.field public static final __DefaultSessionCookie:Ljava/lang/String; = "JSESSIONID"

.field public static final __DefaultSessionDomain:Ljava/lang/String; = null

.field public static final __DefaultSessionIdPathParameterName:Ljava/lang/String; = "jsessionid"

.field public static final __MaxAgeProperty:Ljava/lang/String; = "org.eclipse.jetty.servlet.MaxAge"

.field public static final __SessionCookieProperty:Ljava/lang/String; = "org.eclipse.jetty.servlet.SessionCookie"

.field public static final __SessionDomainProperty:Ljava/lang/String; = "org.eclipse.jetty.servlet.SessionDomain"

.field public static final __SessionIdPathParameterNameProperty:Ljava/lang/String; = "org.eclipse.jetty.servlet.SessionIdPathParameterName"

.field public static final __SessionPathProperty:Ljava/lang/String; = "org.eclipse.jetty.servlet.SessionPath"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method


# virtual methods
.method public abstract access(Ll/hnl;Z)Lorg/eclipse/jetty/http/HttpCookie;
.end method

.method public abstract addEventListener(Ljava/util/EventListener;)V
.end method

.method public abstract clearEventListeners()V
.end method

.method public abstract complete(Ll/hnl;)V
.end method

.method public abstract getClusterId(Ll/hnl;)Ljava/lang/String;
.end method

.method public abstract getDefaultSessionTrackingModes()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljavax/servlet/SessionTrackingMode;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getEffectiveSessionTrackingModes()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljavax/servlet/SessionTrackingMode;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getHttpOnly()Z
.end method

.method public abstract getHttpSession(Ljava/lang/String;)Ll/hnl;
.end method

.method public abstract getMaxInactiveInterval()I
.end method

.method public abstract getMetaManager()Lorg/eclipse/jetty/server/SessionIdManager;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getNodeId(Ll/hnl;)Ljava/lang/String;
.end method

.method public abstract getSessionCookie(Ll/hnl;Ljava/lang/String;Z)Lorg/eclipse/jetty/http/HttpCookie;
.end method

.method public abstract getSessionCookieConfig()Ll/pse0;
.end method

.method public abstract getSessionIdManager()Lorg/eclipse/jetty/server/SessionIdManager;
.end method

.method public abstract getSessionIdPathParameterName()Ljava/lang/String;
.end method

.method public abstract getSessionIdPathParameterNamePrefix()Ljava/lang/String;
.end method

.method public abstract isCheckingRemoteSessionIdEncoding()Z
.end method

.method public abstract isUsingCookies()Z
.end method

.method public abstract isUsingURLs()Z
.end method

.method public abstract isValid(Ll/hnl;)Z
.end method

.method public abstract newHttpSession(Ljavax/servlet/http/HttpServletRequest;)Ll/hnl;
.end method

.method public abstract removeEventListener(Ljava/util/EventListener;)V
.end method

.method public abstract setCheckingRemoteSessionIdEncoding(Z)V
.end method

.method public abstract setMaxInactiveInterval(I)V
.end method

.method public abstract setSessionHandler(Lorg/eclipse/jetty/server/session/SessionHandler;)V
.end method

.method public abstract setSessionIdManager(Lorg/eclipse/jetty/server/SessionIdManager;)V
.end method

.method public abstract setSessionIdPathParameterName(Ljava/lang/String;)V
.end method

.method public abstract setSessionTrackingModes(Ljava/util/Set;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljavax/servlet/SessionTrackingMode;",
            ">;)V"
        }
    .end annotation
.end method
