.class public Ll/dgm;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    invoke-virtual {v0, p0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->c4:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->d4:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->e4:I

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v0, Ll/cgm;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ll/cgm;-><init>(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 43
    .line 44
    .line 45
    return-void
.end method
