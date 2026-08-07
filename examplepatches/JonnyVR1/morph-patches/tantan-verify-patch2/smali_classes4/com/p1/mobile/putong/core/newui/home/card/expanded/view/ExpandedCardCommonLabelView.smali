.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;,
        Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;,
        Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;,
        Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

.field public b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

.field public c:I

.field public d:I

.field public e:I

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;",
            ">;"
        }
    .end annotation
.end field

.field public g:Landroid/text/TextPaint;

.field public h:Landroid/graphics/Paint;

.field public i:Landroid/graphics/Rect;

.field public j:Landroid/graphics/PorterDuffXfermode;

.field public k:F

.field public l:F

.field public m:I

.field public n:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;->INIT:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->c:I

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 12
    .line 13
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 14
    .line 15
    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->j:Landroid/graphics/PorterDuffXfermode;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 22
    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->m:I

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->n:I

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->c()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 35
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;->INIT:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    const/4 p1, -0x1

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->c:I

    .line 38
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->j:Landroid/graphics/PorterDuffXfermode;

    const/4 p1, 0x0

    .line 39
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 40
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    const/4 p1, 0x0

    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->m:I

    const/4 p1, 0x1

    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->n:I

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->c()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;->INIT:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    const/4 p1, -0x1

    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->c:I

    .line 47
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->j:Landroid/graphics/PorterDuffXfermode;

    const/4 p1, 0x0

    .line 48
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 49
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    const/4 p1, 0x0

    .line 50
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->m:I

    const/4 p1, 0x1

    .line 51
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->n:I

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->c()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;I)V
    .locals 9

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->g:Landroid/text/TextPaint;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->o()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->d(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 39
    .line 40
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    add-int/2addr v2, v3

    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 46
    .line 47
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->e(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    add-int/2addr v2, v3

    .line 52
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 53
    .line 54
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    add-int/2addr v2, v3

    .line 59
    int-to-float v2, v2

    .line 60
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 61
    .line 62
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 63
    .line 64
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->d(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    int-to-float v4, v4

    .line 69
    add-float/2addr v3, v4

    .line 70
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 71
    .line 72
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    int-to-float v4, v4

    .line 77
    add-float/2addr v3, v4

    .line 78
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 79
    .line 80
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->e(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    int-to-float v4, v4

    .line 85
    add-float/2addr v3, v4

    .line 86
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;F)V

    .line 87
    .line 88
    .line 89
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    .line 90
    .line 91
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 92
    .line 93
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)F

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    add-float/2addr v3, v4

    .line 98
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;F)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 107
    .line 108
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    add-int/2addr v2, v3

    .line 113
    int-to-float v2, v2

    .line 114
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 115
    .line 116
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 117
    .line 118
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 119
    .line 120
    .line 121
    move-result v4

    .line 122
    int-to-float v4, v4

    .line 123
    add-float/2addr v3, v4

    .line 124
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;F)V

    .line 125
    .line 126
    .line 127
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    .line 128
    .line 129
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 130
    .line 131
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)F

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    add-float/2addr v3, v4

    .line 136
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;F)V

    .line 137
    .line 138
    .line 139
    :goto_0
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 140
    .line 141
    add-float v4, v3, v0

    .line 142
    .line 143
    add-float/2addr v4, v2

    .line 144
    int-to-float v5, p2

    .line 145
    cmpg-float v4, v4, v5

    .line 146
    .line 147
    if-gez v4, :cond_2

    .line 148
    .line 149
    invoke-virtual {p0, p1, v0, v2, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;FFI)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_2
    const/4 v4, 0x0

    .line 154
    cmpl-float v3, v3, v4

    .line 155
    .line 156
    if-nez v3, :cond_5

    .line 157
    .line 158
    move v3, v1

    .line 159
    :goto_1
    add-int/lit8 v6, v3, 0x1

    .line 160
    .line 161
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v7

    .line 165
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 166
    .line 167
    .line 168
    move-result v7

    .line 169
    const-string v8, "..."

    .line 170
    .line 171
    if-le v6, v7, :cond_3

    .line 172
    .line 173
    move v0, v4

    .line 174
    goto :goto_2

    .line 175
    :cond_3
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->g:Landroid/text/TextPaint;

    .line 176
    .line 177
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v7

    .line 181
    invoke-virtual {v7, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v7

    .line 185
    invoke-virtual {v7, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v7

    .line 189
    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 190
    .line 191
    .line 192
    move-result v4

    .line 193
    iget v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 194
    .line 195
    add-float/2addr v7, v4

    .line 196
    add-float/2addr v7, v2

    .line 197
    cmpg-float v7, v7, v5

    .line 198
    .line 199
    if-ltz v7, :cond_4

    .line 200
    .line 201
    :goto_2
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 210
    .line 211
    .line 212
    move-result v5

    .line 213
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    invoke-virtual {v4, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    invoke-virtual {v1, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {p0, p1, v0, v2, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;FFI)V

    .line 229
    .line 230
    .line 231
    return-void

    .line 232
    :cond_4
    move v3, v4

    .line 233
    move v4, v0

    .line 234
    move v0, v3

    .line 235
    move v3, v6

    .line 236
    goto :goto_1

    .line 237
    :cond_5
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->n:I

    .line 238
    .line 239
    add-int/lit8 v0, v0, 0x1

    .line 240
    .line 241
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->n:I

    .line 242
    .line 243
    iput v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 244
    .line 245
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    .line 246
    .line 247
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 248
    .line 249
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    int-to-float v1, v1

    .line 254
    add-float/2addr v0, v1

    .line 255
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 256
    .line 257
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    int-to-float v1, v1

    .line 262
    add-float/2addr v0, v1

    .line 263
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    .line 264
    .line 265
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->n:I

    .line 266
    .line 267
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 268
    .line 269
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    if-gt v0, v1, :cond_6

    .line 274
    .line 275
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;I)V

    .line 276
    .line 277
    .line 278
    :cond_6
    return-void
.end method

.method public final b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;FFI)V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 10
    .line 11
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    .line 12
    .line 13
    add-float/2addr p2, v2

    .line 14
    add-float/2addr p2, p3

    .line 15
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 16
    .line 17
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    int-to-float v4, v4

    .line 22
    add-float/2addr v4, v3

    .line 23
    invoke-virtual {v1, v2, v3, p2, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->o()Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->d(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 39
    .line 40
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->d(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    int-to-float v2, v2

    .line 45
    add-float/2addr v1, v2

    .line 46
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    .line 47
    .line 48
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 49
    .line 50
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    int-to-float v3, v3

    .line 55
    const/high16 v4, 0x40000000    # 2.0f

    .line 56
    .line 57
    div-float/2addr v3, v4

    .line 58
    add-float/2addr v2, v3

    .line 59
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 60
    .line 61
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    int-to-float v3, v3

    .line 66
    div-float/2addr v3, v4

    .line 67
    sub-float/2addr v2, v3

    .line 68
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 69
    .line 70
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 71
    .line 72
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->d(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    int-to-float v5, v5

    .line 77
    add-float/2addr v3, v5

    .line 78
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 79
    .line 80
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    int-to-float v5, v5

    .line 85
    add-float/2addr v3, v5

    .line 86
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    .line 87
    .line 88
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 89
    .line 90
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    int-to-float v6, v6

    .line 95
    div-float/2addr v6, v4

    .line 96
    add-float/2addr v5, v6

    .line 97
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 98
    .line 99
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    int-to-float v6, v6

    .line 104
    div-float/2addr v6, v4

    .line 105
    add-float/2addr v5, v6

    .line 106
    invoke-virtual {p2, v1, v2, v3, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 107
    .line 108
    .line 109
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iget p1, p1, Landroid/graphics/RectF;->right:F

    .line 114
    .line 115
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 116
    .line 117
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    int-to-float p2, p2

    .line 122
    add-float/2addr p1, p2

    .line 123
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 124
    .line 125
    add-float/2addr p1, p3

    .line 126
    int-to-float p2, p4

    .line 127
    cmpl-float p1, p1, p2

    .line 128
    .line 129
    if-ltz p1, :cond_1

    .line 130
    .line 131
    const/4 p1, 0x0

    .line 132
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 133
    .line 134
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    .line 135
    .line 136
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 137
    .line 138
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    int-to-float p2, p2

    .line 143
    add-float/2addr p1, p2

    .line 144
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 145
    .line 146
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    int-to-float p2, p2

    .line 151
    add-float/2addr p1, p2

    .line 152
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    .line 153
    .line 154
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->n:I

    .line 155
    .line 156
    add-int/2addr p1, v0

    .line 157
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->n:I

    .line 158
    .line 159
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->m:I

    .line 160
    .line 161
    add-int/2addr p1, v0

    .line 162
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->m:I

    .line 163
    .line 164
    return-void
.end method

.method public final c()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;-><init>(Ll/smf;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->f:Ljava/util/List;

    .line 15
    .line 16
    new-instance v0, Landroid/text/TextPaint;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->g:Landroid/text/TextPaint;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->g:Landroid/text/TextPaint;

    .line 28
    .line 29
    const/4 v2, 0x3

    .line 30
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 35
    .line 36
    .line 37
    new-instance v0, Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Landroid/graphics/Rect;

    .line 48
    .line 49
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->i:Landroid/graphics/Rect;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public d(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 21
    .line 22
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;

    .line 23
    .line 24
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 25
    .line 26
    iget v3, v0, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;-><init>(Ljava/lang/String;ILandroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->p(Z)Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->f:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;->INIT:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->getCurrentStyle()Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, -0x1526

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->D(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->C(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 11
    .line 12
    .line 13
    const v1, -0x9090a

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->w(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 17
    .line 18
    .line 19
    const/high16 v1, -0x34000000    # -3.3554432E7f

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 22
    .line 23
    .line 24
    const v1, 0x7fffffff

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->A(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->z(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 31
    .line 32
    .line 33
    sget v1, Ll/qa00;->j:I

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->B(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->x(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 39
    .line 40
    .line 41
    sget v1, Ll/qa00;->h:I

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->y(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->setLabelStyle(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->getCurrentStyle()Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, -0x1526

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->D(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->C(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 11
    .line 12
    .line 13
    const v1, -0x9090a

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->w(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 17
    .line 18
    .line 19
    const/high16 v1, -0x34000000    # -3.3554432E7f

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 22
    .line 23
    .line 24
    const v1, 0x7fffffff

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->A(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->z(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 31
    .line 32
    .line 33
    sget v1, Ll/qa00;->j:I

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->B(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->x(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 39
    .line 40
    .line 41
    sget v1, Ll/qa00;->h:I

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->y(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 44
    .line 45
    .line 46
    sget v1, Ll/qa00;->n:I

    .line 47
    .line 48
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->G(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->K(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->setLabelStyle(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final g()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-eqz v1, :cond_2

    .line 7
    .line 8
    new-instance v1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->f:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;

    .line 30
    .line 31
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->g(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_0

    .line 36
    .line 37
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    throw v0

    .line 58
    :cond_2
    return-void
.end method

.method public getCurrentStyle()Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->M()Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final h()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->g:Landroid/text/TextPaint;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->t(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->g:Landroid/text/TextPaint;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->q(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    int-to-float v1, v1

    .line 31
    const/high16 v2, 0x40000000    # 2.0f

    .line 32
    .line 33
    div-float/2addr v1, v2

    .line 34
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->g:Landroid/text/TextPaint;

    .line 35
    .line 36
    invoke-virtual {v3}, Landroid/graphics/Paint;->ascent()F

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->g:Landroid/text/TextPaint;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/graphics/Paint;->descent()F

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    add-float/2addr v3, p0

    .line 47
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    div-float/2addr p0, v2

    .line 52
    add-float/2addr v1, p0

    .line 53
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->u(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;F)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;->MEASURED:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    .line 7
    .line 8
    if-ne v0, v1, :cond_5

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    int-to-float v4, v0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v5, v0

    .line 20
    const/4 v6, 0x0

    .line 21
    const/16 v7, 0x1f

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    move-object v1, p1

    .line 26
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->f:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_4

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;

    .line 53
    .line 54
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->g(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-eqz v4, :cond_0

    .line 59
    .line 60
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Z

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    if-eqz v4, :cond_2

    .line 65
    .line 66
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 67
    .line 68
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->N()Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-eqz v4, :cond_1

    .line 73
    .line 74
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 75
    .line 76
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)Landroid/graphics/Bitmap;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    if-eqz v4, :cond_1

    .line 81
    .line 82
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 83
    .line 84
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)Landroid/graphics/Bitmap;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    if-nez v4, :cond_1

    .line 93
    .line 94
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 95
    .line 96
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 97
    .line 98
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->o(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 103
    .line 104
    .line 105
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 110
    .line 111
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    int-to-float v5, v5

    .line 116
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 117
    .line 118
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    int-to-float v6, v6

    .line 123
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 124
    .line 125
    invoke-virtual {v1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 126
    .line 127
    .line 128
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 129
    .line 130
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->j:Landroid/graphics/PorterDuffXfermode;

    .line 131
    .line 132
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 133
    .line 134
    .line 135
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 136
    .line 137
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)Landroid/graphics/Bitmap;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    int-to-float v4, v4

    .line 146
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    .line 151
    .line 152
    .line 153
    move-result v5

    .line 154
    mul-float/2addr v4, v5

    .line 155
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    .line 160
    .line 161
    .line 162
    move-result v5

    .line 163
    div-float/2addr v4, v5

    .line 164
    float-to-int v4, v4

    .line 165
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 166
    .line 167
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)Landroid/graphics/Bitmap;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    .line 172
    .line 173
    .line 174
    move-result v5

    .line 175
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->i:Landroid/graphics/Rect;

    .line 180
    .line 181
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 182
    .line 183
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)Landroid/graphics/Bitmap;

    .line 184
    .line 185
    .line 186
    move-result-object v6

    .line 187
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    const/4 v7, 0x0

    .line 192
    invoke-virtual {v5, v7, v7, v4, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 193
    .line 194
    .line 195
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 196
    .line 197
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)Landroid/graphics/Bitmap;

    .line 198
    .line 199
    .line 200
    move-result-object v4

    .line 201
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->i:Landroid/graphics/Rect;

    .line 202
    .line 203
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;

    .line 204
    .line 205
    .line 206
    move-result-object v6

    .line 207
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 208
    .line 209
    invoke-virtual {v1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 210
    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_1
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 214
    .line 215
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 216
    .line 217
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->o(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 218
    .line 219
    .line 220
    move-result v5

    .line 221
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 222
    .line 223
    .line 224
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 229
    .line 230
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 231
    .line 232
    .line 233
    move-result v5

    .line 234
    int-to-float v5, v5

    .line 235
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 236
    .line 237
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 238
    .line 239
    .line 240
    move-result v6

    .line 241
    int-to-float v6, v6

    .line 242
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 243
    .line 244
    invoke-virtual {v1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 245
    .line 246
    .line 247
    goto :goto_1

    .line 248
    :cond_2
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 249
    .line 250
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 251
    .line 252
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 253
    .line 254
    .line 255
    move-result v5

    .line 256
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 257
    .line 258
    .line 259
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;

    .line 260
    .line 261
    .line 262
    move-result-object v4

    .line 263
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 264
    .line 265
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 266
    .line 267
    .line 268
    move-result v5

    .line 269
    int-to-float v5, v5

    .line 270
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 271
    .line 272
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 273
    .line 274
    .line 275
    move-result v6

    .line 276
    int-to-float v6, v6

    .line 277
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 278
    .line 279
    invoke-virtual {v1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 280
    .line 281
    .line 282
    :goto_1
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 283
    .line 284
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->o()Z

    .line 288
    .line 289
    .line 290
    move-result v4

    .line 291
    if-eqz v4, :cond_3

    .line 292
    .line 293
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 294
    .line 295
    const/high16 v5, -0x1000000

    .line 296
    .line 297
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 298
    .line 299
    .line 300
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/Bitmap;

    .line 301
    .line 302
    .line 303
    move-result-object v4

    .line 304
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->e(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/Rect;

    .line 305
    .line 306
    .line 307
    move-result-object v5

    .line 308
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->d(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;

    .line 309
    .line 310
    .line 311
    move-result-object v6

    .line 312
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h:Landroid/graphics/Paint;

    .line 313
    .line 314
    invoke-virtual {v1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 315
    .line 316
    .line 317
    :cond_3
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->h(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v4

    .line 321
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)F

    .line 322
    .line 323
    .line 324
    move-result v5

    .line 325
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)F

    .line 326
    .line 327
    .line 328
    move-result v3

    .line 329
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->g:Landroid/text/TextPaint;

    .line 330
    .line 331
    invoke-virtual {v1, v4, v5, v3, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 332
    .line 333
    .line 334
    goto/16 :goto_0

    .line 335
    .line 336
    :cond_4
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 337
    .line 338
    .line 339
    :cond_5
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->d:I

    .line 6
    .line 7
    if-ne p1, p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;->INIT:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    .line 12
    .line 13
    if-ne p2, v0, :cond_4

    .line 14
    .line 15
    :cond_0
    const/4 p2, 0x0

    .line 16
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->k:F

    .line 17
    .line 18
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->l:F

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->m:I

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->n:I

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->f:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;

    .line 43
    .line 44
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->n:I

    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 47
    .line 48
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-gt v1, v2, :cond_3

    .line 53
    .line 54
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->m:I

    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 57
    .line 58
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-le v1, v2, :cond_2

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;I)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->g(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_1

    .line 73
    .line 74
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$b;)Landroid/graphics/RectF;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    .line 79
    .line 80
    float-to-int v0, v0

    .line 81
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->e:I

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->g()V

    .line 85
    .line 86
    .line 87
    :cond_4
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->d:I

    .line 88
    .line 89
    sget-object p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;->MEASURED:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    .line 90
    .line 91
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$CommonLabelState;

    .line 92
    .line 93
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->e:I

    .line 94
    .line 95
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public setLabelShowListener(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$a;)V
    .locals 0

    return-void
.end method

.method public setLabelStyle(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->L(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->N()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->p(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;->v(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView$c;Landroid/graphics/Bitmap;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->h()V

    .line 44
    .line 45
    .line 46
    return-void
.end method
