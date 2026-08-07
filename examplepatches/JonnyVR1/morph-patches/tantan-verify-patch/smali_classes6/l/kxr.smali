.class public final synthetic Ll/kxr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

.field public final synthetic b:Ll/rnl;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/tantanapp/common/data/JsonAdapter;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kxr;->a:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

    iput-object p2, p0, Ll/kxr;->b:Ll/rnl;

    iput-object p3, p0, Ll/kxr;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/kxr;->d:Lcom/tantanapp/common/data/JsonAdapter;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kxr;->a:Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;

    iget-object v1, p0, Ll/kxr;->b:Ll/rnl;

    iget-object v2, p0, Ll/kxr;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/kxr;->d:Lcom/tantanapp/common/data/JsonAdapter;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->c(Lcom/p1/mobile/putong/live/base/api/LiveBaseApi$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
