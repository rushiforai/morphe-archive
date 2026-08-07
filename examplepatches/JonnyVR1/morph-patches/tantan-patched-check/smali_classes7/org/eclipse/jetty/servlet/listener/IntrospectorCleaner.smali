.class public Lorg/eclipse/jetty/servlet/listener/IntrospectorCleaner;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cse0;


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
.method public contextDestroyed(Ljavax/servlet/ServletContextEvent;)V
    .locals 0

    .line 1
    invoke-static {}, Ljava/beans/Introspector;->flushCaches()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public contextInitialized(Ljavax/servlet/ServletContextEvent;)V
    .locals 0

    return-void
.end method
