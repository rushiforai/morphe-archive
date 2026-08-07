.class public Lcom/p1/mobile/putong/core/ui/messages/ItemContactReject;
.super Lcom/p1/mobile/putong/core/ui/messages/ItemBase;
.source "SourceFile"


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
    sget p1, Ll/edc0;->A4:I

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
