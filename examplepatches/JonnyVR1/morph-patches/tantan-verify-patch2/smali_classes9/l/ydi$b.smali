.class public Ll/ydi$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ydi;->o(Lcom/p1/mobile/android/app/Act;)Landroid/view/GestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ydi$b;->a:Lcom/p1/mobile/android/app/Act;

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
    invoke-static {}, Ll/ydi;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x0

    .line 6
    if-nez p1, :cond_1

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-static {p1}, Ll/ydi;->i(Z)V

    .line 10
    .line 11
    .line 12
    const/4 p3, 0x0

    .line 13
    cmpl-float p3, p4, p3

    .line 14
    .line 15
    if-lez p3, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/ydi;->j()V

    .line 18
    .line 19
    .line 20
    return p1

    .line 21
    :cond_0
    if-nez p3, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/ydi$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    const-string p3, ""

    .line 26
    .line 27
    invoke-static {p0, p3, p2}, Ll/ydi;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :cond_1
    return p2
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/ydi;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-static {p1}, Ll/ydi;->i(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ydi$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    const-string v1, ""

    .line 15
    .line 16
    invoke-static {p0, v1, v0}, Ll/ydi;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    return p1

    .line 20
    :cond_0
    return v0
.end method
