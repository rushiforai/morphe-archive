.class public final synthetic Ll/jkn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jkn;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;

    iput-object p2, p0, Ll/jkn;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jkn;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;

    iget-object p0, p0, Ll/jkn;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->a(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;Landroid/view/View;)V

    return-void
.end method
