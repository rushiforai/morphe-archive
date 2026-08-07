.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VDraweeView;

.field public e:Lv/VImage;

.field public f:Lv/VLinear;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/TextView;

.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->i:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 9
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->i:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->i:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public U(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V
    .locals 0

    .line 1
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string p3, "moment_like"

    .line 4
    .line 5
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p1, "\u8d5e\u4e86\u52a8\u6001"

    .line 12
    .line 13
    iput-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

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
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 13
    .line 14
    sget v0, Ll/edc0;->o2:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 23
    .line 24
    sget v0, Ll/edc0;->B0:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/FrameLayout;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->c:Landroid/widget/FrameLayout;

    .line 33
    .line 34
    sget v0, Ll/edc0;->A0:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VDraweeView;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->d:Lv/VDraweeView;

    .line 43
    .line 44
    sget v0, Ll/edc0;->C0:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VImage;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->e:Lv/VImage;

    .line 53
    .line 54
    sget v0, Ll/edc0;->y0:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VLinear;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->f:Lv/VLinear;

    .line 63
    .line 64
    sget v0, Ll/edc0;->z0:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Landroid/widget/TextView;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->g:Landroid/widget/TextView;

    .line 73
    .line 74
    sget v0, Ll/edc0;->D0:I

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Landroid/widget/TextView;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->h:Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_0

    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->g:Landroid/widget/TextView;

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    sget v2, Ll/g9c0;->g:I

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->h:Landroid/widget/TextView;

    .line 114
    .line 115
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    sget v2, Ll/g9c0;->i:I

    .line 120
    .line 121
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageDynamicComments;->e:Lv/VImage;

    .line 129
    .line 130
    sget v0, Ll/ibc0;->l1:I

    .line 131
    .line 132
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 133
    .line 134
    .line 135
    :cond_0
    return-void
.end method
