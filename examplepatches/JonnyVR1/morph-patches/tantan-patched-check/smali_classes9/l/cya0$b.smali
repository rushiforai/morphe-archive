.class public Ll/cya0$b;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cya0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroidx/constraintlayout/widget/Group;

.field public c:Landroidx/constraintlayout/widget/Group;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/view/View;

.field public g:Landroid/view/View;

.field public h:Lv/VText;

.field public i:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/gdc0;->v:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Ll/cya0$b;->a:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/gdc0;->s:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroidx/constraintlayout/widget/Group;

    .line 21
    .line 22
    iput-object v0, p0, Ll/cya0$b;->b:Landroidx/constraintlayout/widget/Group;

    .line 23
    .line 24
    sget v0, Ll/gdc0;->J:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/ImageView;

    .line 31
    .line 32
    iput-object v0, p0, Ll/cya0$b;->d:Landroid/widget/ImageView;

    .line 33
    .line 34
    sget v0, Ll/gdc0;->t:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroidx/constraintlayout/widget/Group;

    .line 41
    .line 42
    iput-object v0, p0, Ll/cya0$b;->c:Landroidx/constraintlayout/widget/Group;

    .line 43
    .line 44
    sget v0, Ll/gdc0;->h:I

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Ll/cya0$b;->f:Landroid/view/View;

    .line 51
    .line 52
    sget v0, Ll/gdc0;->i:I

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p0, Ll/cya0$b;->g:Landroid/view/View;

    .line 59
    .line 60
    sget v0, Ll/gdc0;->k:I

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lv/VText;

    .line 67
    .line 68
    iput-object v0, p0, Ll/cya0$b;->i:Lv/VText;

    .line 69
    .line 70
    sget v0, Ll/gdc0;->j:I

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lv/VText;

    .line 77
    .line 78
    iput-object v0, p0, Ll/cya0$b;->h:Lv/VText;

    .line 79
    .line 80
    sget v0, Ll/gdc0;->T:I

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Landroid/widget/TextView;

    .line 87
    .line 88
    iput-object p1, p0, Ll/cya0$b;->e:Landroid/widget/TextView;

    .line 89
    .line 90
    return-void
.end method

.method public synthetic constructor <init>(Landroid/view/View;Ll/dya0;)V
    .locals 0

    .line 91
    invoke-direct {p0, p1}, Ll/cya0$b;-><init>(Landroid/view/View;)V

    return-void
.end method
