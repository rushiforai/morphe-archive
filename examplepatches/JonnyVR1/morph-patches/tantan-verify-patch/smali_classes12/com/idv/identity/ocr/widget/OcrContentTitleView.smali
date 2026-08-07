.class public Lcom/idv/identity/ocr/widget/OcrContentTitleView;
.super Landroid/widget/TextView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 15
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/widget/OcrContentTitleView;->a(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/widget/OcrContentTitleView;->a(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/widget/OcrContentTitleView;->a(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x5

    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setTextDirection(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private a(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 p1, 0x5

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/View;->setTextDirection(I)V

    .line 3
    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setTextAlignment(I)V

    .line 7
    .line 8
    .line 9
    sget-object p1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 10
    .line 11
    sget v0, Ll/y9c0;->b:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultInfoTitleColor(I)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
