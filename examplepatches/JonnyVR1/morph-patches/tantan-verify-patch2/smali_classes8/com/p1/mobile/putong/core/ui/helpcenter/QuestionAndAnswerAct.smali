.class public Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/crl;


# instance fields
.field public c:Ll/cwb0;

.field public d:Ll/ewb0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "faq"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "title"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;->d:Ll/ewb0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ewb0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/cwb0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/cwb0;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;->c:Ll/cwb0;

    .line 10
    .line 11
    new-instance v0, Ll/ewb0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/ewb0;-><init>(Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;->d:Ll/ewb0;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;->c:Ll/cwb0;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;->c:Ll/cwb0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/cwb0;->f0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;->c:Ll/cwb0;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "faq"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "title"

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p1, v0, v1}, Ll/cwb0;->i0(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->checkGradientColors()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public trackedArgs()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;->c:Ll/cwb0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cwb0;->j0()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
