.class public Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;->g(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Ljava/lang/String;Landroid/widget/LinearLayout$LayoutParams;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->actionListener:Ll/z20;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->callback:Ljava/lang/String;

    .line 21
    .line 22
    invoke-interface {v0, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
