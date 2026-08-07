.class public Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/v3m;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;

.field public b:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/pcj;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->a:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->a:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;

    .line 10
    .line 11
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->H(Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/pcj;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->b:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;

    .line 16
    .line 17
    move-object v1, p1

    .line 18
    move v2, p2

    .line 19
    move-object v3, p3

    .line 20
    move-object v4, p4

    .line 21
    move-object v5, p5

    .line 22
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->H(Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/pcj;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public I(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->a:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->a:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/v3m;->I(Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->b:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->I(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/f0b0;->a(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getEnvelopSayHai()Landroid/widget/TextView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->a:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->a:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->getEnvelopSayHai()Landroid/widget/TextView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->b:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->getEnvelopSayHai()Landroid/widget/TextView;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/pcj;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->a:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->a:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;

    .line 10
    .line 11
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/pcj;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->b:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;

    .line 16
    .line 17
    move-object v1, p1

    .line 18
    move-object v2, p2

    .line 19
    move-object v3, p3

    .line 20
    move-object v4, p4

    .line 21
    move-object v5, p5

    .line 22
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/pcj;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
