.class public final synthetic Ll/nru;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/isu;


# direct methods
.method public synthetic constructor <init>(Ll/isu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nru;->a:Ll/isu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nru;->a:Ll/isu;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    check-cast p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    invoke-static {p0, p1, p2}, Ll/isu;->b(Ll/isu;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)V

    return-void
.end method
