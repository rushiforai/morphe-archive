.class Lorg/eclipse/jetty/io/ThreadLocalBuffers$1;
.super Ljava/lang/ThreadLocal;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/io/ThreadLocalBuffers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal<",
        "Lorg/eclipse/jetty/io/ThreadLocalBuffers$ThreadBuffers;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/io/ThreadLocalBuffers;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/io/ThreadLocalBuffers;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/io/ThreadLocalBuffers$1;->this$0:Lorg/eclipse/jetty/io/ThreadLocalBuffers;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic initialValue()Ljava/lang/Object;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ThreadLocalBuffers$1;->initialValue()Lorg/eclipse/jetty/io/ThreadLocalBuffers$ThreadBuffers;

    move-result-object p0

    return-object p0
.end method

.method public initialValue()Lorg/eclipse/jetty/io/ThreadLocalBuffers$ThreadBuffers;
    .locals 0

    .line 1
    new-instance p0, Lorg/eclipse/jetty/io/ThreadLocalBuffers$ThreadBuffers;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/eclipse/jetty/io/ThreadLocalBuffers$ThreadBuffers;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
