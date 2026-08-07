.class public final synthetic Ll/h2o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h2o0;->a:Ll/y20;

    iput-object p2, p0, Ll/h2o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h2o0;->a:Ll/y20;

    iget-object p0, p0, Ll/h2o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/manager/VoiceLiveManagerInviteItemView;->h0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
