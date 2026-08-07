.class public final synthetic Ll/xkz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/clz;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xkz;->a:Ll/clz;

    iput-object p2, p0, Ll/xkz;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xkz;->a:Ll/clz;

    iget-object p0, p0, Ll/xkz;->b:Lcom/p1/mobile/putong/core/data/Message;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, p0, p1}, Ll/clz;->x0(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
