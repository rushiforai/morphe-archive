.class public Ll/pci$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pci;->H(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;IZ)V
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
    iput-object p1, p0, Ll/pci$a;->a:Lcom/p1/mobile/android/app/Act;

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
    invoke-static {}, Ll/pci;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-static {p1}, Ll/pci;->r(Z)V

    .line 9
    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    cmpl-float p2, p4, p2

    .line 13
    .line 14
    if-lez p2, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/pci;->v()V

    .line 17
    .line 18
    .line 19
    return p1

    .line 20
    :cond_0
    if-nez p2, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/pci$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-static {p0}, Ll/pci;->w(Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    return p1

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
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
    invoke-static {}, Ll/pci;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-static {p1}, Ll/pci;->r(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/pci$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-static {p0}, Ll/pci;->w(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    return p1

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method
