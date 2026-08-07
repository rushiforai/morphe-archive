.class public final synthetic Ll/icn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/icn0;->a:Ll/y20;

    iput-object p2, p0, Ll/icn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/icn0;->a:Ll/y20;

    iget-object p0, p0, Ll/icn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;->i0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;Landroid/view/View;)V

    return-void
.end method
