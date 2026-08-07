.class public Lcom/p1/mobile/putong/core/api/e$b;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/core/data/GroupTab;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic h:Lcom/p1/mobile/putong/core/api/e;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/e;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/e$b;->h:Lcom/p1/mobile/putong/core/api/e;

    .line 2
    .line 3
    new-instance v0, Ll/dji;

    .line 4
    .line 5
    new-instance v1, Ll/vod;

    .line 6
    .line 7
    const-string v2, "_1"

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const-string v4, "chat_group_tabs"

    .line 11
    .line 12
    invoke-direct {v1, v4, v2, v3}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/core/data/GroupTab;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const/4 v3, -0x1

    .line 22
    invoke-direct {v0, v1, v3, v2}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Ll/qm7;

    .line 26
    .line 27
    invoke-direct {v1, p1}, Ll/qm7;-><init>(Lcom/p1/mobile/putong/core/api/e;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, v4, v0, v1}, Ll/mof0;-><init>(Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/api/e;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/e;->i6(Lcom/p1/mobile/putong/core/api/e;)Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/e;->i6(Lcom/p1/mobile/putong/core/api/e;)Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/util/List;

    .line 20
    .line 21
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
