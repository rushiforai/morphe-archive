.class public final synthetic Ll/hr50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

.field public final synthetic c:Z

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hr50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;

    iput-object p2, p0, Ll/hr50;->b:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    iput-boolean p3, p0, Ll/hr50;->c:Z

    iput-boolean p4, p0, Ll/hr50;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hr50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;

    iget-object v1, p0, Ll/hr50;->b:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    iget-boolean v2, p0, Ll/hr50;->c:Z

    iget-boolean p0, p0, Ll/hr50;->d:Z

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->k(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;ZZLjava/lang/Long;)V

    return-void
.end method
