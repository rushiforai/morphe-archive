.class public Ll/p8o0$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/p8o0;-><init>(Lcom/p1/mobile/android/app/Act;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/p8o0;


# direct methods
.method public constructor <init>(Ll/p8o0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p8o0$a;->a:Ll/p8o0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-virtual {p1, p2}, Landroid/view/View;->canScrollVertically(I)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    iget-object p2, p0, Ll/p8o0$a;->a:Ll/p8o0;

    .line 11
    .line 12
    iget-object p2, p2, Ll/p8o0;->c:Ll/l8o0;

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object p2, p0, Ll/p8o0$a;->a:Ll/p8o0;

    .line 25
    .line 26
    iget-object p2, p2, Ll/p8o0;->c:Ll/l8o0;

    .line 27
    .line 28
    invoke-virtual {p2}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    check-cast p2, Ll/rwn0;

    .line 33
    .line 34
    iget p2, p2, Ll/oo2;->u:I

    .line 35
    .line 36
    if-ne p1, p2, :cond_0

    .line 37
    .line 38
    iget-object p1, p0, Ll/p8o0$a;->a:Ll/p8o0;

    .line 39
    .line 40
    iget-object p1, p1, Ll/p8o0;->c:Ll/l8o0;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Ll/rwn0;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isNormalLive()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_0

    .line 57
    .line 58
    iget-object p0, p0, Ll/p8o0$a;->a:Ll/p8o0;

    .line 59
    .line 60
    iget-object p0, p0, Ll/p8o0;->c:Ll/l8o0;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Ll/rwn0;

    .line 67
    .line 68
    iget p0, p0, Ll/oo2;->u:I

    .line 69
    .line 70
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 71
    .line 72
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->o7:I

    .line 73
    .line 74
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, p2, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_0
    return-void
.end method
