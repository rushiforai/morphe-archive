.class public final synthetic Ll/a0n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/nsv;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a0n0;->a:Ll/nsv;

    iput-object p2, p0, Ll/a0n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    iput-object p3, p0, Ll/a0n0;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a0n0;->a:Ll/nsv;

    iget-object v1, p0, Ll/a0n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    iget-object p0, p0, Ll/a0n0;->c:Ll/y20;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->b(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/y20;Landroid/view/View;)V

    return-void
.end method
