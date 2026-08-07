.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/LinearLayout;",
        "Ll/iam<",
        "Ll/igk0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

.field public d:Ll/igk0;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/p9t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jgk0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/jgk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->g:Ll/y20;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/jgk0;

    invoke-direct {p1, p0}, Ll/jgk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->g:Ll/y20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/jgk0;

    invoke-direct {p1, p0}, Ll/jgk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->g:Ll/y20;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;Ll/p9t;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->j(Ll/p9t;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;Ll/p9t;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->k(Ll/p9t;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->l()V

    return-void
.end method

.method private synthetic l()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->d:Ll/igk0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/igk0;->S3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mgk0;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->b:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->u()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->u()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public e(Ll/igk0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->d:Ll/igk0;

    .line 2
    .line 3
    return-void
.end method

.method public f(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->m()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->l()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->g:Ll/y20;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k(Ll/y20;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->m()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->l()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->g:Ll/y20;

    .line 50
    .line 51
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k(Ll/y20;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 56
    .line 57
    if-eqz p1, :cond_4

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->g:Ll/y20;

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k(Ll/y20;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    if-eqz v0, :cond_4

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->m()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->l()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_3

    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 82
    .line 83
    if-eqz p1, :cond_4

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->g:Ll/y20;

    .line 86
    .line 87
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k(Ll/y20;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->g:Ll/y20;

    .line 94
    .line 95
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->k(Ll/y20;)V

    .line 96
    .line 97
    .line 98
    :cond_4
    return-void
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->b:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->m()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->m()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/igk0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e(Ll/igk0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final synthetic j(Ll/p9t;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->d:Ll/igk0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/igk0;->T3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic k(Ll/p9t;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->d:Ll/igk0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/igk0;->N3(Ll/p9t;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final m()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 10
    .line 11
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public n(Ll/p9t;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v3, Ll/kgk0;

    .line 9
    .line 10
    invoke-direct {v3, p0}, Ll/kgk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;)V

    .line 11
    .line 12
    .line 13
    new-instance v4, Ll/lgk0;

    .line 14
    .line 15
    invoke-direct {v4, p0}, Ll/lgk0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->m()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 23
    .line 24
    const/4 v8, 0x1

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->g:Ll/y20;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->d:Ll/igk0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    const/4 v6, 0x1

    .line 36
    move-object v2, p1

    .line 37
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->z(Ll/p9t;Ll/y20;Ll/x20;Ll/y20;ZLjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 41
    .line 42
    invoke-static {p1, v8}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    move-object v2, p1

    .line 47
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_2

    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 54
    .line 55
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->p()V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 65
    .line 66
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->g:Ll/y20;

    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->d:Ll/igk0;

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    const/4 v6, 0x1

    .line 75
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->z(Ll/p9t;Ll/y20;Ll/x20;Ll/y20;ZLjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 79
    .line 80
    invoke-static {p1, v8}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    :goto_0
    invoke-virtual {v2}, Ll/p9t;->g()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string v0, "follow"

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_3

    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->d:Ll/igk0;

    .line 96
    .line 97
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->d:Ll/igk0;

    .line 102
    .line 103
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v1, "liveMessage_notification"

    .line 108
    .line 109
    invoke-static {p1, v0, v1}, Ll/i35;->d(Ljava/lang/String;Ll/oo2;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_3
    invoke-virtual {v2}, Ll/p9t;->g()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    const-string v0, "accompany"

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-eqz p1, :cond_4

    .line 124
    .line 125
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->d:Ll/igk0;

    .line 126
    .line 127
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-static {p1}, Ll/i35;->b(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->d:Ll/igk0;

    .line 135
    .line 136
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->d:Ll/igk0;

    .line 141
    .line 142
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-static {p1, p0, v2}, Ll/i35;->h(Ljava/lang/String;Ll/oo2;Ll/p9t;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->b:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 14
    .line 15
    return-void
.end method

.method public final p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 4
    .line 5
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->e:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationView;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
