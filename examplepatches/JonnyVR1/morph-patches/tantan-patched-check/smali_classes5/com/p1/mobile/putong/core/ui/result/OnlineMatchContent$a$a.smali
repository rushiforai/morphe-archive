.class public Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a$a;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;->onGlobalLayout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a$a;->a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a$a;->a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->b(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a$a;->a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->b:Lv/VImage;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a$a;->a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->c(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;)Landroid/animation/Animator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
