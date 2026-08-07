.class public Ll/a4h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z3h;


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Z

.field public c:Z

.field public d:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/a4h;->c:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/a4h;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-static {}, Ll/bnl0;->w0()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Ll/a4h;->d:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b(FF)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float p1, p1, v0

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    cmpl-float p1, p2, v0

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget-boolean p1, p0, Ll/a4h;->c:Z

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Ll/a4h;->c:Z

    .line 16
    .line 17
    iget-object p0, p0, Ll/a4h;->a:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-static {p0}, Ll/ynk0;->a(Landroid/app/Activity;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-boolean p1, p0, Ll/a4h;->c:Z

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Ll/a4h;->c:Z

    .line 29
    .line 30
    iget-object p0, p0, Ll/a4h;->a:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    invoke-static {p0}, Ll/ynk0;->b(Landroid/app/Activity;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public c(FF)V
    .locals 1

    .line 1
    const/high16 v0, 0x40200000    # 2.5f

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 p2, 0x0

    .line 9
    cmpl-float p2, p1, p2

    .line 10
    .line 11
    if-ltz p2, :cond_0

    .line 12
    .line 13
    iget p2, p0, Ll/a4h;->d:I

    .line 14
    .line 15
    int-to-float v0, p2

    .line 16
    int-to-float p2, p2

    .line 17
    add-float/2addr p2, p1

    .line 18
    div-float/2addr v0, p2

    .line 19
    invoke-virtual {p0, v0}, Ll/a4h;->e(F)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/a4h;->b:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/a4h;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public e(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a4h;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/a4h;->a:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p0, p0, Ll/a4h;->a:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/high16 v0, 0x437f0000    # 255.0f

    .line 35
    .line 36
    mul-float/2addr p1, v0

    .line 37
    float-to-int p1, p1

    .line 38
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return-void
.end method
