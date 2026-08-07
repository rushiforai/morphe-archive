.class public final synthetic Ll/d060;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

.field public final synthetic b:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic c:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d060;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    iput-object p2, p0, Ll/d060;->b:Lcom/p1/mobile/android/app/Dialog;

    iput-object p3, p0, Ll/d060;->c:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d060;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    iget-object v1, p0, Ll/d060;->b:Lcom/p1/mobile/android/app/Dialog;

    iget-object p0, p0, Ll/d060;->c:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;->i0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;Landroid/view/View;)V

    return-void
.end method
