.class public final synthetic Ll/kwl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kwl0;->a:Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;

    iput p2, p0, Ll/kwl0;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kwl0;->a:Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;

    iget p0, p0, Ll/kwl0;->b:I

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;->f(Lcom/p1/mobile/putong/core/newui/home/VipSuperLikeContainer;I)V

    return-void
.end method
