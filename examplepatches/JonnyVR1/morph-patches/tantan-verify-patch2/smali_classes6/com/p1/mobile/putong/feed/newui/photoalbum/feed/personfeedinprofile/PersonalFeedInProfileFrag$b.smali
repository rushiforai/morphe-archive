.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$s;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->s0()Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/MotionEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/MotionEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    if-eq v0, v2, :cond_2

    .line 10
    .line 11
    const/4 p1, 0x3

    .line 12
    if-eq v0, p1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->P4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 v0, 0x0

    .line 22
    cmpl-float p1, p1, v0

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->cs()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;

    .line 41
    .line 42
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->P4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)F

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    sub-float/2addr p2, p1

    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;

    .line 48
    .line 49
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->R4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    int-to-float p1, p1

    .line 54
    cmpl-float p1, p2, p1

    .line 55
    .line 56
    if-lez p1, :cond_1

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->gc()V

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    move p2, v2

    .line 66
    goto :goto_2

    .line 67
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;

    .line 68
    .line 69
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->Q4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 74
    .line 75
    iget-object p2, p2, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 76
    .line 77
    const/4 v0, -0x1

    .line 78
    invoke-virtual {p2, v0}, Landroid/view/View;->canScrollVertically(I)Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-nez p2, :cond_3

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->kt()V

    .line 89
    .line 90
    .line 91
    move p2, v1

    .line 92
    goto :goto_1

    .line 93
    :cond_3
    move p2, v2

    .line 94
    :goto_1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 99
    .line 100
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_5

    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->kt()V

    .line 111
    .line 112
    .line 113
    move p2, v1

    .line 114
    goto :goto_2

    .line 115
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;

    .line 116
    .line 117
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->S4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;F)V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_5
    :goto_2
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->cs()Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_6

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;

    .line 136
    .line 137
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->N:Z

    .line 138
    .line 139
    if-eqz p1, :cond_6

    .line 140
    .line 141
    if-eqz p2, :cond_6

    .line 142
    .line 143
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;->Q4(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/PersonalFeedInProfileFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 148
    .line 149
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 150
    .line 151
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-interface {p0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 156
    .line 157
    .line 158
    :cond_6
    return v1
.end method

.method public e(Z)V
    .locals 0

    .line 1
    return-void
.end method
