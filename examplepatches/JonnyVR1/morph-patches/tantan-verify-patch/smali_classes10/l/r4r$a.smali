.class public Ll/r4r$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b6r;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r4r;->t()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/r4r;


# direct methods
.method public constructor <init>(Ll/r4r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r4r$a;->a:Ll/r4r;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r4r$a;->a:Ll/r4r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->showTuningDialog()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public b(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r4r$a;->a:Ll/r4r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KtvDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;->showKtvDialog()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public c(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r4r$a;->a:Ll/r4r;

    .line 2
    .line 3
    invoke-static {p0, p2}, Ll/r4r;->V3(Ll/r4r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
