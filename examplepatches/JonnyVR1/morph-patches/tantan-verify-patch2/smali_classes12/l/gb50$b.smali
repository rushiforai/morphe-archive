.class public Ll/gb50$b;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gb50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field a:Lcom/idv/identity/ocr/widget/OcrContentTitleView;

.field b:Lcom/idv/identity/ocr/widget/OcrEditText;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/rcc0;->H0:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/idv/identity/ocr/widget/OcrContentTitleView;

    .line 11
    .line 12
    iput-object v0, p0, Ll/gb50$b;->a:Lcom/idv/identity/ocr/widget/OcrContentTitleView;

    .line 13
    .line 14
    sget v0, Ll/rcc0;->F0:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/idv/identity/ocr/widget/OcrEditText;

    .line 21
    .line 22
    iput-object p1, p0, Ll/gb50$b;->b:Lcom/idv/identity/ocr/widget/OcrEditText;

    .line 23
    .line 24
    return-void
.end method
