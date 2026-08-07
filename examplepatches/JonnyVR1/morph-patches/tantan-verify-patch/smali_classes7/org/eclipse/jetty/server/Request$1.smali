.class Lorg/eclipse/jetty/server/Request$1;
.super Ljava/io/BufferedReader;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/server/Request;->getReader()Ljava/io/BufferedReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/Request;

.field final synthetic val$in:Ll/dse0;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/Request;Ljava/io/Reader;Ll/dse0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/Request$1;->this$0:Lorg/eclipse/jetty/server/Request;

    .line 2
    .line 3
    iput-object p3, p0, Lorg/eclipse/jetty/server/Request$1;->val$in:Ll/dse0;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/Request$1;->val$in:Ll/dse0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
