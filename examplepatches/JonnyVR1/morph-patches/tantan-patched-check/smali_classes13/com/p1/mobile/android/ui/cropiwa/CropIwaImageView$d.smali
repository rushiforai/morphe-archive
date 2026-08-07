.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public c:I

.field public d:Ll/jqi0;

.field public final synthetic e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/jqi0;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/jqi0;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->d:Ll/jqi0;

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;Ll/vvb;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V

    return-void
.end method


# virtual methods
.method public final a(FFI)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->p(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->d:Ll/jqi0;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Landroid/graphics/RectF;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 15
    .line 16
    invoke-static {v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->f(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Landroid/graphics/RectF;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v0, p1, p2, v1, v2}, Ll/jqi0;->d(FFLandroid/graphics/RectF;Landroid/graphics/RectF;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->f(FFI)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public b(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->a(FFI)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final c(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->c:I

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-ge v0, v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-ne v0, v1, :cond_0

    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {p0, v1, v2, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->a(FFI)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public d(Landroid/view/MotionEvent;Z)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    const/4 p2, 0x6

    .line 9
    if-eq v0, p2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->c(Landroid/view/MotionEvent;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iget v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->c:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->p(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V

    .line 25
    .line 26
    .line 27
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->d:Ll/jqi0;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {v1, v2}, Ll/jqi0;->b(F)F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->d:Ll/jqi0;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {v2, v0}, Ll/jqi0;->c(F)F

    .line 44
    .line 45
    .line 46
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    goto :goto_0

    .line 48
    :catch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    :goto_0
    if-eqz p2, :cond_2

    .line 57
    .line 58
    iget-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->e:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 59
    .line 60
    iget v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->a:F

    .line 61
    .line 62
    sub-float v0, v1, v0

    .line 63
    .line 64
    iget v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->b:F

    .line 65
    .line 66
    sub-float v2, p1, v2

    .line 67
    .line 68
    invoke-static {p2, v0, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->o(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;FF)V

    .line 69
    .line 70
    .line 71
    :cond_2
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->e(FF)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final e(FF)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->f(FFI)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(FFI)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->a:F

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->b:F

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->c:I

    .line 6
    .line 7
    return-void
.end method
