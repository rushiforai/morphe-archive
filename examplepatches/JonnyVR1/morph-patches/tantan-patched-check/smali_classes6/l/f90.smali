.class public Ll/f90;
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
.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Z

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/g90;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/lang/Runnable;

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/g90;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/f90;->d:Z

    .line 6
    .line 7
    new-instance v0, Ll/g90;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/g90;-><init>()V

    .line 10
    .line 11
    .line 12
    filled-new-array {v0}, [Ll/g90;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/f90;->e:Ljava/util/List;

    .line 21
    .line 22
    iput-object p1, p0, Ll/f90;->c:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic s(Ll/f90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f90;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Ll/f90;Ll/g90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f90;->z(Ll/g90;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/g90;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/f90;->e:Ljava/util/List;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/f90;->d:Z

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public B(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f90;->f:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public C(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/g90;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/f90;->g:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/f90;->d:Z

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
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/f90;->w(Landroid/view/View;Ll/g90;II)V

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
    iget-object p0, p0, Ll/f90;->c:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget p2, Ll/tec0;->m4:I

    .line 11
    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object p0, p0, Ll/f90;->c:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-ne p2, v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget p2, Ll/tec0;->z0:I

    .line 27
    .line 28
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget p2, Ll/tec0;->n4:I

    .line 38
    .line 39
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
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
    iget-object p0, p0, Ll/f90;->e:Ljava/util/List;

    .line 2
    .line 3
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
    new-instance p2, Ll/b90;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Ll/b90;-><init>(Ll/f90;)V

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
    iget-object v1, p0, Ll/f90;->e:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Ll/g90;

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/g90;->c()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/f90;->e:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p4

    .line 71
    check-cast p4, Ll/g90;

    .line 72
    .line 73
    invoke-virtual {p4}, Ll/g90;->a()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p4

    .line 77
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    new-instance p3, Ll/d90;

    .line 81
    .line 82
    invoke-direct {p3, p0, p2}, Ll/d90;-><init>(Ll/f90;Ll/g90;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f90;->f:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic z(Ll/g90;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f90;->g:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
