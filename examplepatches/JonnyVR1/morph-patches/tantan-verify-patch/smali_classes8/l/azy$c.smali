.class public Ll/azy$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qrl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/azy;->Q()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/azy;


# direct methods
.method public constructor <init>(Ll/azy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/azy$c;->a:Ll/azy;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/azy$c;->a:Ll/azy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azy;->M()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/lang/Long;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/azy$c;->a:Ll/azy;

    .line 2
    .line 3
    iget-object p0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getCountDownTimer()Landroid/widget/TextView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "00:%02d"

    .line 10
    .line 11
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onError()V
    .locals 0

    .line 1
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/azy$c;->a:Ll/azy;

    .line 2
    .line 3
    iget-object p0, p0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getCountDownTimer()Landroid/widget/TextView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
