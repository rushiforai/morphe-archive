.class public final synthetic Ll/kbh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kbh0;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/kbh0;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kbh0;->a:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/kbh0;->b:Lcom/p1/mobile/putong/core/data/Message;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, p0, p1}, Ll/ybh0;->Q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Relationship;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
