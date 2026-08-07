.class public Ll/w0r$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w0r;->Z(Landroid/view/View;Landroid/view/View;Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/w0r;


# direct methods
.method public constructor <init>(Ll/w0r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w0r$d;->a:Ll/w0r;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/w0r$d;->a:Ll/w0r;

    .line 10
    .line 11
    invoke-static {p1, v2}, Ll/w0r;->C(Ll/w0r;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/w0r$d;->a:Ll/w0r;

    .line 15
    .line 16
    invoke-static {p0}, Ll/w0r;->F(Ll/w0r;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-ne v0, v1, :cond_2

    .line 25
    .line 26
    invoke-static {p1, p2}, Ll/bnl0;->O(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Ll/w0r$d;->a:Ll/w0r;

    .line 33
    .line 34
    invoke-static {p1}, Ll/w0r;->A(Ll/w0r;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Ll/w0r$d;->a:Ll/w0r;

    .line 41
    .line 42
    invoke-static {p1}, Ll/w0r;->D(Ll/w0r;)Z

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object p0, p0, Ll/w0r$d;->a:Ll/w0r;

    .line 46
    .line 47
    invoke-static {p0}, Ll/w0r;->G(Ll/w0r;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/4 v3, 0x3

    .line 56
    if-ne v0, v3, :cond_3

    .line 57
    .line 58
    iget-object p0, p0, Ll/w0r$d;->a:Ll/w0r;

    .line 59
    .line 60
    invoke-static {p0}, Ll/w0r;->G(Ll/w0r;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    invoke-static {p1, p2}, Ll/bnl0;->O(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_4

    .line 69
    .line 70
    iget-object p0, p0, Ll/w0r$d;->a:Ll/w0r;

    .line 71
    .line 72
    invoke-static {p0}, Ll/w0r;->G(Ll/w0r;)V

    .line 73
    .line 74
    .line 75
    return v2

    .line 76
    :cond_4
    :goto_0
    return v1
.end method
