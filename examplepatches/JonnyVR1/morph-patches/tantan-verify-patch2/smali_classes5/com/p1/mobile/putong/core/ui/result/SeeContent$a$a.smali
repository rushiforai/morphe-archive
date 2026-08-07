.class public Lcom/p1/mobile/putong/core/ui/result/SeeContent$a$a;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;->onGlobalLayout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/result/SeeContent$a$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a$a;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/result/SeeContent;->c:Lv/VLinear;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/result/SeeContent;->b(Lcom/p1/mobile/putong/core/ui/result/SeeContent;)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/result/SeeContent;->a(Lcom/p1/mobile/putong/core/ui/result/SeeContent;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/result/SeeContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/SeeContent;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/result/SeeContent;->c:Lv/VLinear;

    .line 16
    .line 17
    new-instance v0, Ll/kge0;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/kge0;-><init>(Lcom/p1/mobile/putong/core/ui/result/SeeContent$a$a;)V

    .line 20
    .line 21
    .line 22
    const-wide/16 v1, 0x64

    .line 23
    .line 24
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
