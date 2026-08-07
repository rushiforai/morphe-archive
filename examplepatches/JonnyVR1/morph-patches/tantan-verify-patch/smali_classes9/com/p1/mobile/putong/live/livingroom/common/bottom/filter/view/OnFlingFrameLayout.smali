.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;
    }
.end annotation


# static fields
.field public static final c:I

.field public static final d:I


# instance fields
.field public a:Landroid/view/GestureDetector;

.field public b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->i:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->c:I

    .line 4
    .line 5
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->d:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->d()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->d()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->d()V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;

    return-object p0
.end method

.method public static bridge synthetic b()I
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->c:I

    return v0
.end method

.method public static bridge synthetic c()I
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->d:I

    return v0
.end method


# virtual methods
.method public final d()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/view/GestureDetector;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {v1, v2, v0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->a:Landroid/view/GestureDetector;

    .line 16
    .line 17
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->a:Landroid/view/GestureDetector;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setOnFlingListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;

    .line 2
    .line 3
    return-void
.end method
