.class public final synthetic Ll/vqj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bjs;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/bjs;Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vqj;->a:Ll/bjs;

    iput-object p2, p0, Ll/vqj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;

    iput-object p3, p0, Ll/vqj;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vqj;->a:Ll/bjs;

    iget-object v1, p0, Ll/vqj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;

    iget-object p0, p0, Ll/vqj;->c:Landroid/view/View;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/noble/GiftDialogNobelEntranceView;->K(Ll/bjs;Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
