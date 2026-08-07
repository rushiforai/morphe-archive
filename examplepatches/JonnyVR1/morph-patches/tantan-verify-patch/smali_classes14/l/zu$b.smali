.class public Ll/zu$b;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Landroid/widget/CheckBox;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public final synthetic d:Ll/zu;


# direct methods
.method public constructor <init>(Ll/zu;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zu$b;->d:Ll/zu;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    sget p1, Ll/gdc0;->d:I

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Landroid/widget/CheckBox;

    .line 13
    .line 14
    iput-object p1, p0, Ll/zu$b;->a:Landroid/widget/CheckBox;

    .line 15
    .line 16
    sget p1, Ll/gdc0;->Z:I

    .line 17
    .line 18
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object p1, p0, Ll/zu$b;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    sget p1, Ll/gdc0;->a0:I

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
    iput-object p1, p0, Ll/zu$b;->c:Landroid/widget/TextView;

    .line 35
    .line 36
    const/4 p0, 0x3

    .line 37
    invoke-static {p0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 p2, 0x1

    .line 42
    invoke-virtual {p1, p0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public synthetic constructor <init>(Ll/zu;Landroid/view/View;Ll/av;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2}, Ll/zu$b;-><init>(Ll/zu;Landroid/view/View;)V

    return-void
.end method
