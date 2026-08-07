.class public final synthetic Ll/rfo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;

.field public final synthetic c:Ll/efo0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;Ll/efo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rfo0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;

    iput-object p2, p0, Ll/rfo0;->b:Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;

    iput-object p3, p0, Ll/rfo0;->c:Ll/efo0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rfo0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;

    iget-object v1, p0, Ll/rfo0;->b:Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;

    iget-object p0, p0, Ll/rfo0;->c:Ll/efo0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;Ll/efo0;Landroid/view/View;)V

    return-void
.end method
