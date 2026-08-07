.class public final Ll/sgm0$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sgm0;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\'\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\t\u00a8\u0006\n"
    }
    d2 = {
        "l/sgm0$a",
        "Landroidx/recyclerview/widget/RecyclerView$t;",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "recyclerView",
        "",
        "dx",
        "dy",
        "",
        "onScrolled",
        "(Landroidx/recyclerview/widget/RecyclerView;II)V",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/sgm0;


# direct methods
.method public constructor <init>(Ll/sgm0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sgm0$a;->a:Ll/sgm0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static a(Ll/sgm0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/sgm0;->l(Ll/sgm0;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/joa;->G3()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_1

    .line 12
    .line 13
    iget-object p2, p0, Ll/sgm0$a;->a:Ll/sgm0;

    .line 14
    .line 15
    invoke-static {p2}, Ll/sgm0;->i(Ll/sgm0;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    const-string p3, "p_navigation,visit_module"

    .line 20
    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    const/high16 v0, 0x44160000    # 600.0f

    .line 28
    .line 29
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-le p2, v0, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Ll/sgm0$a;->a:Ll/sgm0;

    .line 36
    .line 37
    const/4 p2, 0x1

    .line 38
    invoke-static {p1, p2}, Ll/sgm0;->m(Ll/sgm0;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/sgm0$a;->a:Ll/sgm0;

    .line 42
    .line 43
    invoke-static {p1, p2}, Ll/sgm0;->l(Ll/sgm0;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/sgm0$a;->a:Ll/sgm0;

    .line 47
    .line 48
    new-instance p1, Ll/rgm0;

    .line 49
    .line 50
    invoke-direct {p1, p0}, Ll/rgm0;-><init>(Ll/sgm0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p3, p1}, Ll/sgm0;->E(Ljava/lang/String;Ll/x20;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    iget-object p2, p0, Ll/sgm0$a;->a:Ll/sgm0;

    .line 58
    .line 59
    invoke-virtual {p2, p1}, Ll/sgm0;->p(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-eqz p2, :cond_1

    .line 64
    .line 65
    iget-object p2, p0, Ll/sgm0$a;->a:Ll/sgm0;

    .line 66
    .line 67
    invoke-virtual {p2, p1}, Ll/sgm0;->x(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    iget-object p1, p0, Ll/sgm0$a;->a:Ll/sgm0;

    .line 74
    .line 75
    invoke-static {p1}, Ll/sgm0;->f(Ll/sgm0;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-nez p1, :cond_1

    .line 80
    .line 81
    iget-object p0, p0, Ll/sgm0$a;->a:Ll/sgm0;

    .line 82
    .line 83
    const/4 p1, 0x2

    .line 84
    const/4 p2, 0x0

    .line 85
    invoke-static {p0, p3, p2, p1, p2}, Ll/sgm0;->F(Ll/sgm0;Ljava/lang/String;Ll/x20;ILjava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void
.end method
