.class public Landroidx/emoji/widget/EmojiExtractTextLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroidx/emoji/widget/ExtractButtonCompat;

.field public b:Landroidx/emoji/widget/EmojiExtractEditText;

.field public c:Landroid/view/ViewGroup;

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, p1, v0, v1, v1}, Landroidx/emoji/widget/EmojiExtractTextLayout;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, p2, v0, v0}, Landroidx/emoji/widget/EmojiExtractTextLayout;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/emoji/widget/EmojiExtractTextLayout;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Landroidx/emoji/widget/EmojiExtractTextLayout;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Landroidx/emoji/widget/EmojiExtractTextLayout;->d:Z

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    sget v3, Ll/dfc0;->a:I

    .line 17
    .line 18
    invoke-virtual {v2, v3, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v2, Ll/tdc0;->a:I

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Landroid/view/ViewGroup;

    .line 29
    .line 30
    iput-object v2, p0, Landroidx/emoji/widget/EmojiExtractTextLayout;->c:Landroid/view/ViewGroup;

    .line 31
    .line 32
    sget v2, Ll/tdc0;->b:I

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Landroidx/emoji/widget/ExtractButtonCompat;

    .line 39
    .line 40
    iput-object v2, p0, Landroidx/emoji/widget/EmojiExtractTextLayout;->a:Landroidx/emoji/widget/ExtractButtonCompat;

    .line 41
    .line 42
    const v2, 0x1020025

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroidx/emoji/widget/EmojiExtractEditText;

    .line 50
    .line 51
    iput-object v0, p0, Landroidx/emoji/widget/EmojiExtractTextLayout;->b:Landroidx/emoji/widget/EmojiExtractEditText;

    .line 52
    .line 53
    if-eqz p2, :cond_0

    .line 54
    .line 55
    sget-object v0, Ll/bic0;->c:[I

    .line 56
    .line 57
    invoke-virtual {p1, p2, v0, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    sget p2, Ll/bic0;->d:I

    .line 62
    .line 63
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    iget-object p0, p0, Landroidx/emoji/widget/EmojiExtractTextLayout;->b:Landroidx/emoji/widget/EmojiExtractEditText;

    .line 68
    .line 69
    invoke-virtual {p0, p2}, Landroidx/emoji/widget/EmojiExtractEditText;->setEmojiReplaceStrategy(I)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 73
    .line 74
    .line 75
    :cond_0
    return-void
.end method

.method public getEmojiReplaceStrategy()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/emoji/widget/EmojiExtractTextLayout;->b:Landroidx/emoji/widget/EmojiExtractEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/emoji/widget/EmojiExtractEditText;->getEmojiReplaceStrategy()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setEmojiReplaceStrategy(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/emoji/widget/EmojiExtractTextLayout;->b:Landroidx/emoji/widget/EmojiExtractEditText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/emoji/widget/EmojiExtractEditText;->setEmojiReplaceStrategy(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
