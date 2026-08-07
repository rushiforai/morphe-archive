.class public Ll/e90;
.super Ll/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a<",
        "Ll/g90;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/bh4;

.field public d:Z


# direct methods
.method public constructor <init>(Ll/bh4;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/e90;->d:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/e90;->c:Ll/bh4;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic s(Ll/e90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e90;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Ll/e90;Ll/g90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/e90;->z(Ll/g90;Landroid/view/View;)V

    return-void
.end method

.method private synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e90;->c:Ll/bh4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bh4;->v()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic z(Ll/g90;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e90;->c:Ll/bh4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bh4;->J()Ll/rg4;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/rg4;->u0(Ll/g90;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/e90;->d:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    if-nez p1, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    const/4 p0, 0x2

    .line 12
    return p0
.end method

.method public getViewTypeCount()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/g90;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/e90;->w(Landroid/view/View;Ll/g90;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Ll/e90;->c:Ll/bh4;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget p2, Ll/tec0;->m4:I

    .line 15
    .line 16
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    iget-object p0, p0, Ll/e90;->c:Ll/bh4;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    if-ne p2, v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget p2, Ll/tec0;->z0:I

    .line 35
    .line 36
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_1
    invoke-virtual {p0}, Ll/bh4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget p2, Ll/tec0;->n4:I

    .line 50
    .line 51
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/g90;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/e90;->c:Ll/bh4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bh4;->J()Ll/rg4;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/rg4;->h0()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public w(Landroid/view/View;Ll/g90;II)V
    .locals 2

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    move-object p2, p1

    .line 4
    check-cast p2, Landroid/view/ViewGroup;

    .line 5
    .line 6
    const/4 p3, 0x0

    .line 7
    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Landroid/widget/TextView;

    .line 12
    .line 13
    sget p3, Lcom/p1/mobile/putong/feed/R$string;->F3:I

    .line 14
    .line 15
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ll/a90;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Ll/a90;-><init>(Ll/e90;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const/4 v0, 0x1

    .line 28
    if-ne p3, v0, :cond_1

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    move-object p3, p1

    .line 32
    check-cast p3, Landroid/view/ViewGroup;

    .line 33
    .line 34
    sget v0, Ll/hdc0;->J0:I

    .line 35
    .line 36
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/widget/TextView;

    .line 41
    .line 42
    sget v1, Ll/hdc0;->I0:I

    .line 43
    .line 44
    invoke-virtual {p3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    check-cast p3, Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/e90;->p()Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Ll/g90;

    .line 59
    .line 60
    invoke-virtual {v1}, Ll/g90;->c()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/e90;->p()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-interface {v0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p4

    .line 75
    check-cast p4, Ll/g90;

    .line 76
    .line 77
    invoke-virtual {p4}, Ll/g90;->a()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p4

    .line 81
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    new-instance p3, Ll/c90;

    .line 85
    .line 86
    invoke-direct {p3, p0, p2}, Ll/c90;-><init>(Ll/e90;Ll/g90;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method
