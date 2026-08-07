.class public Ll/ukp0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Landroid/view/GestureDetector$SimpleOnGestureListener;

.field public c:Ll/lmj;

.field public d:I

.field public e:I

.field public f:Ll/i6t;


# direct methods
.method public constructor <init>(Ll/i6t;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/ukp0;->a:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/ukp0;->f:Ll/i6t;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/cyr;->C0()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Ll/ukp0;->d:I

    .line 22
    .line 23
    iget-object p1, p0, Ll/ukp0;->f:Ll/i6t;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/cyr;->C0()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iput p1, p0, Ll/ukp0;->e:I

    .line 38
    .line 39
    new-instance p1, Ll/ukp0$a;

    .line 40
    .line 41
    invoke-direct {p1, p0}, Ll/ukp0$a;-><init>(Ll/ukp0;)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Ll/ukp0;->b:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 45
    .line 46
    new-instance p1, Ll/lmj;

    .line 47
    .line 48
    iget-object v0, p0, Ll/ukp0;->f:Ll/i6t;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Ll/ukp0;->b:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 55
    .line 56
    invoke-direct {p1, v0, v1}, Ll/lmj;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Ll/ukp0;->c:Ll/lmj;

    .line 60
    .line 61
    return-void
.end method

.method public static bridge synthetic a(Ll/ukp0;)Ll/i6t;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ukp0;->f:Ll/i6t;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/ukp0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ukp0;->e:I

    return p0
.end method

.method public static bridge synthetic c(Ll/ukp0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ukp0;->d:I

    return p0
.end method


# virtual methods
.method public d(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ukp0;->c:Ll/lmj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/lmj;->a(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public e(Landroid/view/MotionEvent;)Z
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
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eq v0, v2, :cond_0

    .line 10
    .line 11
    const/4 v3, 0x3

    .line 12
    if-eq v0, v3, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iput-boolean v1, p0, Ll/ukp0;->a:Z

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iput-boolean v2, p0, Ll/ukp0;->a:Z

    .line 19
    .line 20
    :goto_0
    iget-object p0, p0, Ll/ukp0;->c:Ll/lmj;

    .line 21
    .line 22
    if-eqz p0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/lmj;->a(Landroid/view/MotionEvent;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    return v2

    .line 31
    :cond_2
    return v1
.end method
