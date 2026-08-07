.class public Ll/f0b0;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/adc0;->bc:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->a:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;

    .line 10
    .line 11
    sget v0, Ll/adc0;->cc:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->b:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;

    .line 20
    .line 21
    return-void
.end method
