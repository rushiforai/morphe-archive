.class public final synthetic Ll/ull;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/q4j0;

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;


# direct methods
.method public synthetic constructor <init>(Ll/q4j0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ull;->a:Ll/q4j0;

    iput-object p2, p0, Ll/ull;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ull;->a:Ll/q4j0;

    iget-object p0, p0, Ll/ull;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->b(Ll/q4j0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;Landroid/view/View;)V

    return-void
.end method
