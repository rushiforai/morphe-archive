.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# static fields
.field public static final d:I

.field public static final e:I


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->k:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->d:I

    .line 4
    .line 5
    sget v0, Ll/qa00;->h:I

    .line 6
    .line 7
    sput v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->e:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ql80;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ljava/lang/String;Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->b:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    sget v3, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->d:I

    .line 20
    .line 21
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;

    .line 22
    .line 23
    invoke-virtual {v4}, Landroid/view/View;->getPaddingBottom()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;

    .line 31
    .line 32
    sget v1, Ll/lbc0;->G3:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->c:Landroid/widget/TextView;

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->c:Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->b:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    sget v3, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->e:I

    .line 20
    .line 21
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;

    .line 22
    .line 23
    invoke-virtual {v4}, Landroid/view/View;->getPaddingBottom()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->c:Landroid/widget/TextView;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->c:Landroid/widget/TextView;

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setSelected(Z)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;

    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/PostBottomTitleTagsItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
