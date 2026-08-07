.class public Ll/f5q0$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f5q0;->f()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ll/f5q0;


# direct methods
.method public constructor <init>(Ll/f5q0;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f5q0$c;->b:Ll/f5q0;

    .line 2
    .line 3
    iput-wide p2, p0, Ll/f5q0$c;->a:J

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/f5q0$c;->b:Ll/f5q0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/f5q0;->O(Ll/f5q0;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/f5q0$c;->b:Ll/f5q0;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-static {v0, p0}, Ll/f5q0;->R(Ll/f5q0;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-wide v1, p0, Ll/f5q0$c;->a:J

    .line 17
    .line 18
    invoke-static {v0, v1, v2}, Ll/f5q0;->Q(Ll/f5q0;J)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/f5q0$c;->b:Ll/f5q0;

    .line 22
    .line 23
    invoke-static {p1}, Ll/f5q0;->P(Ll/f5q0;)Ljava/lang/Runnable;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Ll/f5q0$c;->b:Ll/f5q0;

    .line 30
    .line 31
    new-instance v0, Ll/f5q0$c$a;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/f5q0$c$a;-><init>(Ll/f5q0$c;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/f5q0;->S(Ll/f5q0;Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/f5q0$c;->b:Ll/f5q0;

    .line 40
    .line 41
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Ll/f5q0$c;->b:Ll/f5q0;

    .line 46
    .line 47
    invoke-static {p0}, Ll/f5q0;->P(Ll/f5q0;)Ljava/lang/Runnable;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-wide/16 v0, 0x3e8

    .line 52
    .line 53
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method
