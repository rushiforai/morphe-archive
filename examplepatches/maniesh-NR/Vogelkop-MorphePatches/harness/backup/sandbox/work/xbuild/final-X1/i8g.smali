.class public final Li8g;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Landroid/widget/ImageView;

.field public c:Lro9;

.field public d:I

.field public e:I

.field public f:I

.field public g:Lj8g;

.field public h:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    const v0, 0x7f0a0571

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Li8g;->b:Landroid/widget/ImageView;

    return-void
.end method
