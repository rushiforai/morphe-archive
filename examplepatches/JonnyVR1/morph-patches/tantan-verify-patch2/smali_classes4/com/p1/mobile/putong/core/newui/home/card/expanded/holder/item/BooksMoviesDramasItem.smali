.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/AutoVDraweeView;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:I

.field public l:Ll/ner;

.field public m:Ljava/lang/String;

.field public n:Z

.field public o:Z

.field public p:Ljava/lang/String;

.field public q:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;"
        }
    .end annotation
.end field

.field public r:Lcom/p1/mobile/putong/core/data/Literatures;

.field public s:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

.field public t:Ll/bkj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public u:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 20
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, -0x1

    .line 19
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->k:I

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    invoke-static {p1, p1, p1}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->t:Ll/bkj0;

    .line 14
    .line 15
    const/4 p1, -0x1

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->u:I

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;ZLjava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->d(ZLjava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public static c(Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-ge v1, v2, :cond_2

    .line 21
    .line 22
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    add-int/lit8 v2, v2, -0x1

    .line 36
    .line 37
    if-eq v1, v2, :cond_1

    .line 38
    .line 39
    const-string v2, " / "

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/j63;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d(ZLjava/lang/Boolean;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "[profile progress]"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_3

    .line 11
    .line 12
    invoke-virtual {p0, v1, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->h(ZLjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "add myrecent from list"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    const-string p1, "delete"

    .line 28
    .line 29
    invoke-static {p3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->h(ZLjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->s:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 40
    .line 41
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-eqz p2, :cond_2

    .line 46
    .line 47
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->q:Ll/y20;

    .line 51
    .line 52
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->q:Ll/y20;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->s:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 61
    .line 62
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    invoke-virtual {p0, v1, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->h(ZLjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_2
    :goto_0
    const-string p0, "delete myrecent from list"

    .line 70
    .line 71
    invoke-static {v0, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_3
    return-void
.end method

.method public e(Ll/ner;Ljava/lang/String;ZZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;ILl/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ner;",
            "Ljava/lang/String;",
            "ZZ",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            "I",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_5

    .line 8
    .line 9
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->l:Ll/ner;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->m:Ljava/lang/String;

    .line 12
    .line 13
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->n:Z

    .line 14
    .line 15
    iput-boolean p4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->o:Z

    .line 16
    .line 17
    iput-object p5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->p:Ljava/lang/String;

    .line 18
    .line 19
    iput p8, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->k:I

    .line 20
    .line 21
    iput-object p6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->r:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 22
    .line 23
    iput-object p7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->s:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 24
    .line 25
    invoke-static {p2}, Ll/epc0;->c(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    iput-object p9, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->q:Ll/y20;

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->e:Lv/VText;

    .line 31
    .line 32
    const/4 p2, 0x0

    .line 33
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->c:Lv/AutoVDraweeView;

    .line 37
    .line 38
    iget-object p5, p6, Lcom/p1/mobile/putong/core/data/Literatures;->headUrl:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, p5}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p6, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->setTypeIcon(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    iget-object p1, p7, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->setWatchType(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->f:Lv/VText;

    .line 60
    .line 61
    const/4 p5, 0x3

    .line 62
    invoke-static {p5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 63
    .line 64
    .line 65
    move-result-object p8

    .line 66
    const/4 p9, 0x1

    .line 67
    invoke-virtual {p1, p8, p9}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 71
    .line 72
    iget-object p8, p6, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p1, p8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Ll/gra;->L3()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 84
    .line 85
    invoke-static {p5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 86
    .line 87
    .line 88
    move-result-object p5

    .line 89
    invoke-virtual {p1, p5, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 90
    .line 91
    .line 92
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->h:Lv/VText;

    .line 93
    .line 94
    iget-object p5, p6, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 95
    .line 96
    const-string p8, "book"

    .line 97
    .line 98
    invoke-static {p5, p8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result p5

    .line 102
    if-eqz p5, :cond_3

    .line 103
    .line 104
    iget-object p5, p6, Lcom/p1/mobile/putong/core/data/Literatures;->authors:Ljava/util/List;

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_3
    iget-object p5, p6, Lcom/p1/mobile/putong/core/data/Literatures;->kinds:Ljava/util/List;

    .line 108
    .line 109
    :goto_0
    invoke-static {p5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->c(Ljava/util/List;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p5

    .line 113
    invoke-virtual {p1, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->d:Lv/VImage;

    .line 117
    .line 118
    if-eqz p4, :cond_4

    .line 119
    .line 120
    invoke-static {p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p5

    .line 124
    if-nez p5, :cond_4

    .line 125
    .line 126
    move p5, p9

    .line 127
    goto :goto_1

    .line 128
    :cond_4
    move p5, p2

    .line 129
    :goto_1
    invoke-static {p1, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    if-eqz p3, :cond_6

    .line 133
    .line 134
    iget-object p1, p6, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {p1}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->p(Ljava/lang/String;)Ljava/util/List;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 141
    .line 142
    .line 143
    move-result p5

    .line 144
    if-nez p5, :cond_5

    .line 145
    .line 146
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    check-cast p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 151
    .line 152
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {p0, p9, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->h(ZLjava/lang/String;)V

    .line 155
    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_5
    const-string p1, ""

    .line 159
    .line 160
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->h(ZLjava/lang/String;)V

    .line 161
    .line 162
    .line 163
    :goto_2
    invoke-static {p0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 164
    .line 165
    .line 166
    :cond_6
    if-nez p3, :cond_7

    .line 167
    .line 168
    if-nez p4, :cond_7

    .line 169
    .line 170
    invoke-virtual {p0, p6, p7}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->f(Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 171
    .line 172
    .line 173
    :cond_7
    const-string p1, "tv_show"

    .line 174
    .line 175
    const-string p2, "teleplay"

    .line 176
    .line 177
    const-string p4, "artwork_type"

    .line 178
    .line 179
    const-string p5, "artwork_title"

    .line 180
    .line 181
    if-nez p3, :cond_9

    .line 182
    .line 183
    new-instance p3, Ll/pf60;

    .line 184
    .line 185
    const-string p7, "is_artwork_interactive"

    .line 186
    .line 187
    sget-object p8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 188
    .line 189
    invoke-direct {p3, p7, p8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    new-instance p7, Ll/pf60;

    .line 193
    .line 194
    iget-object p8, p6, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 195
    .line 196
    invoke-direct {p7, p5, p8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 197
    .line 198
    .line 199
    new-instance p5, Ll/pf60;

    .line 200
    .line 201
    iget-object p8, p6, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {p8, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 204
    .line 205
    .line 206
    move-result p2

    .line 207
    if-eqz p2, :cond_8

    .line 208
    .line 209
    goto :goto_3

    .line 210
    :cond_8
    iget-object p1, p6, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 211
    .line 212
    :goto_3
    invoke-direct {p5, p4, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 213
    .line 214
    .line 215
    new-instance p1, Ll/pf60;

    .line 216
    .line 217
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->t:Ll/bkj0;

    .line 218
    .line 219
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 220
    .line 221
    check-cast p0, Ljava/lang/String;

    .line 222
    .line 223
    const-string p2, "artwork_status"

    .line 224
    .line 225
    invoke-direct {p1, p2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 226
    .line 227
    .line 228
    filled-new-array {p3, p7, p5, p1}, [Ll/pf60;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    const-string p1, "e_profile_artwork_info"

    .line 233
    .line 234
    const-string p2, "p_suggest_user_profile_info_view"

    .line 235
    .line 236
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 237
    .line 238
    .line 239
    return-void

    .line 240
    :cond_9
    if-eqz p3, :cond_b

    .line 241
    .line 242
    invoke-static {p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result p0

    .line 246
    if-nez p0, :cond_b

    .line 247
    .line 248
    new-instance p0, Ll/pf60;

    .line 249
    .line 250
    iget-object p3, p6, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 251
    .line 252
    invoke-direct {p0, p4, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 253
    .line 254
    .line 255
    new-instance p3, Ll/pf60;

    .line 256
    .line 257
    iget-object p4, p6, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 258
    .line 259
    invoke-static {p4, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 260
    .line 261
    .line 262
    move-result p2

    .line 263
    if-eqz p2, :cond_a

    .line 264
    .line 265
    goto :goto_4

    .line 266
    :cond_a
    iget-object p1, p6, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 267
    .line 268
    :goto_4
    invoke-direct {p3, p5, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 269
    .line 270
    .line 271
    filled-new-array {p0, p3}, [Ll/pf60;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    const-string p1, "e_artwork_guess_you_like"

    .line 276
    .line 277
    const-string p2, "p_edit_profile_view"

    .line 278
    .line 279
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 280
    .line 281
    .line 282
    :cond_b
    :goto_5
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->p(Ljava/lang/String;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v1, :cond_2

    .line 13
    .line 14
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->g(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Ll/bkj0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->t:Ll/bkj0;

    .line 19
    .line 20
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, Ljava/lang/CharSequence;

    .line 23
    .line 24
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->f:Lv/VText;

    .line 31
    .line 32
    const/4 p2, 0x1

    .line 33
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->f:Lv/VText;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->t:Ll/bkj0;

    .line 39
    .line 40
    iget-object p0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast p0, Ljava/lang/CharSequence;

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->f:Lv/VText;

    .line 53
    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->setWatchType(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->f:Lv/VText;

    .line 70
    .line 71
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public g(ZLcom/p1/mobile/putong/core/data/Literatures;)V
    .locals 3

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v2, Ll/i63;

    .line 12
    .line 13
    invoke-direct {v2, p0, p1}, Ll/i63;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;Z)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1, p2, v2}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final h(ZLjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->d:Lv/VImage;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->setWatchType(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/pf60;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->r:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 16
    .line 17
    const-string v2, "artwork_type"

    .line 18
    .line 19
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/pf60;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->r:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 27
    .line 28
    const-string v3, "teleplay"

    .line 29
    .line 30
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    const-string v2, "tv_show"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->r:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 42
    .line 43
    :goto_0
    const-string v3, "artwork_title"

    .line 44
    .line 45
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "e_artwork_guess_you_like"

    .line 53
    .line 54
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->d:Lv/VImage;

    .line 58
    .line 59
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->r:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 64
    .line 65
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->g(ZLcom/p1/mobile/putong/core/data/Literatures;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->d:Lv/VImage;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->f:Lv/VText;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->e:Lv/VText;

    .line 19
    .line 20
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setTypeIcon(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :sswitch_0
    const-string v0, "movie"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x2

    .line 23
    goto :goto_0

    .line 24
    :sswitch_1
    const-string v0, "book"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v1, 0x1

    .line 34
    goto :goto_0

    .line 35
    :sswitch_2
    const-string v0, "teleplay"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/4 v1, 0x0

    .line 45
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 46
    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    goto :goto_1

    .line 50
    :pswitch_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    sget v0, Ll/dbc0;->qh:I

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    goto :goto_1

    .line 61
    :pswitch_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    sget v0, Ll/dbc0;->mh:I

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    goto :goto_1

    .line 72
    :pswitch_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    sget v0, Ll/dbc0;->uh:I

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->i:Lv/VImage;

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    nop

    .line 89
    :sswitch_data_0
    .sparse-switch
        -0x51131622 -> :sswitch_2
        0x2e3ae9 -> :sswitch_1
        0x6343f30 -> :sswitch_0
    .end sparse-switch

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setWatchType(Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x2

    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, -0x1

    .line 12
    sparse-switch v0, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    :goto_0
    move p1, v4

    .line 16
    goto :goto_1

    .line 17
    :sswitch_0
    const-string v0, "watched"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move p1, v1

    .line 27
    goto :goto_1

    .line 28
    :sswitch_1
    const-string v0, "watching"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    move p1, v2

    .line 38
    goto :goto_1

    .line 39
    :sswitch_2
    const-string v0, "to_watch"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    move p1, v3

    .line 49
    :goto_1
    const/4 v0, 0x0

    .line 50
    packed-switch p1, :pswitch_data_0

    .line 51
    .line 52
    .line 53
    move-object p1, v0

    .line 54
    goto :goto_2

    .line 55
    :pswitch_0
    const-string p1, "\u770b\u8fc7"

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :pswitch_1
    const-string p1, "\u5728\u770b"

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :pswitch_2
    const-string p1, "\u60f3\u770b"

    .line 62
    .line 63
    :goto_2
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->r:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 64
    .line 65
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    sparse-switch v6, :sswitch_data_1

    .line 75
    .line 76
    .line 77
    :goto_3
    move v1, v4

    .line 78
    goto :goto_4

    .line 79
    :sswitch_3
    const-string v2, "movie"

    .line 80
    .line 81
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-nez v2, :cond_5

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :sswitch_4
    const-string v1, "book"

    .line 89
    .line 90
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-nez v1, :cond_3

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_3
    move v1, v2

    .line 98
    goto :goto_4

    .line 99
    :sswitch_5
    const-string v1, "teleplay"

    .line 100
    .line 101
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-nez v1, :cond_4

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_4
    move v1, v3

    .line 109
    :cond_5
    :goto_4
    packed-switch v1, :pswitch_data_1

    .line 110
    .line 111
    .line 112
    goto :goto_5

    .line 113
    :pswitch_3
    const-string v0, "\u7535\u5f71"

    .line 114
    .line 115
    goto :goto_5

    .line 116
    :pswitch_4
    const-string v0, "\u4e66\u7c4d"

    .line 117
    .line 118
    goto :goto_5

    .line 119
    :pswitch_5
    const-string v0, "\u7535\u89c6\u5267"

    .line 120
    .line 121
    :goto_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BooksMoviesDramasItem;->j:Lv/VText;

    .line 122
    .line 123
    new-instance v1, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string p1, "\u7684"

    .line 132
    .line 133
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :sswitch_data_0
    .sparse-switch
        -0x554cd1f5 -> :sswitch_2
        0x207e6cb3 -> :sswitch_1
        0x431cd9ae -> :sswitch_0
    .end sparse-switch

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    :sswitch_data_1
    .sparse-switch
        -0x51131622 -> :sswitch_5
        0x2e3ae9 -> :sswitch_4
        0x6343f30 -> :sswitch_3
    .end sparse-switch

    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method
