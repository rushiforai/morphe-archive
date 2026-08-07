.class public final synthetic Ll/n4n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/o4n0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;


# direct methods
.method public synthetic constructor <init>(Ll/o4n0;Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n4n0;->a:Ll/o4n0;

    iput-object p2, p0, Ll/n4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n4n0;->a:Ll/o4n0;

    iget-object p0, p0, Ll/n4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;

    invoke-static {v0, p0, p1}, Ll/o4n0;->e(Ll/o4n0;Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceActionButton;Landroid/view/View;)V

    return-void
.end method
