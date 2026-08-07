.class public Ll/b240$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/b240;->y5()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public b:F

.field public c:F

.field public final synthetic d:Ll/b240;


# direct methods
.method public constructor <init>(Ll/b240;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b240$a;->d:Ll/b240;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/b240$a;->a:Z

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Ll/b240$a;->b:F

    .line 11
    .line 12
    iput p1, p0, Ll/b240$a;->c:F

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object p1, p0, Ll/b240$a;->d:Ll/b240;

    .line 2
    .line 3
    invoke-static {p1}, Ll/b240;->S4(Ll/b240;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/b;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Ll/f1g0;->j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/b;->a(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 v0, 0x0

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    return v0

    .line 25
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_6

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    if-eq p1, v1, :cond_4

    .line 33
    .line 34
    const/4 v2, 0x2

    .line 35
    if-eq p1, v2, :cond_1

    .line 36
    .line 37
    return v0

    .line 38
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iget v0, p0, Ll/b240$a;->b:F

    .line 43
    .line 44
    sub-float/2addr p1, v0

    .line 45
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iget v0, p0, Ll/b240$a;->c:F

    .line 50
    .line 51
    sub-float/2addr p2, v0

    .line 52
    const/high16 v0, 0x41700000    # 15.0f

    .line 53
    .line 54
    cmpl-float p1, p1, v0

    .line 55
    .line 56
    if-gtz p1, :cond_2

    .line 57
    .line 58
    cmpl-float p1, p2, v0

    .line 59
    .line 60
    if-lez p1, :cond_3

    .line 61
    .line 62
    :cond_2
    iput-boolean v1, p0, Ll/b240$a;->a:Z

    .line 63
    .line 64
    :cond_3
    return v1

    .line 65
    :cond_4
    iget-boolean p0, p0, Ll/b240$a;->a:Z

    .line 66
    .line 67
    if-eqz p0, :cond_5

    .line 68
    .line 69
    return v1

    .line 70
    :cond_5
    return v0

    .line 71
    :cond_6
    iput-boolean v0, p0, Ll/b240$a;->a:Z

    .line 72
    .line 73
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iput p1, p0, Ll/b240$a;->b:F

    .line 78
    .line 79
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iput p1, p0, Ll/b240$a;->c:F

    .line 84
    .line 85
    return v0
.end method
