.class public final synthetic Ll/pvr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/Network;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

.field public final synthetic c:Ll/rnl;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/tantanapp/common/data/INetParser;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pvr;->a:Lcom/p1/mobile/putong/api/api/Network;

    iput-object p2, p0, Ll/pvr;->b:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    iput-object p3, p0, Ll/pvr;->c:Ll/rnl;

    iput-object p4, p0, Ll/pvr;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/pvr;->e:Lcom/tantanapp/common/data/INetParser;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pvr;->a:Lcom/p1/mobile/putong/api/api/Network;

    iget-object v1, p0, Ll/pvr;->b:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    iget-object v2, p0, Ll/pvr;->c:Ll/rnl;

    iget-object v3, p0, Ll/pvr;->d:Ljava/lang/String;

    iget-object p0, p0, Ll/pvr;->e:Lcom/tantanapp/common/data/INetParser;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->c(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
