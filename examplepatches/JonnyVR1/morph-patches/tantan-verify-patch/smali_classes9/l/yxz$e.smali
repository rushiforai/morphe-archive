.class public Ll/yxz$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bm50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yxz;->U3()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:F

.field public b:Z

.field public final synthetic c:Ll/yxz;


# direct methods
.method public constructor <init>(Ll/yxz;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yxz$e;->c:Ll/yxz;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Ll/yxz$e;->a:F

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Ll/yxz$e;->b:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-eq v0, v2, :cond_2

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    if-eq v0, v3, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-boolean v0, p0, Ll/yxz$e;->b:Z

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget v0, p0, Ll/yxz$e;->a:F

    .line 24
    .line 25
    sub-float/2addr v0, p1

    .line 26
    const/4 v3, 0x0

    .line 27
    cmpl-float v0, v0, v3

    .line 28
    .line 29
    if-lez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/yxz$e;->c:Ll/yxz;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/qzz;->e0()V

    .line 34
    .line 35
    .line 36
    iput-boolean v2, p0, Ll/yxz$e;->b:Z

    .line 37
    .line 38
    :cond_1
    iput p1, p0, Ll/yxz$e;->a:F

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    iput-boolean v1, p0, Ll/yxz$e;->b:Z

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iput p1, p0, Ll/yxz$e;->a:F

    .line 49
    .line 50
    iput-boolean v1, p0, Ll/yxz$e;->b:Z

    .line 51
    .line 52
    :goto_0
    return v1
.end method
