.class public final synthetic Ll/mwu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;

.field public final synthetic b:Ll/lwu;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;Ll/lwu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mwu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;

    iput-object p2, p0, Ll/mwu;->b:Ll/lwu;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mwu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;

    iget-object p0, p0, Ll/mwu;->b:Ll/lwu;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->b(Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;Ll/lwu;Landroid/view/View;)V

    return-void
.end method
