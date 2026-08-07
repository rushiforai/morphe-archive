.class public Ll/e1i$b;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/e1i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Landroid/view/ViewGroup;

.field public b:Lv/AutoVDraweeView;

.field public final synthetic c:Ll/e1i;


# direct methods
.method public constructor <init>(Ll/e1i;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e1i$b;->c:Ll/e1i;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    sget p1, Ll/hdc0;->C1:I

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Landroid/view/ViewGroup;

    .line 13
    .line 14
    iput-object p1, p0, Ll/e1i$b;->a:Landroid/view/ViewGroup;

    .line 15
    .line 16
    sget p1, Ll/hdc0;->r0:I

    .line 17
    .line 18
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lv/AutoVDraweeView;

    .line 23
    .line 24
    iput-object p1, p0, Ll/e1i$b;->b:Lv/AutoVDraweeView;

    .line 25
    .line 26
    return-void
.end method
