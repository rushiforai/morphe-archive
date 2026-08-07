.class public Ll/w1e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/w1e$b;
    }
.end annotation


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

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/common/R$string;->d:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {p0}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ll/v1e;

    .line 24
    .line 25
    invoke-direct {v0, p1}, Ll/v1e;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;
    .locals 2

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    new-instance v1, Ll/w1e$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/w1e$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1, p1}, Ll/l4g0;-><init>(Ll/ur2;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static d(Landroid/content/Context;)Ll/w1e$b;
    .locals 1

    .line 1
    new-instance v0, Ll/w1e$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/w1e$b;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static e(Ll/l4g0;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static f(Ll/l4g0;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method
