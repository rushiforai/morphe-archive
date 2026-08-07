.class Lcn/qqtheme/framework/wheelview/WheelScroller$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/qqtheme/framework/wheelview/WheelScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/qqtheme/framework/wheelview/WheelScroller;


# direct methods
.method public constructor <init>(Lcn/qqtheme/framework/wheelview/WheelScroller;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelScroller$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 9

    .line 1
    iget-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelScroller$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-static {p1, p2}, Lcn/qqtheme/framework/wheelview/WheelScroller;->access$002(Lcn/qqtheme/framework/wheelview/WheelScroller;I)I

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelScroller$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 8
    .line 9
    invoke-static {p1}, Lcn/qqtheme/framework/wheelview/WheelScroller;->access$100(Lcn/qqtheme/framework/wheelview/WheelScroller;)Landroid/widget/Scroller;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelScroller$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 14
    .line 15
    invoke-static {p1}, Lcn/qqtheme/framework/wheelview/WheelScroller;->access$000(Lcn/qqtheme/framework/wheelview/WheelScroller;)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    neg-float p1, p4

    .line 20
    float-to-int v4, p1

    .line 21
    const v7, -0x7fffffff

    .line 22
    .line 23
    .line 24
    const v8, 0x7fffffff

    .line 25
    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    const/4 v3, 0x0

    .line 29
    const/4 v5, 0x0

    .line 30
    const/4 v6, 0x0

    .line 31
    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelScroller$1;->this$0:Lcn/qqtheme/framework/wheelview/WheelScroller;

    .line 35
    .line 36
    invoke-static {p0, p2}, Lcn/qqtheme/framework/wheelview/WheelScroller;->access$200(Lcn/qqtheme/framework/wheelview/WheelScroller;I)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
