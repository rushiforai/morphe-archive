.class public final synthetic Ll/f3c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/f3c;->a:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget p0, p0, Ll/f3c;->a:I

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->a(ILandroid/widget/FrameLayout$LayoutParams;)V

    return-void
.end method
