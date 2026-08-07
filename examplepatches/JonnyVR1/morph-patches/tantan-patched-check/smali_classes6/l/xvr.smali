.class public final synthetic Ll/xvr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/Network;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

.field public final synthetic c:Ll/rnl;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:[Ll/st0;

.field public final synthetic f:Lcom/tantanapp/common/data/JsonAdapter;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;Lcom/tantanapp/common/data/JsonAdapter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xvr;->a:Lcom/p1/mobile/putong/api/api/Network;

    iput-object p2, p0, Ll/xvr;->b:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    iput-object p3, p0, Ll/xvr;->c:Ll/rnl;

    iput-object p4, p0, Ll/xvr;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/xvr;->e:[Ll/st0;

    iput-object p6, p0, Ll/xvr;->f:Lcom/tantanapp/common/data/JsonAdapter;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/xvr;->a:Lcom/p1/mobile/putong/api/api/Network;

    iget-object v1, p0, Ll/xvr;->b:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    iget-object v2, p0, Ll/xvr;->c:Ll/rnl;

    iget-object v3, p0, Ll/xvr;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/xvr;->e:[Ll/st0;

    iget-object v5, p0, Ll/xvr;->f:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->f(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;[Ll/st0;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
