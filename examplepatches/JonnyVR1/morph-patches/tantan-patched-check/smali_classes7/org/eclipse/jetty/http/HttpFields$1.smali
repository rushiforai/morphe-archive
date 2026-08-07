.class final Lorg/eclipse/jetty/http/HttpFields$1;
.super Ljava/lang/ThreadLocal;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/http/HttpFields;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal<",
        "Lorg/eclipse/jetty/http/HttpFields$DateGenerator;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic initialValue()Ljava/lang/Object;
    .locals 0

    .line 8
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpFields$1;->initialValue()Lorg/eclipse/jetty/http/HttpFields$DateGenerator;

    move-result-object p0

    return-object p0
.end method

.method public initialValue()Lorg/eclipse/jetty/http/HttpFields$DateGenerator;
    .locals 1

    .line 1
    new-instance p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;-><init>(Lorg/eclipse/jetty/http/HttpFields$1;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method
