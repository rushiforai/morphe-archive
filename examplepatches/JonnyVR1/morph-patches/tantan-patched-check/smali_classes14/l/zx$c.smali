.class public Ll/zx$c;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/LinearLayout;

.field public final synthetic d:Ll/zx;


# direct methods
.method public constructor <init>(Ll/zx;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zx$c;->d:Ll/zx;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    sget p1, Ll/wcc0;->C:I

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Landroid/widget/LinearLayout;

    .line 13
    .line 14
    iput-object p1, p0, Ll/zx$c;->c:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    sget p1, Ll/wcc0;->A:I

    .line 17
    .line 18
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Landroid/widget/ImageView;

    .line 23
    .line 24
    iput-object p1, p0, Ll/zx$c;->b:Landroid/widget/ImageView;

    .line 25
    .line 26
    sget p1, Ll/wcc0;->i0:I

    .line 27
    .line 28
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Landroid/widget/TextView;

    .line 33
    .line 34
    iput-object p1, p0, Ll/zx$c;->a:Landroid/widget/TextView;

    .line 35
    .line 36
    return-void
.end method

.method public synthetic constructor <init>(Ll/zx;Landroid/view/View;Ll/ay;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1, p2}, Ll/zx$c;-><init>(Ll/zx;Landroid/view/View;)V

    return-void
.end method
