.class public final synthetic Ll/uin;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fjn;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGamePanelButtons;


# direct methods
.method public synthetic constructor <init>(Ll/fjn;Lcom/p1/mobile/putong/live/base/data/BLiveGamePanelButtons;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uin;->a:Ll/fjn;

    iput-object p2, p0, Ll/uin;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGamePanelButtons;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uin;->a:Ll/fjn;

    iget-object p0, p0, Ll/uin;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGamePanelButtons;

    invoke-static {v0, p0, p1}, Ll/fjn;->W3(Ll/fjn;Lcom/p1/mobile/putong/live/base/data/BLiveGamePanelButtons;Landroid/view/View;)V

    return-void
.end method
