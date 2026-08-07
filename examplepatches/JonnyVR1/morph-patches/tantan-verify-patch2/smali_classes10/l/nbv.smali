.class public final synthetic Ll/nbv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;

.field public final synthetic b:Ll/oo2;

.field public final synthetic c:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nbv;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;

    iput-object p2, p0, Ll/nbv;->b:Ll/oo2;

    iput-object p3, p0, Ll/nbv;->c:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    iput-object p4, p0, Ll/nbv;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nbv;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;

    iget-object v1, p0, Ll/nbv;->b:Ll/oo2;

    iget-object v2, p0, Ll/nbv;->c:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    iget-object p0, p0, Ll/nbv;->d:Ll/y20;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;->c(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoicePayGuideBottomDialog;Ll/oo2;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ll/y20;Landroid/view/View;)V

    return-void
.end method
