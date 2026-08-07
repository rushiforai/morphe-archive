.class public Lorg/eclipse/jetty/servlet/ServletHolder$Config;
.super Lorg/eclipse/jetty/servlet/Holder$HolderConfig;
.source "SourceFile"

# interfaces
.implements Ll/zre0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/servlet/ServletHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Config"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jetty/servlet/Holder<",
        "Ll/yre0;",
        ">.HolderConfig;",
        "Ll/zre0;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/servlet/ServletHolder;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/servlet/ServletHolder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Config;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/servlet/Holder$HolderConfig;-><init>(Lorg/eclipse/jetty/servlet/Holder;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getServletName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHolder$Config;->this$0:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/servlet/Holder;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
