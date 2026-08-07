.class public final synthetic Ll/frp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/hrp;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;


# direct methods
.method public synthetic constructor <init>(Ll/hrp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/frp;->a:Ll/hrp;

    iput-object p2, p0, Ll/frp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/frp;->a:Ll/hrp;

    iget-object p0, p0, Ll/frp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    invoke-static {v0, p0, p1}, Ll/hrp;->b(Ll/hrp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Landroid/view/View;)V

    return-void
.end method
