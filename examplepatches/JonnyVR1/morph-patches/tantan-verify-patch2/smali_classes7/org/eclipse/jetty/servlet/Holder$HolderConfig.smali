.class public Lorg/eclipse/jetty/servlet/Holder$HolderConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/servlet/Holder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "HolderConfig"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/servlet/Holder;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/servlet/Holder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/Holder$HolderConfig;->this$0:Lorg/eclipse/jetty/servlet/Holder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getInitParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/Holder$HolderConfig;->this$0:Lorg/eclipse/jetty/servlet/Holder;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/servlet/Holder;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getInitParameterNames()Ljava/util/Enumeration;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/Holder$HolderConfig;->this$0:Lorg/eclipse/jetty/servlet/Holder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/servlet/Holder;->getInitParameterNames()Ljava/util/Enumeration;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getServletContext()Ll/ase0;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/Holder$HolderConfig;->this$0:Lorg/eclipse/jetty/servlet/Holder;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/Holder;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/eclipse/jetty/servlet/ServletHandler;->getServletContext()Ll/ase0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
