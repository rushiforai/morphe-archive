.class public Ll/f5q0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f5q0;->c(Z)Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic b:Ll/f5q0;


# direct methods
.method public constructor <init>(Ll/f5q0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f5q0$a;->b:Ll/f5q0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/f5q0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f5q0$a;->d()V

    return-void
.end method

.method public static synthetic b(Ll/f5q0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f5q0$a;->c()V

    return-void
.end method


# virtual methods
.method public final synthetic c()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/f5q0$a;->b:Ll/f5q0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-wide/16 v1, 0x12c

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic d()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/f5q0$a;->b:Ll/f5q0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/uxw;->d(Landroid/app/Activity;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/f5q0$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/f5q0$a;->b:Ll/f5q0;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/account/R$string;->O:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/f5q0$a;->b:Ll/f5q0;

    .line 22
    .line 23
    invoke-interface {v1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/a9c0;->q:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->o0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget v1, Lcom/p1/mobile/putong/account/R$string;->F2:I

    .line 38
    .line 39
    new-instance v2, Ll/d5q0;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/d5q0;-><init>(Ll/f5q0$a;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Lcom/p1/mobile/putong/account/R$string;->f:I

    .line 49
    .line 50
    new-instance v2, Ll/e5q0;

    .line 51
    .line 52
    invoke-direct {v2, p0}, Ll/e5q0;-><init>(Ll/f5q0$a;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Ll/f5q0$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 69
    .line 70
    :cond_0
    iget-object p0, p0, Ll/f5q0$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 73
    .line 74
    .line 75
    return-void
.end method
