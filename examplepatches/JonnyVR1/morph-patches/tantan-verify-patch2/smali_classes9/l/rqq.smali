.class public final synthetic Ll/rqq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rqq;->a:Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rqq;->a:Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;->j(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
