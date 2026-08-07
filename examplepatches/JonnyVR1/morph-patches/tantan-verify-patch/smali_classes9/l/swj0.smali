.class public Ll/swj0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/rwj0;Landroid/view/View;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lv/VRelative;

    .line 3
    .line 4
    iput-object v0, p0, Ll/rwj0;->d:Lv/VRelative;

    .line 5
    .line 6
    sget v0, Ll/mdc0;->K3:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lv/VImage;

    .line 13
    .line 14
    iput-object v0, p0, Ll/rwj0;->e:Lv/VImage;

    .line 15
    .line 16
    sget v0, Ll/mdc0;->V2:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/VRecyclerView;

    .line 23
    .line 24
    iput-object v0, p0, Ll/rwj0;->f:Lv/VRecyclerView;

    .line 25
    .line 26
    sget v0, Ll/mdc0;->b8:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lv/VText;

    .line 33
    .line 34
    iput-object v0, p0, Ll/rwj0;->g:Lv/VText;

    .line 35
    .line 36
    sget v0, Ll/mdc0;->c8:I

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lv/VText;

    .line 43
    .line 44
    iput-object v0, p0, Ll/rwj0;->h:Lv/VText;

    .line 45
    .line 46
    sget v0, Ll/mdc0;->U2:I

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lv/VText;

    .line 53
    .line 54
    iput-object p1, p0, Ll/rwj0;->i:Lv/VText;

    .line 55
    .line 56
    return-void
.end method
