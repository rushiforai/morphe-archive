.class public final synthetic Ll/czo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/czo0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    iput-object p2, p0, Ll/czo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/czo0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    iget-object p0, p0, Ll/czo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->e(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;Landroid/view/View;)V

    return-void
.end method
