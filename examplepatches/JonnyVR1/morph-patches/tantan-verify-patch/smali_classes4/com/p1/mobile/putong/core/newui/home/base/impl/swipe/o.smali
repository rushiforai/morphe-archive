.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/DatingGuideData;->new_()Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->titles:Ljava/util/List;

    .line 6
    .line 7
    const-string v2, "\u4e30\u5bcc\u4e2a\u4eba\u8d44\u6599\n\u4e3a\u4f60\u63a8\u8350\u66f4\u591a\u5408\u9002\u7684\u4eba"

    .line 8
    .line 9
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->subTitles:Ljava/util/List;

    .line 13
    .line 14
    const-string v2, "\u4e2a\u4eba\u8d44\u6599\u8d8a\u5b8c\u5584\uff0c\u5339\u914d\u8d8a\u7cbe\u51c6"

    .line 15
    .line 16
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    const-string v1, "\u7acb\u5373\u5b8c\u5584"

    .line 20
    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->button:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "tantan://profile/edit?mode=dating&from=left_swipe_complete_profile"

    .line 24
    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->deeplink:Ljava/lang/String;

    .line 26
    .line 27
    const-string v1, "p_left_swipe_complete_profile"

    .line 28
    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pageId:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pictures:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    const-string p1, "https://auto.tancdn.com/v1/raw/4bb88ee6-8f5e-47fe-9ff3-2d2affccb71914.webp"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string p1, "https://auto.tancdn.com/v1/raw/51590443-bac6-4a24-8a3e-13e55a4bfaa014.webp"

    .line 43
    .line 44
    :goto_0
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/gra;->z()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkxNM042TTU3VTUyNkY2MlpaTEY3TUw1UVNGVklOVjE0IiwidyI6NDIwLCJoIjozMzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1ODUzMjgzMTUyNjkxMzN9.png"

    .line 54
    .line 55
    invoke-static {p1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pictures:Ljava/util/List;

    .line 60
    .line 61
    :cond_1
    const-string p1, "e_complete_profile"

    .line 62
    .line 63
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->buttonId:Ljava/lang/String;

    .line 64
    .line 65
    new-instance p1, Ll/b9c$b;

    .line 66
    .line 67
    invoke-direct {p1, p0}, Ll/b9c$b;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v0}, Ll/b9c$b;->c(Lcom/p1/mobile/putong/core/data/DatingGuideData;)Ll/b9c$b;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const/16 p1, 0x8c

    .line 75
    .line 76
    const/16 v0, 0x6e

    .line 77
    .line 78
    invoke-virtual {p0, p1, v0}, Ll/b9c$b;->d(II)Ll/b9c$b;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/b9c$b;->a()Ll/b9c;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Ll/b9c;->show()V

    .line 87
    .line 88
    .line 89
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 92
    .line 93
    iget-object p0, p0, Ll/mk8;->U:Ll/vxd0;

    .line 94
    .line 95
    const/4 p1, 0x1

    .line 96
    invoke-virtual {p0, p1}, Ll/vxd0;->a(I)V

    .line 97
    .line 98
    .line 99
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 102
    .line 103
    iget-object p0, p0, Ll/mk8;->T:Ll/byd0;

    .line 104
    .line 105
    invoke-static {}, Ll/pzi0;->o()J

    .line 106
    .line 107
    .line 108
    move-result-wide v0

    .line 109
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->n()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->n()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 16
    .line 17
    double-to-long v0, v0

    .line 18
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->n()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v1, 0x3

    .line 35
    if-lt v0, v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->n()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->n()Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Ll/aw90;->j0(Lcom/p1/mobile/putong/data/User;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/4 v1, 0x5

    .line 58
    if-ge v0, v1, :cond_1

    .line 59
    .line 60
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 63
    .line 64
    iget v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->P1:I

    .line 65
    .line 66
    invoke-static {}, Ll/gra;->T0()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    const/4 v2, 0x1

    .line 71
    sub-int/2addr v1, v2

    .line 72
    if-lt v0, v1, :cond_1

    .line 73
    .line 74
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/aw90;->S()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 87
    .line 88
    invoke-virtual {v0, v2}, Ll/mk8;->r3(I)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_1

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 95
    .line 96
    invoke-virtual {p1}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->n()Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 105
    .line 106
    .line 107
    :cond_1
    const/4 p0, 0x0

    .line 108
    return p0
.end method
