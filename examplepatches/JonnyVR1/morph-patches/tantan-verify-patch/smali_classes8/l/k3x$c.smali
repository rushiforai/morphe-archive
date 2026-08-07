.class public Ll/k3x$c;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/k3x;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VImage;

.field public c:Lv/VFrame;

.field public final synthetic d:Ll/k3x;


# direct methods
.method public constructor <init>(Ll/k3x;Landroid/view/View;)V
    .locals 0
    .param p1    # Ll/k3x;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/k3x$c;->d:Ll/k3x;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    sget p1, Ll/gdc0;->p:I

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lv/VDraweeView;

    .line 13
    .line 14
    iput-object p1, p0, Ll/k3x$c;->a:Lv/VDraweeView;

    .line 15
    .line 16
    sget p1, Ll/gdc0;->q:I

    .line 17
    .line 18
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lv/VImage;

    .line 23
    .line 24
    iput-object p1, p0, Ll/k3x$c;->b:Lv/VImage;

    .line 25
    .line 26
    sget p1, Ll/gdc0;->w:I

    .line 27
    .line 28
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lv/VFrame;

    .line 33
    .line 34
    iput-object p1, p0, Ll/k3x$c;->c:Lv/VFrame;

    .line 35
    .line 36
    return-void
.end method
