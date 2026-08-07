.class public final synthetic Ll/be3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fe3;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/fe3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/be3;->a:Ll/fe3;

    iput-object p2, p0, Ll/be3;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    iput-object p3, p0, Ll/be3;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/be3;->a:Ll/fe3;

    iget-object v1, p0, Ll/be3;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    iget-object p0, p0, Ll/be3;->c:Ll/x20;

    invoke-static {v0, v1, p0, p1}, Ll/fe3;->m(Ll/fe3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/x20;Landroid/view/View;)V

    return-void
.end method
