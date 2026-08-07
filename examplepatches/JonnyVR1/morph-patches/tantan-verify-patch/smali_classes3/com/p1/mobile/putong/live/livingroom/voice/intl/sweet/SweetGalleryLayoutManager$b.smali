.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;Ll/qfh0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;)V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->a:I

    .line 5
    .line 6
    if-nez p2, :cond_2

    .line 7
    .line 8
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 9
    .line 10
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->e(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;)Landroidx/recyclerview/widget/o;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/o;->h(Landroidx/recyclerview/widget/RecyclerView$o;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    if-eqz p2, :cond_2

    .line 23
    .line 24
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 33
    .line 34
    iget v2, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->d:I

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    if-eq v0, v2, :cond_1

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->e:Landroid/view/View;

    .line 40
    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {v1, v3}, Landroid/view/View;->setSelected(Z)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 47
    .line 48
    iput-object p2, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->e:Landroid/view/View;

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    invoke-virtual {p2, v1}, Landroid/view/View;->setSelected(Z)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 55
    .line 56
    iput v0, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->d:I

    .line 57
    .line 58
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;)Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$e;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;)Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$e;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 71
    .line 72
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->d:I

    .line 73
    .line 74
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$e;->a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_2

    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;)Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$e;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->b:Z

    .line 93
    .line 94
    if-eqz v0, :cond_2

    .line 95
    .line 96
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->b:Z

    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 99
    .line 100
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;)Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$e;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 105
    .line 106
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->d:I

    .line 107
    .line 108
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$e;->a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V

    .line 109
    .line 110
    .line 111
    :cond_2
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 5
    .line 6
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->e(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;)Landroidx/recyclerview/widget/o;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/o;->h(Landroidx/recyclerview/widget/RecyclerView$o;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    if-eqz p2, :cond_2

    .line 19
    .line 20
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 25
    .line 26
    .line 27
    move-result p3

    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 29
    .line 30
    iget v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->d:I

    .line 31
    .line 32
    if-eq p3, v1, :cond_2

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->e:Landroid/view/View;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 43
    .line 44
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->e:Landroid/view/View;

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    invoke-virtual {p2, v0}, Landroid/view/View;->setSelected(Z)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 51
    .line 52
    iput p3, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->d:I

    .line 53
    .line 54
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;)Z

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    if-nez p3, :cond_1

    .line 59
    .line 60
    iget p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->a:I

    .line 61
    .line 62
    if-eqz p3, :cond_1

    .line 63
    .line 64
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->b:Z

    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 68
    .line 69
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;)Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$e;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    if-eqz p3, :cond_2

    .line 74
    .line 75
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 76
    .line 77
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;)Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$e;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$b;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;

    .line 82
    .line 83
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;->d:I

    .line 84
    .line 85
    invoke-interface {p3, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$e;->a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V

    .line 86
    .line 87
    .line 88
    :cond_2
    return-void
.end method
