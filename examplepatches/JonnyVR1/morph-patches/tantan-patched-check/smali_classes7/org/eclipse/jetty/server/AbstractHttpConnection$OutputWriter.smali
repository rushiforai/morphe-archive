.class public Lorg/eclipse/jetty/server/AbstractHttpConnection$OutputWriter;
.super Lorg/eclipse/jetty/server/HttpWriter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/AbstractHttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "OutputWriter"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/AbstractHttpConnection;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection$OutputWriter;->this$0:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    iget-object p1, p1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_out:Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/server/HttpWriter;-><init>(Lorg/eclipse/jetty/server/HttpOutput;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
