.class Lcom/rengwuxian/materialedittext/MaterialEditText$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rengwuxian/materialedittext/MaterialEditText;->s()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/rengwuxian/materialedittext/MaterialEditText;


# direct methods
.method public constructor <init>(Lcom/rengwuxian/materialedittext/MaterialEditText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText$b;->a:Lcom/rengwuxian/materialedittext/MaterialEditText;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText$b;->a:Lcom/rengwuxian/materialedittext/MaterialEditText;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->c(Lcom/rengwuxian/materialedittext/MaterialEditText;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText$b;->a:Lcom/rengwuxian/materialedittext/MaterialEditText;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-static {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->d(Lcom/rengwuxian/materialedittext/MaterialEditText;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    iget-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText$b;->a:Lcom/rengwuxian/materialedittext/MaterialEditText;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {p1, v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->e(Lcom/rengwuxian/materialedittext/MaterialEditText;Z)Z

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText$b;->a:Lcom/rengwuxian/materialedittext/MaterialEditText;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->f(Lcom/rengwuxian/materialedittext/MaterialEditText;)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->reverse()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-static {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->d(Lcom/rengwuxian/materialedittext/MaterialEditText;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    iget-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText$b;->a:Lcom/rengwuxian/materialedittext/MaterialEditText;

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    invoke-static {p1, v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->e(Lcom/rengwuxian/materialedittext/MaterialEditText;Z)Z

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText$b;->a:Lcom/rengwuxian/materialedittext/MaterialEditText;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->f(Lcom/rengwuxian/materialedittext/MaterialEditText;)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Landroid/animation/Animator;->isStarted()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText$b;->a:Lcom/rengwuxian/materialedittext/MaterialEditText;

    .line 62
    .line 63
    if-eqz p1, :cond_1

    .line 64
    .line 65
    invoke-static {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->f(Lcom/rengwuxian/materialedittext/MaterialEditText;)Landroid/animation/ObjectAnimator;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->reverse()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    invoke-static {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->f(Lcom/rengwuxian/materialedittext/MaterialEditText;)Landroid/animation/ObjectAnimator;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
