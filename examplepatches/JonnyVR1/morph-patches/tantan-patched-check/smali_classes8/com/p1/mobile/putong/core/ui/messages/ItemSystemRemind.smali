.class public Lcom/p1/mobile/putong/core/ui/messages/ItemSystemRemind;
.super Lcom/p1/mobile/putong/core/ui/messages/ItemBase;
.source "SourceFile"


# instance fields
.field public v:Lv/VDraweeView;

.field public w:Lcom/p1/mobile/putong/core/ui/VText_Bold;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSystemRemind;->w:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 5
    .line 6
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SystemReminder;->icon:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 42
    .line 43
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSystemRemind;->v:Lv/VDraweeView;

    .line 44
    .line 45
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 46
    .line 47
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 48
    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/SystemReminder;->icon:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p1, p3, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSystemRemind;->v:Lv/VDraweeView;

    .line 55
    .line 56
    const/4 p1, 0x1

    .line 57
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSystemRemind;->v:Lv/VDraweeView;

    .line 62
    .line 63
    const/4 p1, 0x0

    .line 64
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->k1:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSystemRemind;->v:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/edc0;->A4:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSystemRemind;->w:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 23
    .line 24
    return-void
.end method
