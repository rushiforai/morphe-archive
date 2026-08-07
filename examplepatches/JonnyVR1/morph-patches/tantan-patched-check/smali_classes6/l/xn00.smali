.class public Ll/xn00;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xn00$a;
    }
.end annotation


# static fields
.field public static d:Ljava/lang/String; = "\u8f6c\u53d1\u8bbe\u7f6e"

.field public static volatile e:Ll/xn00;


# instance fields
.field public a:Ll/xn00$a;

.field public b:[Ljava/lang/String;

.field public c:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "\u5141\u8bb8\u4ed6\u4eba\u8f6c\u53d1"

    .line 5
    .line 6
    const-string v1, "\u7981\u6b62\u4ed6\u4eba\u8f6c\u53d1"

    .line 7
    .line 8
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/xn00;->b:[Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "allow"

    .line 15
    .line 16
    const-string v1, "disallow"

    .line 17
    .line 18
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/xn00;->c:[Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a([Ll/nqy;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic b([Ll/nqy;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic c(Ll/xn00;Lcom/p1/mobile/putong/feed/data/Moment;[Ll/nqy;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/xn00;->j(Lcom/p1/mobile/putong/feed/data/Moment;[Ll/nqy;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d([Ll/nqy;Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static f()Ll/xn00;
    .locals 2

    .line 1
    sget-object v0, Ll/xn00;->e:Ll/xn00;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/xn00;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/xn00;->e:Ll/xn00;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/xn00;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/xn00;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/xn00;->e:Ll/xn00;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/xn00;->e:Ll/xn00;

    .line 27
    .line 28
    return-object v0
.end method

.method public static i(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-static {}, Ll/nt00;->k()Ll/nt00;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1, p0}, Ll/nt00;->p(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "everyone"

    .line 14
    .line 15
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-static {p0}, Ll/ksg;->h0(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    return v0
.end method


# virtual methods
.method public e(Lcom/p1/mobile/putong/feed/data/Moment;)I
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "disallow"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final g()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lv/VListCell$a;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/xn00;->b:[Ljava/lang/String;

    .line 7
    .line 8
    array-length v1, p0

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_0

    .line 11
    .line 12
    aget-object v4, p0, v2

    .line 13
    .line 14
    new-instance v3, Lv/VListCell$a;

    .line 15
    .line 16
    const/4 v8, -0x1

    .line 17
    sget v9, Ll/tec0;->s1:I

    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    const/4 v6, 0x0

    .line 21
    const/4 v7, -0x1

    .line 22
    invoke-direct/range {v3 .. v9}, Lv/VListCell$a;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;III)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-object v0
.end method

.method public h(I)Ljava/lang/String;
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/xn00;->c:[Ljava/lang/String;

    .line 4
    .line 5
    array-length v0, p0

    .line 6
    if-ge p1, v0, :cond_0

    .line 7
    .line 8
    aget-object p0, p0, p1

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, ""

    .line 12
    .line 13
    return-object p0
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/feed/data/Moment;[Ll/nqy;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p4, p0, Ll/xn00;->a:Ll/xn00$a;

    .line 2
    .line 3
    invoke-static {p4}, Ll/xn00$a;->F(Ll/xn00$a;)I

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    invoke-virtual {p0, p4}, Ll/xn00;->h(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    const/4 v0, 0x0

    .line 16
    if-eqz p4, :cond_1

    .line 17
    .line 18
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p4

    .line 22
    if-nez p4, :cond_1

    .line 23
    .line 24
    iget-object p4, p1, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 25
    .line 26
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p4

    .line 30
    if-eqz p4, :cond_0

    .line 31
    .line 32
    aget-object p0, p2, v0

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    sget-object p4, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p4, v0, p1, p0}, Ll/jka;->xd(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p3, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    new-instance p1, Ll/un00;

    .line 59
    .line 60
    invoke-direct {p1, p2}, Ll/un00;-><init>([Ll/nqy;)V

    .line 61
    .line 62
    .line 63
    new-instance p3, Ll/vn00;

    .line 64
    .line 65
    invoke-direct {p3, p2}, Ll/vn00;-><init>([Ll/nqy;)V

    .line 66
    .line 67
    .line 68
    invoke-static {p1, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    aget-object p0, p2, v0

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [Ll/nqy;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    aput-object v1, v0, v2

    .line 7
    .line 8
    new-instance v1, Ll/xn00$a;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xn00;->g()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {p0, p2}, Ll/xn00;->e(Lcom/p1/mobile/putong/feed/data/Moment;)I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    invoke-direct {v1, v3, p1, v4, p2}, Ll/xn00$a;-><init>(Ljava/util/List;Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/feed/data/Moment;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/xn00;->a:Ll/xn00$a;

    .line 22
    .line 23
    new-instance v1, Ll/nqy$a;

    .line 24
    .line 25
    invoke-direct {v1, p1}, Ll/nqy$a;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    sget-object v3, Ll/xn00;->d:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, v3}, Ll/nqy$a;->f0(Ljava/lang/CharSequence;)Ll/nqy$a;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    sget v4, Ll/lbc0;->l:I

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Ll/nqy$a;->X(I)Ll/nqy$a;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    new-instance v4, Ll/sn00;

    .line 41
    .line 42
    invoke-direct {v4, v0}, Ll/sn00;-><init>([Ll/nqy;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, v4}, Ll/nqy$a;->W(Landroid/view/View$OnClickListener;)Ll/nqy$a;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->i:I

    .line 50
    .line 51
    invoke-virtual {v3, v4}, Ll/nqy$a;->Z(I)Ll/nqy$a;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    sget v5, Ll/k9c0;->n:I

    .line 60
    .line 61
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    invoke-virtual {v3, v4}, Ll/nqy$a;->b0(I)Ll/nqy$a;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    const/high16 v4, 0x41880000    # 17.0f

    .line 70
    .line 71
    invoke-virtual {v3, v4}, Ll/nqy$a;->d0(F)Ll/nqy$a;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    const/high16 v4, 0x41a00000    # 20.0f

    .line 76
    .line 77
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    invoke-virtual {v3, v4}, Ll/nqy$a;->c0(I)Ll/nqy$a;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    new-instance v4, Ll/tn00;

    .line 86
    .line 87
    invoke-direct {v4, p0, p2, v0, p1}, Ll/tn00;-><init>(Ll/xn00;Lcom/p1/mobile/putong/feed/data/Moment;[Ll/nqy;Lcom/p1/mobile/android/app/Act;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v3, v4}, Ll/nqy$a;->Y(Landroid/view/View$OnClickListener;)Ll/nqy$a;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p2, v2}, Ll/nqy$a;->h0(I)Ll/nqy$a;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-virtual {p2, v2}, Ll/nqy$a;->i0(I)Ll/nqy$a;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 103
    .line 104
    invoke-direct {v3, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p2, v3}, Ll/nqy$a;->V(Landroidx/recyclerview/widget/RecyclerView$o;)Ll/nqy$a;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-object p0, p0, Ll/xn00;->a:Ll/xn00$a;

    .line 112
    .line 113
    invoke-virtual {p1, p0}, Ll/nqy$a;->O(Landroidx/recyclerview/widget/RecyclerView$Adapter;)Ll/nqy$a;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1}, Ll/nqy$a;->N()Ll/nqy;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    aput-object p0, v0, v2

    .line 121
    .line 122
    invoke-virtual {p0}, Ll/nqy;->g()V

    .line 123
    .line 124
    .line 125
    return-void
.end method
