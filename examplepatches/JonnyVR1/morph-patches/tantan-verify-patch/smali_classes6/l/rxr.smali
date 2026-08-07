.class public final synthetic Ll/rxr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

.field public final synthetic b:Ll/rnl;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rxr;->a:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

    iput-object p2, p0, Ll/rxr;->b:Ll/rnl;

    iput-object p3, p0, Ll/rxr;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rxr;->a:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

    iget-object v1, p0, Ll/rxr;->b:Ll/rnl;

    iget-object p0, p0, Ll/rxr;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->a(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
