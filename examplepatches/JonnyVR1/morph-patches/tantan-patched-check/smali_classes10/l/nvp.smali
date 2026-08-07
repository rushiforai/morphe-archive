.class public final synthetic Ll/nvp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;

.field public final synthetic b:Ll/xup;

.field public final synthetic c:Ll/mvp;

.field public final synthetic d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;Ll/xup;Ll/mvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nvp;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;

    iput-object p2, p0, Ll/nvp;->b:Ll/xup;

    iput-object p3, p0, Ll/nvp;->c:Ll/mvp;

    iput-object p4, p0, Ll/nvp;->d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nvp;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;

    iget-object v1, p0, Ll/nvp;->b:Ll/xup;

    iget-object v2, p0, Ll/nvp;->c:Ll/mvp;

    iget-object p0, p0, Ll/nvp;->d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->b(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;Ll/xup;Ll/mvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;Landroid/view/View;)V

    return-void
.end method
