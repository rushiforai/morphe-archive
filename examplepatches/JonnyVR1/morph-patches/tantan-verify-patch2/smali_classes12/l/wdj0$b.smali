.class Ll/wdj0$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wdj0;->D0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/wdj0;


# direct methods
.method public constructor <init>(Ll/wdj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wdj0$b;->a:Ll/wdj0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p1, p0, Ll/wdj0$b;->a:Ll/wdj0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/wdj0;->m(Ll/wdj0;)Ll/cn2;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/wdj0$b;->a:Ll/wdj0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/wdj0;->m(Ll/wdj0;)Ll/cn2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Ll/cn2;->setFarNeatAction(Z)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    const-wide/16 p0, 0x64

    .line 20
    .line 21
    invoke-static {p0, p1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
