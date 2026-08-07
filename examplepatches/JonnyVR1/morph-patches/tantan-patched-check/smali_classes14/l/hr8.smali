.class public final synthetic Ll/hr8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/i;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/i;Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hr8;->a:Lcom/p1/mobile/putong/core/api/i;

    iput-object p2, p0, Ll/hr8;->b:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hr8;->a:Lcom/p1/mobile/putong/core/api/i;

    iget-object p0, p0, Ll/hr8;->b:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/i;->r3(Lcom/p1/mobile/putong/core/api/i;Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;)V

    return-void
.end method
