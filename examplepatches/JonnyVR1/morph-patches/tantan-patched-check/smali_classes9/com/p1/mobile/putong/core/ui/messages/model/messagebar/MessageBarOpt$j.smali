.class public Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$j;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->l(ILcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;D)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:D

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;D)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$j;->b:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$j;->a:D

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/gt0$j;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$j;->a:D

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->b(D)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, "\u00b0C"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$j;->b:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt$j;->b:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->s:Lv/VText;

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
