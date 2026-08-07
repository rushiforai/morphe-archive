.class public Ll/qgh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/d0r;


# instance fields
.field public a:I

.field public b:Ll/f0r;

.field public c:I

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Ll/qgh;->c:I

    .line 5
    .line 6
    iput-object p1, p0, Ll/qgh;->d:Landroid/view/View;

    .line 7
    .line 8
    iput-object p2, p0, Ll/qgh;->e:Landroid/view/View;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qgh;->b:Ll/f0r;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/qgh;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/qgh;->f:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/qgh;->f:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p0, p0, Ll/qgh;->b:Ll/f0r;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/f0r;->b()V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public final b()[I
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object p0, p0, Ll/qgh;->d:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public final c()Landroid/graphics/Rect;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/qgh;->f:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public final d(Landroid/graphics/Rect;[I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/qgh;->a:I

    .line 2
    .line 3
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 4
    .line 5
    sub-int/2addr v0, p1

    .line 6
    const/4 p1, 0x1

    .line 7
    aget p1, p2, p1

    .line 8
    .line 9
    iget-object p2, p0, Ll/qgh;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-static {p2}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    sub-int/2addr p2, v0

    .line 16
    iget v0, p0, Ll/qgh;->c:I

    .line 17
    .line 18
    sub-int/2addr p2, v0

    .line 19
    if-le p1, p2, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/qgh;->e:Landroid/view/View;

    .line 22
    .line 23
    int-to-float p1, p2

    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setY(F)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/qgh;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Ll/qgh;->a:I

    .line 8
    .line 9
    new-instance v0, Ll/f0r;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/f0r;-><init>(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/qgh;->b:Ll/f0r;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ll/f0r;->g(Ll/d0r;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/qgh;->b:Ll/f0r;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/f0r;->h()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public h(II)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Ll/qgh;->g:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/qgh;->b()[I

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0}, Ll/qgh;->c()Landroid/graphics/Rect;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    .line 15
    .line 16
    iget v1, p0, Ll/qgh;->a:I

    .line 17
    .line 18
    if-ge v0, v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p2, p1}, Ll/qgh;->d(Landroid/graphics/Rect;[I)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method
