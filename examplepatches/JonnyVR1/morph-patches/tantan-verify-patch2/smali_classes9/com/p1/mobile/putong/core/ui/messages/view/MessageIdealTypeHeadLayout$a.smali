.class public Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Lv/AutoVDraweeView;

.field public b:Lv/VText;

.field public c:Landroid/widget/FrameLayout;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;Landroid/view/View;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;->d:Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    sget p1, Ll/edc0;->b3:I

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lv/AutoVDraweeView;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;->a:Lv/AutoVDraweeView;

    .line 15
    .line 16
    sget p1, Ll/edc0;->c3:I

    .line 17
    .line 18
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lv/VText;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;->b:Lv/VText;

    .line 25
    .line 26
    sget p1, Ll/edc0;->d3:I

    .line 27
    .line 28
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Landroid/widget/FrameLayout;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;->c:Landroid/widget/FrameLayout;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Media;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    move p2, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/high16 p2, 0x41000000    # 8.0f

    .line 9
    .line 10
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    :goto_0
    invoke-static {v0, p2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;->b:Lv/VText;

    .line 18
    .line 19
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    const/4 p1, 0x0

    .line 39
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_3

    .line 44
    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;->a:Lv/AutoVDraweeView;

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p2, v0}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_3
    iget-object p2, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 53
    .line 54
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-nez p2, :cond_4

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Ljava/lang/String;

    .line 75
    .line 76
    invoke-interface {p2, p1}, Ll/r97;->V3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-eqz p2, :cond_4

    .line 85
    .line 86
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;->b:Lv/VText;

    .line 87
    .line 88
    const/4 v0, 0x1

    .line 89
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout$a;->b:Lv/VText;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    :cond_4
    return-void
.end method
