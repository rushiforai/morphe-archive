.class public Ll/duk;
.super Ll/dji;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;",
        ">",
        "Ll/dji<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final k:Ll/d9t;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/d9t<",
            "TT;>;"
        }
    .end annotation
.end field

.field public l:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;ILl/d9t;Ll/pcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ll/d9t<",
            "TT;>;",
            "Ll/pcj<",
            "TT;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Ll/dji;-><init>(Ljava/lang/String;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 12
    iput-object p3, p0, Ll/duk;->k:Ll/d9t;

    .line 13
    iput-object p4, p0, Ll/duk;->l:Ll/pcj;

    return-void
.end method

.method public constructor <init>(Ll/dji$b;ILl/d9t;Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dji$b<",
            "Ljava/lang/String;",
            ">;I",
            "Ll/d9t<",
            "TT;>;",
            "Ll/pcj<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/dji$b;->getFileName()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Ll/duk;-><init>(Ljava/lang/String;ILl/d9t;Ll/pcj;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic e(Ljava/io/FileInputStream;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/duk;->r(Ljava/io/FileInputStream;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic q(Ljava/lang/Object;)[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/duk;->s(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public r(Ljava/io/FileInputStream;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/FileInputStream;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/duk;->k:Ll/d9t;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Ll/d9t;->c(Ljava/io/InputStream;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Lcom/fasterxml/jackson/core/JsonParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    move-exception p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/dji;->c()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/duk;->l:Ll/pcj;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    .line 24
    .line 25
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/duk;->k:Ll/d9t;

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Ll/d9t;->e(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;Ljava/io/OutputStream;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
