.class public Lcom/p1/mobile/putong/core/ui/messages/ItemCenterNotice;
.super Lcom/p1/mobile/putong/core/ui/messages/ItemBase;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public v:Landroid/widget/TextView;


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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCenterNotice;->v:Landroid/widget/TextView;

    .line 5
    .line 6
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCenterNotice;->v:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    sget p3, Ll/g9c0;->H:I

    .line 18
    .line 19
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCenterNotice;->v:Landroid/widget/TextView;

    .line 27
    .line 28
    const/4 p2, 0x0

    .line 29
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    instance-of p1, p1, Ll/yxz;

    .line 45
    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Ll/yxz;

    .line 61
    .line 62
    iget-boolean p1, p1, Ll/yxz;->M1:Z

    .line 63
    .line 64
    if-eqz p1, :cond_0

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCenterNotice;->v:Landroid/widget/TextView;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    sget p4, Ll/ibc0;->R4:I

    .line 73
    .line 74
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCenterNotice;->v:Landroid/widget/TextView;

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    sget p4, Ll/g9c0;->a0:I

    .line 88
    .line 89
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getColor(I)I

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 94
    .line 95
    .line 96
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-interface {p1}, Ll/r97;->G1()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_1

    .line 109
    .line 110
    const/high16 p1, 0x42680000    # 58.0f

    .line 111
    .line 112
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 113
    .line 114
    .line 115
    move-result p3

    .line 116
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    sget p4, Ll/qa00;->j:I

    .line 121
    .line 122
    invoke-virtual {p0, p3, p2, p1, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 123
    .line 124
    .line 125
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->A4:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/TextView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCenterNotice;->v:Landroid/widget/TextView;

    .line 13
    .line 14
    return-void
.end method
