.class public Ll/pzb0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pzb0;->d0(Lcom/p1/mobile/android/app/Act;)Landroid/view/GestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/pzb0;


# direct methods
.method public constructor <init>(Ll/pzb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pzb0$a;->a:Ll/pzb0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/pzb0$a;->a:Ll/pzb0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/pzb0;->V(Ll/pzb0;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/pzb0$a;->a:Ll/pzb0;

    .line 10
    .line 11
    const/4 p2, 0x1

    .line 12
    invoke-static {p1, p2}, Ll/pzb0;->W(Ll/pzb0;Z)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    cmpl-float p1, p4, p1

    .line 17
    .line 18
    if-lez p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/pzb0$a;->a:Ll/pzb0;

    .line 21
    .line 22
    invoke-static {p0}, Ll/pzb0;->X(Ll/pzb0;)V

    .line 23
    .line 24
    .line 25
    return p2

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
