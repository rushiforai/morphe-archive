.class Lcom/flipboard/bottomsheet/BottomSheetLayout$g;
.super Lcom/flipboard/bottomsheet/BottomSheetLayout$h;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flipboard/bottomsheet/BottomSheetLayout;->r(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic b:Landroid/view/View;

.field final synthetic c:Lcom/flipboard/bottomsheet/BottomSheetLayout;


# direct methods
.method public constructor <init>(Lcom/flipboard/bottomsheet/BottomSheetLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->b:Landroid/view/View;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout$h;-><init>(Lcom/flipboard/bottomsheet/BottomSheetLayout$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$h;->a:Z

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p1, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->f(Lcom/flipboard/bottomsheet/BottomSheetLayout;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 12
    .line 13
    sget-object v1, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->HIDDEN:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 14
    .line 15
    invoke-static {p1, v1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->j(Lcom/flipboard/bottomsheet/BottomSheetLayout;Lcom/flipboard/bottomsheet/BottomSheetLayout$State;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {p1, v1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->k(Lcom/flipboard/bottomsheet/BottomSheetLayout;I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->b:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->l(Lcom/flipboard/bottomsheet/BottomSheetLayout;)Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Ll/qn50;

    .line 52
    .line 53
    iget-object v2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 54
    .line 55
    invoke-interface {v1, v2}, Ll/qn50;->a(Lcom/flipboard/bottomsheet/BottomSheetLayout;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 60
    .line 61
    invoke-static {p1, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->c(Lcom/flipboard/bottomsheet/BottomSheetLayout;Ll/nml0;)Ll/nml0;

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->d(Lcom/flipboard/bottomsheet/BottomSheetLayout;)Ljava/lang/Runnable;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    if-eqz p1, :cond_1

    .line 71
    .line 72
    iget-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 73
    .line 74
    invoke-static {p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->d(Lcom/flipboard/bottomsheet/BottomSheetLayout;)Ljava/lang/Runnable;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$g;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 82
    .line 83
    invoke-static {p0, v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->e(Lcom/flipboard/bottomsheet/BottomSheetLayout;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 84
    .line 85
    .line 86
    :cond_1
    return-void
.end method
