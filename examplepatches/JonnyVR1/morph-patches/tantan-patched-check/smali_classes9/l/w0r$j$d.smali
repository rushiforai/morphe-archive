.class public Ll/w0r$j$d;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w0r$j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public a:Landroid/widget/ImageView;

.field public b:Landroid/widget/LinearLayout;

.field public final synthetic c:Ll/w0r$j;


# direct methods
.method public constructor <init>(Ll/w0r$j;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w0r$j$d;->c:Ll/w0r$j;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    sget p1, Ll/edc0;->D1:I

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Landroid/widget/ImageView;

    .line 13
    .line 14
    iput-object p1, p0, Ll/w0r$j$d;->a:Landroid/widget/ImageView;

    .line 15
    .line 16
    sget p1, Ll/edc0;->U0:I

    .line 17
    .line 18
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Landroid/widget/LinearLayout;

    .line 23
    .line 24
    iput-object p1, p0, Ll/w0r$j$d;->b:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    return-void
.end method
