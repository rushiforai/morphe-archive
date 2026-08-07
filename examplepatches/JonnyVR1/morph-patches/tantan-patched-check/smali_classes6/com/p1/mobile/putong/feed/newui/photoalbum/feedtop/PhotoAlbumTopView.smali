.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;
    }
.end annotation


# static fields
.field public static final k:I


# instance fields
.field public a:Ll/lol;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/lol<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;

.field public c:Ll/dj70;

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Landroid/widget/LinearLayout;

.field public j:Landroid/widget/FrameLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->k:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method private getRenderFactory()Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Ll/cj70;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;

    .line 14
    .line 15
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->C(Ll/uxj0;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)Ll/lol;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->a:Ll/lol;

    return-object p0
.end method


# virtual methods
.method public final B()V
    .locals 1

    .line 1
    new-instance v0, Ll/lnh;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lnh;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/lnh;->e(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->a:Ll/lol;

    .line 10
    .line 11
    return-void
.end method

.method public final synthetic C(Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 2
    .line 3
    iget-object p1, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 12
    .line 13
    iget-object p1, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 34
    .line 35
    iget-object v1, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->getRenderFactory()Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;->a()Ll/v7i;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 54
    .line 55
    invoke-interface {p1, p0}, Ll/v7i;->i(Ll/dj70;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public E(Ll/dj70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->F()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->G()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->l0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 12
    .line 13
    iget-object v1, v1, Ll/jka;->C1:Lrx/subjects/b;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/bj70;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/bj70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->getRenderFactory()Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;->a()Ll/v7i;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 40
    .line 41
    invoke-interface {v0, p0}, Ll/v7i;->i(Ll/dj70;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final G()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->getRenderFactory()Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;->b()Ll/o7i;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ll/v7i;->i(Ll/dj70;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->getRenderFactory()Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;->d()Ll/f8i;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 23
    .line 24
    invoke-interface {v0, v1}, Ll/v7i;->i(Ll/dj70;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->getRenderFactory()Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;->c()Ll/a8i;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 36
    .line 37
    invoke-interface {v0, p0}, Ll/v7i;->i(Ll/dj70;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public K()Ljava/lang/String;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->e0:Ll/jxd0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 18
    .line 19
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 28
    .line 29
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/cl80;->k()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 50
    .line 51
    iget-object v0, v0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_0

    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->e:Landroid/view/View;

    .line 70
    .line 71
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_0

    .line 76
    .line 77
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 78
    .line 79
    iget-object v0, v0, Ll/jka;->e0:Ll/jxd0;

    .line 80
    .line 81
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 87
    .line 88
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 93
    .line 94
    .line 95
    const-string v1, "\u521d\u6765\u4e4d\u5230\uff0c\u8bf7\u591a\u5173\u7167"

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->act()Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    sget v2, Ll/k9c0;->n:I

    .line 110
    .line 111
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    filled-new-array {v1}, [I

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    const/high16 v1, 0x41200000    # 10.0f

    .line 124
    .line 125
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 138
    .line 139
    .line 140
    move-result v5

    .line 141
    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/p1/mobile/android/ui/bubble/a;->H(IIII)Lcom/p1/mobile/android/ui/bubble/a;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const/high16 v2, 0x41500000    # 13.0f

    .line 146
    .line 147
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->z(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    const/4 v1, 0x1

    .line 160
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    const-wide/16 v1, 0xbb8

    .line 165
    .line 166
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 171
    .line 172
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 173
    .line 174
    or-int/2addr v1, v2

    .line 175
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 180
    .line 181
    const/high16 v2, 0x40a00000    # 5.0f

    .line 182
    .line 183
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    const/high16 v1, 0x40000000    # 2.0f

    .line 192
    .line 193
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    neg-int v1, v1

    .line 198
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    const/high16 v1, 0x3f800000    # 1.0f

    .line 203
    .line 204
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    neg-int v1, v1

    .line 209
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->e:Landroid/view/View;

    .line 218
    .line 219
    invoke-virtual {v1, v0, p0}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    return-object p0

    .line 224
    :cond_0
    const/4 p0, 0x0

    .line 225
    return-object p0
.end method

.method public getAttention()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->i:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDistance()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->h:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getName()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProfile_pic()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->d:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTime()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->g:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public get_pic_container_labels_fl()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->B()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->z()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 5

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->d:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->v(Landroid/view/View;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->d:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->w(Landroid/view/View;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->j:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->v(Landroid/view/View;)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->j:Landroid/widget/FrameLayout;

    .line 23
    .line 24
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->w(Landroid/view/View;)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-lt v2, v0, :cond_0

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->d:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->j:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    add-int/2addr v1, v2

    .line 44
    div-int/lit8 v4, v4, 0x2

    .line 45
    .line 46
    add-int/2addr v3, v4

    .line 47
    sub-int/2addr v1, v3

    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->j:Landroid/widget/FrameLayout;

    .line 49
    .line 50
    const/high16 v3, 0x40000000    # 2.0f

    .line 51
    .line 52
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    sub-int/2addr v1, v3

    .line 57
    invoke-static {v2, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->j:Landroid/widget/FrameLayout;

    .line 61
    .line 62
    invoke-static {v1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 63
    .line 64
    .line 65
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->getRenderFactory()Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView$a;->a()Ll/v7i;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/v7i;->a()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final v(Landroid/view/View;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/view/ViewGroup;

    .line 10
    .line 11
    :goto_0
    instance-of v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Landroid/view/ViewGroup;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return p0
.end method

.method public final w(Landroid/view/View;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/view/ViewGroup;

    .line 10
    .line 11
    :goto_0
    instance-of v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Landroid/view/ViewGroup;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return p0
.end method

.method public final z()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->a:Ll/lol;

    .line 2
    .line 3
    instance-of v1, v0, Ll/lnh;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Ll/lnh;

    .line 8
    .line 9
    iget-object v1, v0, Ll/lnh;->o:Lv/VDraweeView;

    .line 10
    .line 11
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->d:Landroid/view/View;

    .line 12
    .line 13
    iget-object v1, v0, Ll/lnh;->u:Landroid/widget/TextView;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->f:Landroid/widget/TextView;

    .line 16
    .line 17
    iget-object v1, v0, Ll/lnh;->O:Lv/VText;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->g:Lv/VText;

    .line 20
    .line 21
    iget-object v1, v0, Ll/lnh;->Q:Lv/VText;

    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->h:Lv/VText;

    .line 24
    .line 25
    iget-object v1, v0, Ll/lnh;->r:Lv/AutoVDraweeView;

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->e:Landroid/view/View;

    .line 28
    .line 29
    iget-object v1, v0, Ll/lnh;->j:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->i:Landroid/widget/LinearLayout;

    .line 32
    .line 33
    iget-object v0, v0, Ll/lnh;->S:Landroid/widget/FrameLayout;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->j:Landroid/widget/FrameLayout;

    .line 36
    .line 37
    :cond_0
    return-void
.end method
