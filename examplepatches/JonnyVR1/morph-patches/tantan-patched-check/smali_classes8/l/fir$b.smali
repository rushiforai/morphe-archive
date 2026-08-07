.class public Ll/fir$b;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fir;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/fir;


# direct methods
.method public constructor <init>(Ll/fir;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fir$b;->a:Ll/fir;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/fir$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fir$b;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fir$b;->a:Ll/fir;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/fir;->e(Ll/fir;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/joa;->f4()Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    invoke-static {}, Ll/e7d0;->e()Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    iget-object p2, p0, Ll/fir$b;->a:Ll/fir;

    .line 17
    .line 18
    invoke-static {p2}, Ll/fir;->d(Ll/fir;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    const-string p3, "p_navigation,ilike_module"

    .line 23
    .line 24
    if-nez p2, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    const/high16 v0, 0x44160000    # 600.0f

    .line 31
    .line 32
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-le p2, v0, :cond_0

    .line 37
    .line 38
    iget-object p1, p0, Ll/fir$b;->a:Ll/fir;

    .line 39
    .line 40
    const/4 p2, 0x1

    .line 41
    invoke-static {p1, p2}, Ll/fir;->f(Ll/fir;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/fir$b;->a:Ll/fir;

    .line 45
    .line 46
    invoke-static {p1, p2}, Ll/fir;->e(Ll/fir;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/fir$b;->a:Ll/fir;

    .line 50
    .line 51
    iget-object p1, p1, Ll/fir;->g:Ll/cir;

    .line 52
    .line 53
    new-instance p2, Ll/gir;

    .line 54
    .line 55
    invoke-direct {p2, p0}, Ll/gir;-><init>(Ll/fir$b;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, p3, p2}, Ll/cir;->N0(Ljava/lang/String;Ll/x20;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    invoke-static {p1}, Ll/zrc0;->a(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-eqz p2, :cond_1

    .line 67
    .line 68
    invoke-static {p1}, Ll/zrc0;->b(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    iget-object p1, p0, Ll/fir$b;->a:Ll/fir;

    .line 75
    .line 76
    invoke-static {p1}, Ll/fir;->c(Ll/fir;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_1

    .line 81
    .line 82
    iget-object p0, p0, Ll/fir$b;->a:Ll/fir;

    .line 83
    .line 84
    iget-object p0, p0, Ll/fir;->g:Ll/cir;

    .line 85
    .line 86
    invoke-virtual {p0, p3}, Ll/cir;->L0(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method
