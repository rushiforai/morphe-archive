.class public final synthetic Ll/id3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ld3;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;


# direct methods
.method public synthetic constructor <init>(Ll/ld3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/id3;->a:Ll/ld3;

    iput-object p2, p0, Ll/id3;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/id3;->a:Ll/ld3;

    iget-object p0, p0, Ll/id3;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    invoke-static {v0, p0, p1}, Ll/ld3;->h(Ll/ld3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Landroid/view/View;)V

    return-void
.end method
