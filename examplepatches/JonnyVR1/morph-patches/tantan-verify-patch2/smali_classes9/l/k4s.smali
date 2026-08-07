.class public final synthetic Ll/k4s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k4s;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k4s;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
