.class public final synthetic Ll/lqq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lqq;->a:Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;

    iput-object p2, p0, Ll/lqq;->b:Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lqq;->a:Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;

    iget-object p0, p0, Ll/lqq;->b:Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;->l(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Landroid/view/View;)V

    return-void
.end method
