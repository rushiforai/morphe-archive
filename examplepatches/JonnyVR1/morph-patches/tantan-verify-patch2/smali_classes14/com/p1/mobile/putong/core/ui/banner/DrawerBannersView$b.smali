.class public Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;
.super Ll/cf60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cf60;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;ILcom/p1/mobile/putong/data/BannersItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->k(ILcom/p1/mobile/putong/data/BannersItem;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getCount()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->e(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Lcom/p1/mobile/putong/data/Banners;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->e(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Lcom/p1/mobile/putong/data/Banners;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BannerContent;->banners:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->k(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/kec0;->le:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/adc0;->N5:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lv/VDraweeView;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 27
    .line 28
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->e(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Lcom/p1/mobile/putong/data/Banners;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/data/BannerContent;->banners:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lcom/p1/mobile/putong/data/BannersItem;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    iget-object v3, v2, Lcom/p1/mobile/putong/data/BannersItem;->banner:Ljava/lang/String;

    .line 49
    .line 50
    sget-object v4, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader$BannerType;->drawer:Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader$BannerType;

    .line 51
    .line 52
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 53
    .line 54
    iget-object v5, v5, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 55
    .line 56
    invoke-static {v3, v4, v5}, Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader;->b(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/banner/BannerUrlLoader$BannerType;Landroid/view/View;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v1, v3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    new-instance v3, Ll/qde;

    .line 64
    .line 65
    invoke-direct {v3, p0, p2, v2}, Ll/qde;-><init>(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;ILcom/p1/mobile/putong/data/BannersItem;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    if-ne p1, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic k(ILcom/p1/mobile/putong/data/BannersItem;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->f(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Ll/y20;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    const/4 v0, 0x1

    .line 12
    if-eqz p3, :cond_0

    .line 13
    .line 14
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 15
    .line 16
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->f(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Ll/y20;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    add-int/2addr p1, v0

    .line 21
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p3, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_3

    .line 33
    .line 34
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 39
    .line 40
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->e(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Lcom/p1/mobile/putong/data/Banners;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    invoke-virtual {p1, p3, v0}, Ll/mge;->l(Lcom/p1/mobile/putong/data/Banners;Z)Z

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 52
    .line 53
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->e(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Lcom/p1/mobile/putong/data/Banners;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->e(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Lcom/p1/mobile/putong/data/Banners;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 66
    .line 67
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->h(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {p1, p3, v0, v1}, Ll/mge;->s(Lcom/p1/mobile/putong/data/BannerLoc;Lcom/p1/mobile/putong/data/Banners;I)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p2, Lcom/p1/mobile/putong/data/BannersItem;->url:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_3

    .line 81
    .line 82
    iget-object p1, p2, Lcom/p1/mobile/putong/data/BannersItem;->url:Ljava/lang/String;

    .line 83
    .line 84
    const-string p3, "tantanapp"

    .line 85
    .line 86
    invoke-virtual {p1, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    iget-object p1, p2, Lcom/p1/mobile/putong/data/BannersItem;->url:Ljava/lang/String;

    .line 93
    .line 94
    const-string p3, "tantantribe"

    .line 95
    .line 96
    invoke-virtual {p1, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 104
    .line 105
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->k(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    new-instance p1, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string p3, "tantanapp://webview?url="

    .line 112
    .line 113
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iget-object p2, p2, Lcom/p1/mobile/putong/data/BannersItem;->url:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-static {p0, p1}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    .line 134
    .line 135
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->k(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Lcom/p1/mobile/android/app/Act;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    iget-object p1, p2, Lcom/p1/mobile/putong/data/BannersItem;->url:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-static {p0, p1}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 146
    .line 147
    .line 148
    :cond_3
    return-void
.end method
