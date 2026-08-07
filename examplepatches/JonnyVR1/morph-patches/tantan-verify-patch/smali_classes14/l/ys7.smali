.class public final synthetic Ll/ys7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/Map;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ys7;->a:Ljava/util/Map;

    iput-object p2, p0, Ll/ys7;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ys7;->a:Ljava/util/Map;

    iget-object p0, p0, Ll/ys7;->b:Lcom/p1/mobile/putong/core/data/Message;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Oc(Ljava/util/Map;Lcom/p1/mobile/putong/core/data/Message;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
