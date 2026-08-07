.class public Lv/progressbar/ProgressDrawable$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/progressbar/ProgressDrawable;->E()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/progressbar/ProgressDrawable;


# direct methods
.method public constructor <init>(Lv/progressbar/ProgressDrawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/progressbar/ProgressDrawable$b;->a:Lv/progressbar/ProgressDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/o4b0;->e(Landroid/animation/ValueAnimator;)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lv/progressbar/ProgressDrawable$b;->a:Lv/progressbar/ProgressDrawable;

    .line 6
    .line 7
    invoke-static {v0}, Lv/progressbar/ProgressDrawable;->e(Lv/progressbar/ProgressDrawable;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lv/progressbar/ProgressDrawable$b;->a:Lv/progressbar/ProgressDrawable;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {v1}, Lv/progressbar/ProgressDrawable;->f(Lv/progressbar/ProgressDrawable;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    mul-float/2addr p1, v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {v1}, Lv/progressbar/ProgressDrawable;->g(Lv/progressbar/ProgressDrawable;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-float v0, v0

    .line 27
    iget-object v1, p0, Lv/progressbar/ProgressDrawable$b;->a:Lv/progressbar/ProgressDrawable;

    .line 28
    .line 29
    invoke-static {v1}, Lv/progressbar/ProgressDrawable;->f(Lv/progressbar/ProgressDrawable;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object v2, p0, Lv/progressbar/ProgressDrawable$b;->a:Lv/progressbar/ProgressDrawable;

    .line 34
    .line 35
    invoke-static {v2}, Lv/progressbar/ProgressDrawable;->g(Lv/progressbar/ProgressDrawable;)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    sub-int/2addr v1, v2

    .line 40
    int-to-float v1, v1

    .line 41
    mul-float/2addr p1, v1

    .line 42
    add-float/2addr p1, v0

    .line 43
    :goto_0
    iget-object p0, p0, Lv/progressbar/ProgressDrawable$b;->a:Lv/progressbar/ProgressDrawable;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lv/progressbar/ProgressDrawable;->B(F)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
