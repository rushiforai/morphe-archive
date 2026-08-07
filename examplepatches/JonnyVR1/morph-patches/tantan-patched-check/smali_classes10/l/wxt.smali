.class public final synthetic Ll/wxt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

.field public final synthetic b:Landroid/widget/RelativeLayout$LayoutParams;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;Landroid/widget/RelativeLayout$LayoutParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wxt;->a:Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    iput-object p2, p0, Ll/wxt;->b:Landroid/widget/RelativeLayout$LayoutParams;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wxt;->a:Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    iget-object p0, p0, Ll/wxt;->b:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;->a(Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;Landroid/widget/RelativeLayout$LayoutParams;Landroid/animation/ValueAnimator;)V

    return-void
.end method
