.class public final Ll/w0g$c;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w0g;->r()V
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
        "l/w0g$c",
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
.field public final synthetic a:Ll/w0g;


# direct methods
.method public constructor <init>(Ll/w0g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w0g$c;->a:Ll/w0g;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static a(Ll/w0g;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/w0g;->i(Ll/w0g;Z)V

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
    iget-object p2, p0, Ll/w0g$c;->a:Ll/w0g;

    .line 8
    .line 9
    invoke-static {p2}, Ll/w0g;->f(Ll/w0g;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const-string p3, "p_navigation,see_module"

    .line 14
    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    const/high16 v0, 0x44160000    # 600.0f

    .line 22
    .line 23
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-le p2, v0, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Ll/w0g$c;->a:Ll/w0g;

    .line 30
    .line 31
    const/4 p2, 0x1

    .line 32
    invoke-static {p1, p2}, Ll/w0g;->j(Ll/w0g;Z)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/w0g$c;->a:Ll/w0g;

    .line 36
    .line 37
    invoke-static {p1, p2}, Ll/w0g;->i(Ll/w0g;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/w0g$c;->a:Ll/w0g;

    .line 41
    .line 42
    invoke-static {p1}, Ll/w0g;->d(Ll/w0g;)Ll/t0g;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    iget-object p0, p0, Ll/w0g$c;->a:Ll/w0g;

    .line 49
    .line 50
    new-instance p2, Ll/x0g;

    .line 51
    .line 52
    invoke-direct {p2, p0}, Ll/x0g;-><init>(Ll/w0g;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, p3, p2}, Ll/t0g;->o0(Ljava/lang/String;Ll/x20;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-static {p1}, Ll/zrc0;->a(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-eqz p2, :cond_1

    .line 64
    .line 65
    invoke-static {p1}, Ll/zrc0;->b(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    iget-object p1, p0, Ll/w0g$c;->a:Ll/w0g;

    .line 72
    .line 73
    invoke-static {p1}, Ll/w0g;->e(Ll/w0g;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-nez p1, :cond_1

    .line 78
    .line 79
    iget-object p0, p0, Ll/w0g$c;->a:Ll/w0g;

    .line 80
    .line 81
    invoke-static {p0}, Ll/w0g;->d(Ll/w0g;)Ll/t0g;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    if-eqz p0, :cond_1

    .line 86
    .line 87
    const/4 p1, 0x2

    .line 88
    const/4 p2, 0x0

    .line 89
    invoke-static {p0, p3, p2, p1, p2}, Ll/t0g;->p0(Ll/t0g;Ljava/lang/String;Ll/x20;ILjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    return-void
.end method
