.class public Ll/dyf0;
.super Ll/fqe0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dyf0$a;,
        Ll/dyf0$b;
    }
.end annotation


# static fields
.field public static final k:I


# instance fields
.field public final i:Ll/dyf0$a;

.field public j:Ll/dyf0$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x42b80000    # 92.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/dyf0;->k:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/dyf0$a;)V
    .locals 0
    .param p1    # Ll/dyf0$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/fqe0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dyf0;->i:Ll/dyf0$a;

    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/dyf0$a;Ll/fyf0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/dyf0;-><init>(Ll/dyf0$a;)V

    return-void
.end method

.method public static synthetic B(Ll/dyf0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dyf0;->F(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static bridge synthetic C()I
    .locals 1

    .line 1
    sget v0, Ll/dyf0;->k:I

    return v0
.end method


# virtual methods
.method public A()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fqe0;->d:Ll/pcj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v1

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 22
    :goto_1
    iget-object v2, p0, Ll/dyf0;->i:Ll/dyf0$a;

    .line 23
    .line 24
    invoke-static {v2}, Ll/dyf0$a;->e(Ll/dyf0$a;)Landroid/app/Activity;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_2
    new-instance v0, Ll/dyf0$b;

    .line 38
    .line 39
    iget-object v1, p0, Ll/dyf0;->i:Ll/dyf0$a;

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ll/dyf0$b;-><init>(Ll/dyf0$a;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/dyf0;->j:Ll/dyf0$b;

    .line 45
    .line 46
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    new-instance v1, Ll/xxf0;

    .line 50
    .line 51
    invoke-direct {v1, v0}, Ll/xxf0;-><init>(Ll/dyf0$b;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/dyf0;->j:Ll/dyf0$b;

    .line 55
    .line 56
    new-instance v2, Ll/yxf0;

    .line 57
    .line 58
    invoke-direct {v2, p0, v1}, Ll/yxf0;-><init>(Ll/dyf0;Ljava/lang/Runnable;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/dyf0;->j:Ll/dyf0$b;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/dyf0$b;->e()V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/jlb0;->a:Ll/x20;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    iget-object v0, p0, Ll/jlb0;->a:Ll/x20;

    .line 78
    .line 79
    invoke-interface {v0}, Ll/x20;->call()V

    .line 80
    .line 81
    .line 82
    :cond_3
    iget-object v0, p0, Ll/dyf0;->i:Ll/dyf0$a;

    .line 83
    .line 84
    invoke-static {v0}, Ll/dyf0$a;->e(Ll/dyf0$a;)Landroid/app/Activity;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object v2, p0, Ll/dyf0;->i:Ll/dyf0$a;

    .line 89
    .line 90
    invoke-static {v2}, Ll/dyf0$a;->i(Ll/dyf0$a;)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    int-to-long v2, v2

    .line 95
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Ll/dyf0;->i:Ll/dyf0$a;

    .line 99
    .line 100
    invoke-static {p0}, Ll/dyf0$a;->i(Ll/dyf0$a;)I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    return p0

    .line 105
    :cond_4
    :goto_2
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

    .line 106
    .line 107
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_5

    .line 112
    .line 113
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 114
    .line 115
    invoke-interface {p0}, Ll/x20;->call()V

    .line 116
    .line 117
    .line 118
    :cond_5
    return v1
.end method

.method public final synthetic F(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/jlb0;->b:Ll/x20;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public f(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dyf0;->j:Ll/dyf0$b;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/dyf0;->j:Ll/dyf0$b;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/dyf0;->j:Ll/dyf0$b;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/high16 p1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/high16 v0, -0x3a860000    # -4000.0f

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/dyf0;->j:Ll/dyf0$b;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public j()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyf0;->i:Ll/dyf0$a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/dyf0$a;->e(Ll/dyf0$a;)Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public m()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyf0;->i:Ll/dyf0$a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/dyf0$a;->e(Ll/dyf0$a;)Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-object p0
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/dyf0;->j:Ll/dyf0$b;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/dyf0;->j:Ll/dyf0$b;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/dyf0$b;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p0, Ll/fqe0;->f:Ll/z2m;

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-interface {p1, p0}, Ll/z2m;->a(Ll/d3m;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyf0;->i:Ll/dyf0$a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/dyf0$a;->f(Ll/dyf0$a;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyf0;->i:Ll/dyf0$a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/dyf0$a;->g(Ll/dyf0$a;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
