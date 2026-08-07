.class Lorg/eclipse/jetty/servlet/FilterHolder$Config;
.super Lorg/eclipse/jetty/servlet/Holder$HolderConfig;
.source "SourceFile"

# interfaces
.implements Ll/sli;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/servlet/FilterHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Config"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jetty/servlet/Holder<",
        "Ll/gli;",
        ">.HolderConfig;",
        "Ll/sli;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/servlet/FilterHolder;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/servlet/FilterHolder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/FilterHolder$Config;->this$0:Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/servlet/Holder$HolderConfig;-><init>(Lorg/eclipse/jetty/servlet/Holder;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getFilterName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/FilterHolder$Config;->this$0:Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/Holder;->_name:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method
