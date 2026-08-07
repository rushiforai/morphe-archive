.class public Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VRelative;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/txm;->a(Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/purchase/d;ILl/y20;II)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "I",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;II)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;->a:Lv/VRelative;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    sget v2, Ll/jbc0;->R9:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v2, Ll/jbc0;->Q9:I

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;->d:Lv/VImage;

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    const/4 v3, 0x0

    .line 25
    if-ne p2, p4, :cond_1

    .line 26
    .line 27
    move p4, v2

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move p4, v3

    .line 30
    :goto_1
    invoke-static {v1, p4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;->e:Lv/VImage;

    .line 34
    .line 35
    if-ne p2, p5, :cond_2

    .line 36
    .line 37
    move p2, v2

    .line 38
    goto :goto_2

    .line 39
    :cond_2
    move p2, v3

    .line 40
    :goto_2
    invoke-static {p4, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;->b:Lv/VText;

    .line 44
    .line 45
    const/4 p4, 0x3

    .line 46
    invoke-static {p4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 47
    .line 48
    .line 49
    move-result-object p4

    .line 50
    invoke-virtual {p2, p4, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->P1:Ll/e59;

    .line 64
    .line 65
    iget-object p4, p4, Ll/e59;->S:Ljava/util/List;

    .line 66
    .line 67
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 68
    .line 69
    .line 70
    move-result p4

    .line 71
    if-nez p4, :cond_4

    .line 72
    .line 73
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->P1:Ll/e59;

    .line 76
    .line 77
    iget-object p4, p4, Ll/e59;->S:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 80
    .line 81
    .line 82
    move-result-object p4

    .line 83
    :cond_3
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 84
    .line 85
    .line 86
    move-result p5

    .line 87
    if-eqz p5, :cond_4

    .line 88
    .line 89
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p5

    .line 93
    check-cast p5, Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;

    .line 94
    .line 95
    iget-object v1, p5, Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;->skuTypeVal:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_3

    .line 110
    .line 111
    iget-object p4, p5, Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;->giveCount:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_4
    const-string p4, ""

    .line 115
    .line 116
    :goto_3
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result p5

    .line 120
    if-nez p5, :cond_5

    .line 121
    .line 122
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object p5

    .line 126
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    .line 127
    .line 128
    .line 129
    move-result p5

    .line 130
    if-lez p5, :cond_5

    .line 131
    .line 132
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 133
    .line 134
    .line 135
    move-result-object p5

    .line 136
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->H5:I

    .line 137
    .line 138
    invoke-virtual {p5, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p5

    .line 142
    filled-new-array {p4}, [Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p4

    .line 146
    invoke-static {p5, p4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p4

    .line 150
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;->c:Lv/VText;

    .line 151
    .line 152
    invoke-static {p5, p4}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 153
    .line 154
    .line 155
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;->c:Lv/VText;

    .line 156
    .line 157
    invoke-static {p4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 158
    .line 159
    .line 160
    goto :goto_4

    .line 161
    :cond_5
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;->c:Lv/VText;

    .line 162
    .line 163
    invoke-static {p4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 164
    .line 165
    .line 166
    :goto_4
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;->b:Lv/VText;

    .line 167
    .line 168
    new-instance p5, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    const-string v0, "x"

    .line 171
    .line 172
    invoke-direct {p5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    invoke-virtual {p4, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    .line 184
    .line 185
    new-instance p2, Ll/sxm;

    .line 186
    .line 187
    invoke-direct {p2, p3, p1}, Ll/sxm;-><init>(Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/intlInstantChat/InstantMatchPurchaseSheetItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
