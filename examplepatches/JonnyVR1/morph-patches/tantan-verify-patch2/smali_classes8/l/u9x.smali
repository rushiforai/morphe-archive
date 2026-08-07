.class public final synthetic Ll/u9x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v9x;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Ll/v9x;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u9x;->a:Ll/v9x;

    iput-object p2, p0, Ll/u9x;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u9x;->a:Ll/v9x;

    iget-object p0, p0, Ll/u9x;->b:Lcom/p1/mobile/putong/core/data/Message;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/v9x;->F0(Ll/v9x;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V

    return-void
.end method
