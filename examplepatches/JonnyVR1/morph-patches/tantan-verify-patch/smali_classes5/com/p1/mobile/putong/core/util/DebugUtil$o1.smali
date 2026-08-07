.class public Lcom/p1/mobile/putong/core/util/DebugUtil$o1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->Fi(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic A(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/z5h0;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/util/DebugUtil$o1;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->U(Lcom/p1/mobile/putong/core/newui/home/b;)V

    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, v0}, Ll/kx80;->m(Landroid/app/Activity;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "\u6807\u9898"

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "xxxx"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "yyyy"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/AppealInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput v1, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 8
    .line 9
    const-string v1, "before"

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Ll/wxf;->e()Ll/wxf;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    new-instance v3, Ll/tgd;

    .line 22
    .line 23
    invoke-direct {v3, p0}, Ll/tgd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2, v3, v0}, Ll/wxf;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Lcom/p1/mobile/putong/core/data/AppealInfo;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "\u6807\u9898"

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "\u6587\u5b57\u5185\u5bb9"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "\u6309\u94ae"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v1, Ll/ugd;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/ugd;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance v0, Ll/vgd;

    .line 47
    .line 48
    invoke-direct {v0}, Ll/vgd;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget p0, Ll/dbc0;->Lq:I

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "\u6807\u9898"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "\u63cf\u8ff0\u6587\u5b57\u63cf\u8ff0\u6587\u5b57"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "\u6309\u94ae"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jek;->u(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic J()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/util/DebugUtil$o1;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->T(Lcom/p1/mobile/putong/core/newui/home/b;)V

    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "\u6807\u9898"

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "\u6309\u94ae"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v1, Ll/pgd;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/pgd;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance v0, Ll/qgd;

    .line 47
    .line 48
    invoke-direct {v0}, Ll/qgd;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget p0, Ll/dbc0;->Lq:I

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "\u6807\u9898"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "\u63cf\u8ff0\u6587\u5b57\u63cf\u8ff0\u6587\u5b57"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "\u6309\u94ae"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v0, "\u6587\u5b57"

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget p0, Ll/dbc0;->Lq:I

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "\u6807\u9898"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "\u63cf\u8ff0\u6587\u5b57\u63cf\u8ff0\u6587\u5b57"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "\u6309\u94ae1"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v0, "\u6309\u94ae2"

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/jl80$a;->g0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v0, "\u6587\u5b57"

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {v0, p0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "\u6309\u94ae"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v1, Ll/zgd;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/zgd;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v0, Ll/ahd;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/ahd;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Ll/tcz;->F(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->a:Ll/vxd0;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->b:Ll/byd0;

    .line 17
    .line 18
    const-wide/16 v1, 0x0

    .line 19
    .line 20
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/baj;->o()V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const/4 v1, 0x0

    .line 43
    const-string v2, "swipe_card"

    .line 44
    .line 45
    invoke-static {v0, p0, v1, v2}, Ll/baj;->a0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 6

    .line 1
    new-instance v0, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    const/4 v2, -0x2

    .line 13
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    const/16 v1, 0x10

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 22
    .line 23
    .line 24
    const/high16 v1, 0x41400000    # 12.0f

    .line 25
    .line 26
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    const/high16 v5, 0x41a00000    # 20.0f

    .line 35
    .line 36
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v3, v4, v5, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 45
    .line 46
    .line 47
    new-instance v1, Lv/VIcon;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-direct {v1, v3}, Lv/VIcon;-><init>(Landroid/content/Context;)V

    .line 54
    .line 55
    .line 56
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 57
    .line 58
    const/high16 v4, 0x41e00000    # 28.0f

    .line 59
    .line 60
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 69
    .line 70
    .line 71
    const/high16 v4, 0x41000000    # 8.0f

    .line 72
    .line 73
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 78
    .line 79
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    sget v3, Ll/dbc0;->tm:I

    .line 83
    .line 84
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 88
    .line 89
    .line 90
    new-instance v1, Lv/VText;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-direct {v1, v3}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 97
    .line 98
    .line 99
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 100
    .line 101
    invoke-direct {v3, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    sget v3, Ll/c9c0;->i:I

    .line 116
    .line 117
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 122
    .line 123
    .line 124
    const/high16 v2, 0x41700000    # 15.0f

    .line 125
    .line 126
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 127
    .line 128
    .line 129
    const/4 v2, 0x3

    .line 130
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    const/4 v3, 0x1

    .line 135
    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 136
    .line 137
    .line 138
    const-string v2, "\u8d44\u6599\u5df2\u63d0\u4ea4\uff0c\u5f85\u5ba1\u6838\u901a\u8fc7\u540e\u751f\u6548"

    .line 139
    .line 140
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 144
    .line 145
    .line 146
    new-instance v1, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 147
    .line 148
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-direct {v1, p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    sget-object v0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->TEST:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method

.method public static synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->q2()Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/16 v1, 0x312

    .line 10
    .line 11
    invoke-static {v0, p0, v1}, Ll/f5g;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/ogd;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ogd;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {p0, v0, v1}, Ll/iz40;->E(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {v0, p0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "\u6309\u94ae"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v1, Ll/rgd;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/rgd;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v0, Ll/sgd;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/sgd;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {v0, p0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "\u6587\u5b57\u5185\u5bb9"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "\u6309\u94ae"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v1, Ll/lgd;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/lgd;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v0, Ll/mgd;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/mgd;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "XXXX"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "text"

    .line 11
    .line 12
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 17
    .line 18
    const-string v1, "1"

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1, v0}, Ll/rum;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0, v0}, Ll/ibb;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget p0, Ll/dbc0;->Lq:I

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "\u6807\u9898"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "\u6309\u94ae"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "\u6807\u9898"

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587\u5b57\u6587"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "\u6309\u94ae"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 3

    .line 1
    new-instance v0, Ll/uyf;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/uyf;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/dkb;->Z7()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/4 v1, 0x0

    .line 19
    const-string v2, "p_suggest_users_home_view"

    .line 20
    .line 21
    invoke-virtual {v0, p0, v1, v2}, Ll/uyf;->C(ZZLjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ll/uyf;->show()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {v0, p0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "\u6309\u94ae"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v1, Ll/bhd;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/bhd;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v0, Ll/chd;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/chd;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Ll/upm;->f0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget p0, Ll/dbc0;->Lq:I

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "\u6807\u9898"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "\u63cf\u8ff0\u6587\u5b57\u63cf\u8ff0\u6587\u5b57"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "\u6211\u540c\u610f\u817e\u8baf\u3001\u963f\u91cc\u3001\u964c\u964c\u5c06\u91c7\u96c6\u6211\u7684\u9762\u90e8\u4fe1\u606f\u5e76\u4e0e\u5934\u50cf\u6bd4\u5bf9\uff0c\u8be6\u89c1\u300a\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1\u534f\u8bae\u300b"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/jl80$a;->k0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v0, "\u6309\u94ae1"

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v0, "\u6587\u5b57"

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/util/DebugUtil$o1;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->S(Lcom/p1/mobile/putong/core/newui/home/b;)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {v0, p0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9\u6587\u5b57\u5185\u5bb9"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "\u6309\u94ae"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v1, Ll/wgd;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/wgd;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v0, Ll/xgd;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/xgd;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final synthetic S(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1$a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$o1$a;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$o1;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/qtk;->d1(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1$b;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$o1$b;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$o1;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Lcom/p1/mobile/putong/core/util/DebugUtil$o1$c;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$o1$c;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$o1;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->c2(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)Ll/jl80;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic U(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1$d;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$o1$d;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$o1;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/qtk;->M0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public call()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 9
    .line 10
    new-instance v2, Ll/rfd;

    .line 11
    .line 12
    invoke-direct {v2, v1}, Ll/rfd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "\u65e0\u6807\u98981"

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 27
    .line 28
    new-instance v2, Ll/tfd;

    .line 29
    .line 30
    invoke-direct {v2, v1}, Ll/tfd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 31
    .line 32
    .line 33
    const-string v1, "\u65e0\u6807\u98982"

    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 45
    .line 46
    new-instance v2, Ll/dgd;

    .line 47
    .line 48
    invoke-direct {v2, v1}, Ll/dgd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 49
    .line 50
    .line 51
    const-string v1, "\u65e0\u6807\u98983  3\u884c"

    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 63
    .line 64
    new-instance v2, Ll/egd;

    .line 65
    .line 66
    invoke-direct {v2, v1}, Ll/egd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 67
    .line 68
    .line 69
    const-string v1, "\u65e0\u6807\u98983  4\u884c"

    .line 70
    .line 71
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 81
    .line 82
    new-instance v2, Ll/fgd;

    .line 83
    .line 84
    invoke-direct {v2, v1}, Ll/fgd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 85
    .line 86
    .line 87
    const-string v1, "\u65e0\u6807\u98984 \u8d85\u51fa4\u884c"

    .line 88
    .line 89
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 99
    .line 100
    new-instance v2, Ll/ggd;

    .line 101
    .line 102
    invoke-direct {v2, v1}, Ll/ggd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 103
    .line 104
    .line 105
    const-string v1, "\u6709\u6807\u98981 "

    .line 106
    .line 107
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 117
    .line 118
    new-instance v2, Ll/hgd;

    .line 119
    .line 120
    invoke-direct {v2, v1}, Ll/hgd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 121
    .line 122
    .line 123
    const-string v1, "\u6709\u6807\u98982 "

    .line 124
    .line 125
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 135
    .line 136
    new-instance v2, Ll/igd;

    .line 137
    .line 138
    invoke-direct {v2, v1}, Ll/igd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 139
    .line 140
    .line 141
    const-string v1, "PopupDialog 1 "

    .line 142
    .line 143
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 153
    .line 154
    new-instance v2, Ll/jgd;

    .line 155
    .line 156
    invoke-direct {v2, v1}, Ll/jgd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 157
    .line 158
    .line 159
    const-string v1, "PopupDialog 2 "

    .line 160
    .line 161
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 171
    .line 172
    new-instance v2, Ll/kgd;

    .line 173
    .line 174
    invoke-direct {v2, v1}, Ll/kgd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 175
    .line 176
    .line 177
    const-string v1, "PopupDialog 3 "

    .line 178
    .line 179
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 187
    .line 188
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 189
    .line 190
    new-instance v2, Ll/cgd;

    .line 191
    .line 192
    invoke-direct {v2, v1}, Ll/cgd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 193
    .line 194
    .line 195
    const-string v1, "PopupDialog 4 "

    .line 196
    .line 197
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 205
    .line 206
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 207
    .line 208
    new-instance v2, Ll/ngd;

    .line 209
    .line 210
    invoke-direct {v2, v1}, Ll/ngd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 211
    .line 212
    .line 213
    const-string v1, "PopupDialog 5 "

    .line 214
    .line 215
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 223
    .line 224
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 225
    .line 226
    new-instance v2, Ll/ygd;

    .line 227
    .line 228
    invoke-direct {v2, v1}, Ll/ygd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 229
    .line 230
    .line 231
    const-string v1, "PopupDialog 6 "

    .line 232
    .line 233
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 241
    .line 242
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 243
    .line 244
    new-instance v2, Ll/dhd;

    .line 245
    .line 246
    invoke-direct {v2, v1}, Ll/dhd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 247
    .line 248
    .line 249
    const-string v1, "PopupDialog 7 "

    .line 250
    .line 251
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 259
    .line 260
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 261
    .line 262
    new-instance v2, Ll/ehd;

    .line 263
    .line 264
    invoke-direct {v2, v1}, Ll/ehd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 265
    .line 266
    .line 267
    const-string v1, "PopupDialog \u534f\u8bae\u66f4\u65b0\u901a\u77e5 "

    .line 268
    .line 269
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 277
    .line 278
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 279
    .line 280
    new-instance v2, Ll/fhd;

    .line 281
    .line 282
    invoke-direct {v2, v1}, Ll/fhd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 283
    .line 284
    .line 285
    const-string v1, "PopupDialog \u529f\u80fd\u5168\u65b0\u5347\u7ea7 "

    .line 286
    .line 287
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 295
    .line 296
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 297
    .line 298
    new-instance v2, Ll/ghd;

    .line 299
    .line 300
    invoke-direct {v2, p0, v1}, Ll/ghd;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$o1;Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 301
    .line 302
    .line 303
    const-string v1, "PopupDialog \u5206\u4eab\u65b0\u529f\u80fd 1 "

    .line 304
    .line 305
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 313
    .line 314
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 315
    .line 316
    new-instance v2, Ll/hhd;

    .line 317
    .line 318
    invoke-direct {v2, p0, v1}, Ll/hhd;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$o1;Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 319
    .line 320
    .line 321
    const-string v1, "PopupDialog \u5206\u4eab\u65b0\u529f\u80fd 2 "

    .line 322
    .line 323
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 331
    .line 332
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 333
    .line 334
    new-instance v2, Ll/ihd;

    .line 335
    .line 336
    invoke-direct {v2, v1}, Ll/ihd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 337
    .line 338
    .line 339
    const-string v1, "PopupDialog \u522b\u9519\u8fc7TA\u7684\u6d88\u606f "

    .line 340
    .line 341
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 342
    .line 343
    .line 344
    move-result-object v1

    .line 345
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 349
    .line 350
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 351
    .line 352
    new-instance v2, Ll/sfd;

    .line 353
    .line 354
    invoke-direct {v2, p0, v1}, Ll/sfd;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$o1;Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 355
    .line 356
    .line 357
    const-string v1, "PopupDialog \u4f60\u79bb\u5f00\u540e\u4efb "

    .line 358
    .line 359
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 360
    .line 361
    .line 362
    move-result-object v1

    .line 363
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 364
    .line 365
    .line 366
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 367
    .line 368
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 369
    .line 370
    new-instance v2, Ll/ufd;

    .line 371
    .line 372
    invoke-direct {v2, v1}, Ll/ufd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 373
    .line 374
    .line 375
    const-string v1, "PopupDialog \u771f\u4eba\u5b9e\u540d\u8ba4\u8bc1 \u521b\u5efa\u7fa4 "

    .line 376
    .line 377
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 378
    .line 379
    .line 380
    move-result-object v1

    .line 381
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 385
    .line 386
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 387
    .line 388
    new-instance v2, Ll/vfd;

    .line 389
    .line 390
    invoke-direct {v2, v1}, Ll/vfd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 391
    .line 392
    .line 393
    const-string v1, "PopupDialog  \u522b\u7740\u6025\uff0c\u7b49%s\u56de\u590d\u540e\u518d\u7ee7\u7eed\u804a\u5929 "

    .line 394
    .line 395
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 396
    .line 397
    .line 398
    move-result-object v1

    .line 399
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 400
    .line 401
    .line 402
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 403
    .line 404
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 405
    .line 406
    new-instance v2, Ll/wfd;

    .line 407
    .line 408
    invoke-direct {v2, v1}, Ll/wfd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 409
    .line 410
    .line 411
    const-string v1, "Dialog \u5f15\u5bfc\u4e0a\u4f20\u751f\u6d3b\u7167"

    .line 412
    .line 413
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 414
    .line 415
    .line 416
    move-result-object v1

    .line 417
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 418
    .line 419
    .line 420
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 421
    .line 422
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 423
    .line 424
    new-instance v2, Ll/xfd;

    .line 425
    .line 426
    invoke-direct {v2, v1}, Ll/xfd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 427
    .line 428
    .line 429
    const-string v1, "Dialog \u65b0\u4ea4\u53cb\u76ee\u7684 \u65b0\u5f39\u6846"

    .line 430
    .line 431
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 432
    .line 433
    .line 434
    move-result-object v1

    .line 435
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 439
    .line 440
    new-instance v1, Ll/pf60;

    .line 441
    .line 442
    iget-object v2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 443
    .line 444
    new-instance v3, Ll/yfd;

    .line 445
    .line 446
    invoke-direct {v3, v2}, Ll/yfd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 447
    .line 448
    .line 449
    const-string v2, "Dialog \u7f51\u56feFake\u5f39\u7a97"

    .line 450
    .line 451
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 452
    .line 453
    .line 454
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 455
    .line 456
    .line 457
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 458
    .line 459
    new-instance v1, Ll/pf60;

    .line 460
    .line 461
    iget-object v2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 462
    .line 463
    new-instance v3, Ll/zfd;

    .line 464
    .line 465
    invoke-direct {v3, v2}, Ll/zfd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 466
    .line 467
    .line 468
    const-string v2, "push \u8d85\u7ea7\u559c\u6b22"

    .line 469
    .line 470
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 471
    .line 472
    .line 473
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 474
    .line 475
    .line 476
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 477
    .line 478
    new-instance v1, Ll/pf60;

    .line 479
    .line 480
    iget-object v2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 481
    .line 482
    new-instance v3, Ll/agd;

    .line 483
    .line 484
    invoke-direct {v3, v2}, Ll/agd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 485
    .line 486
    .line 487
    const-string v2, "push \u6d88\u606f\u5df2\u7ecf\u53d1\u9001"

    .line 488
    .line 489
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 490
    .line 491
    .line 492
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 493
    .line 494
    .line 495
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 496
    .line 497
    new-instance v1, Ll/pf60;

    .line 498
    .line 499
    iget-object v2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 500
    .line 501
    new-instance v3, Ll/bgd;

    .line 502
    .line 503
    invoke-direct {v3, v2}, Ll/bgd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 504
    .line 505
    .line 506
    const-string v2, "\u8d44\u6599\u5df2\u7ecf\u63d0\u4ea4"

    .line 507
    .line 508
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 509
    .line 510
    .line 511
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 512
    .line 513
    .line 514
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 515
    .line 516
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 517
    .line 518
    .line 519
    move-result-object v0

    .line 520
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->a:Ljava/util/ArrayList;

    .line 521
    .line 522
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 523
    .line 524
    .line 525
    return-void
.end method
