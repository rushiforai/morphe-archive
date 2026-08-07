.class public Ll/nlm$a;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nlm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VImage;

.field public c:Landroid/view/View;

.field public final synthetic d:Ll/nlm;


# direct methods
.method public constructor <init>(Ll/nlm;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nlm$a;->d:Ll/nlm;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    sget p1, Ll/hdc0;->m0:I

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
    iput-object p1, p0, Ll/nlm$a;->a:Lv/VDraweeView;

    .line 15
    .line 16
    sget p1, Ll/hdc0;->q1:I

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
    iput-object p1, p0, Ll/nlm$a;->b:Lv/VImage;

    .line 25
    .line 26
    sget p1, Ll/hdc0;->H0:I

    .line 27
    .line 28
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/nlm$a;->c:Landroid/view/View;

    .line 33
    .line 34
    return-void
.end method
