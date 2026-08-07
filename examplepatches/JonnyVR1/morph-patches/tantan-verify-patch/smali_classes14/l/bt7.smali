.class public final synthetic Ll/bt7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/util/Map;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Sticker;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/util/Map;Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bt7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/bt7;->b:Ljava/util/Map;

    iput-object p3, p0, Ll/bt7;->c:Lcom/p1/mobile/putong/core/data/Sticker;

    iput-object p4, p0, Ll/bt7;->d:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bt7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/bt7;->b:Ljava/util/Map;

    iget-object v2, p0, Ll/bt7;->c:Lcom/p1/mobile/putong/core/data/Sticker;

    iget-object p0, p0, Ll/bt7;->d:Lcom/p1/mobile/putong/core/data/Message;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->B6(Lcom/p1/mobile/putong/core/api/g;Ljava/util/Map;Lcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
