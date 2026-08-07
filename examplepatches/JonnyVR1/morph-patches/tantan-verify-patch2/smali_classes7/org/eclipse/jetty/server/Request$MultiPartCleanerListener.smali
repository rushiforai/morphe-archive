.class public Lorg/eclipse/jetty/server/Request$MultiPartCleanerListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ise0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MultiPartCleanerListener"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public requestDestroyed(Ljavax/servlet/ServletRequestEvent;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljavax/servlet/ServletRequestEvent;->getServletRequest()Ll/gse0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "org.eclipse.multiPartInputStream"

    .line 6
    .line 7
    invoke-interface {p0, v0}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lorg/eclipse/jetty/util/MultiPartInputStream;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ljavax/servlet/ServletRequestEvent;->getServletRequest()Ll/gse0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "org.eclipse.multiPartContext"

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljavax/servlet/ServletRequestEvent;->getServletContext()Ll/ase0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-ne v0, v1, :cond_0

    .line 32
    .line 33
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/MultiPartInputStream;->deleteParts()V
    :try_end_0
    .catch Lorg/eclipse/jetty/util/MultiException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p0

    .line 38
    invoke-virtual {p1}, Ljavax/servlet/ServletRequestEvent;->getServletContext()Ll/ase0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v0, "Errors deleting multipart tmp files"

    .line 43
    .line 44
    invoke-interface {p1, v0, p0}, Ll/ase0;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public requestInitialized(Ljavax/servlet/ServletRequestEvent;)V
    .locals 0

    return-void
.end method
