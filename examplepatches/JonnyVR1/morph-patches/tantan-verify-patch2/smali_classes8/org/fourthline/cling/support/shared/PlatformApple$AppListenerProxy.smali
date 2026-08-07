.class Lorg/fourthline/cling/support/shared/PlatformApple$AppListenerProxy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/support/shared/PlatformApple;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AppListenerProxy"
.end annotation


# instance fields
.field private appController:Lorg/seamless/swing/Controller;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/seamless/swing/Controller<",
            "Ljavax/swing/JFrame;",
            ">;"
        }
    .end annotation
.end field

.field private object:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ljava/lang/Object;Lorg/seamless/swing/Controller;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lorg/seamless/swing/Controller<",
            "Ljavax/swing/JFrame;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/support/shared/PlatformApple$AppListenerProxy;->object:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/support/shared/PlatformApple$AppListenerProxy;->appController:Lorg/seamless/swing/Controller;

    .line 7
    .line 8
    return-void
.end method

.method public static newInstance(Ljava/lang/Object;Lorg/seamless/swing/Controller;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lorg/seamless/swing/Controller<",
            "Ljavax/swing/JFrame;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Lorg/fourthline/cling/support/shared/PlatformApple$AppListenerProxy;

    .line 18
    .line 19
    invoke-direct {v2, p0, p1}, Lorg/fourthline/cling/support/shared/PlatformApple$AppListenerProxy;-><init>(Ljava/lang/Object;Lorg/seamless/swing/Controller;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1, v2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    const/4 p1, 0x0

    .line 2
    :try_start_0
    const-string v0, "handleQuit"

    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Lorg/fourthline/cling/support/shared/PlatformApple$AppListenerProxy;->appController:Lorg/seamless/swing/Controller;

    .line 15
    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    invoke-interface {p2}, Lorg/seamless/swing/Controller;->dispose()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/PlatformApple$AppListenerProxy;->appController:Lorg/seamless/swing/Controller;

    .line 22
    .line 23
    invoke-interface {p0}, Lorg/seamless/swing/Controller;->getView()Ljava/awt/Container;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ljavax/swing/JFrame;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljavax/swing/JFrame;->dispose()V

    .line 30
    .line 31
    .line 32
    return-object p1

    .line 33
    :cond_0
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/PlatformApple$AppListenerProxy;->object:Ljava/lang/Object;

    .line 34
    .line 35
    invoke-virtual {p2, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    return-object p0

    .line 40
    :catch_0
    :cond_1
    return-object p1
.end method
