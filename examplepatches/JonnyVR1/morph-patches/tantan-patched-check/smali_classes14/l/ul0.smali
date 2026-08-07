.class public final synthetic Ll/ul0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/wl0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;


# direct methods
.method public synthetic constructor <init>(Ll/wl0;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ul0;->a:Ll/wl0;

    iput-object p2, p0, Ll/ul0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ul0;->a:Ll/wl0;

    iget-object p0, p0, Ll/ul0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    invoke-static {v0, p0, p1}, Ll/wl0;->a(Ll/wl0;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;Landroid/view/View;)V

    return-void
.end method
