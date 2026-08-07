.class public Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/profile/views/FlowView$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->q(Lcom/p1/mobile/putong/core/data/IdealInfo;Ll/n100;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;I)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->f(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->IdealGuideMsg:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 11
    .line 12
    const-string v0, "ideal_guide_all_show_count_"

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->e(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/data/IdealTag;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->e(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    check-cast p2, Lcom/p1/mobile/putong/data/IdealTag;

    .line 41
    .line 42
    iget-boolean p2, p2, Lcom/p1/mobile/putong/data/IdealTag;->hasChecked:Z

    .line 43
    .line 44
    xor-int/lit8 p2, p2, 0x1

    .line 45
    .line 46
    iput-boolean p2, p1, Lcom/p1/mobile/putong/data/IdealTag;->hasChecked:Z

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout$a;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;

    .line 49
    .line 50
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;->g(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealEnquiryLayout;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
