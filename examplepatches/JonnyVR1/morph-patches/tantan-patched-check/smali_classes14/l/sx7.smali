.class public final synthetic Ll/sx7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Message;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sx7;->a:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p2, p0, Ll/sx7;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sx7;->a:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/sx7;->b:Ljava/util/List;

    check-cast p1, Ll/bkj0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->X8(Lcom/p1/mobile/putong/core/data/Message;Ljava/util/List;Ll/bkj0;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
