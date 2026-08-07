.class public Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;->d(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/y20;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/f2h0;->a(Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/ljj;->a(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_1

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_online:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    const-string p3, "popular"

    .line 10
    .line 11
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->see_theme_unlock_pop:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 18
    .line 19
    const-string p1, "unlock_popular"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p1, "unlock_online"

    .line 23
    .line 24
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-interface {p3, p2, p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 41
    .line 42
    const-string p4, "theme_type"

    .line 43
    .line 44
    invoke-static {p4, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string p4, "greet_from"

    .line 49
    .line 50
    const-string v0, "card"

    .line 51
    .line 52
    invoke-static {p4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p4

    .line 56
    filled-new-array {p1, p4}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const/16 p4, 0x19

    .line 61
    .line 62
    invoke-static {p0, p3, p4, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->g2(Landroid/content/Context;Ljava/lang/String;I[Ll/pf60;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/y20;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;->e:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ",\t"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v2, p3, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;->d:Lv/VText;

    .line 31
    .line 32
    iget-object v1, p3, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 33
    .line 34
    iget v1, v1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-static {v1, v2}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p2}, Ll/ljj;->a(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const/4 v1, 0x0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 52
    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;->a:Lv/VDraweeView;

    .line 54
    .line 55
    invoke-virtual {p3, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 60
    .line 61
    const/4 v5, 0x2

    .line 62
    const/16 v6, 0x14

    .line 63
    .line 64
    invoke-virtual {v0, v3, v4, v5, v6}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 69
    .line 70
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;->a:Lv/VDraweeView;

    .line 71
    .line 72
    invoke-virtual {p3, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;->b:Lv/VText;

    .line 82
    .line 83
    invoke-static {}, Ll/pzi0;->o()J

    .line 84
    .line 85
    .line 86
    move-result-wide v3

    .line 87
    long-to-double v3, v3

    .line 88
    iget-object v5, p3, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 89
    .line 90
    iget-wide v5, v5, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 91
    .line 92
    sub-double/2addr v3, v5

    .line 93
    const-wide v5, 0x4166ed2400000000L    # 1.202E7

    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    cmpg-double v3, v3, v5

    .line 99
    .line 100
    if-gez v3, :cond_1

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_1
    move v2, v1

    .line 104
    :goto_1
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    new-instance v0, Ll/d2h0;

    .line 108
    .line 109
    invoke-direct {v0, p4, p3}, Ll/d2h0;-><init>(Ll/y20;Lcom/p1/mobile/putong/data/User;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    .line 114
    .line 115
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;->c:Lv/VImage;

    .line 116
    .line 117
    new-instance v0, Ll/e2h0;

    .line 118
    .line 119
    invoke-direct {v0, p0, p2, p1, p3}, Ll/e2h0;-><init>(Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 120
    .line 121
    .line 122
    invoke-static {p4, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/dbc0;->yu:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
