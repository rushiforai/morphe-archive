.class public final synthetic Ll/de3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

.field public final synthetic b:Ll/fe3;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/fe3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/de3;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    iput-object p2, p0, Ll/de3;->b:Ll/fe3;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/de3;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    iget-object p0, p0, Ll/de3;->b:Ll/fe3;

    invoke-static {v0, p0, p1}, Ll/fe3;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/fe3;Landroid/view/View;)V

    return-void
.end method
