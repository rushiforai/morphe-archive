.class public Ll/qrg;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qrg$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/android/app/Act;Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/feed/data/Attitudes;->count:I

    .line 4
    .line 5
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/nkh;->h()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-gt v0, v1, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/nkh;->i()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    :cond_0
    if-eqz p4, :cond_2

    .line 27
    .line 28
    :cond_1
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget p4, Ll/tec0;->Q:I

    .line 33
    .line 34
    invoke-virtual {p0, p4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;

    .line 39
    .line 40
    invoke-virtual {p0, p3, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->C(Ljava/lang/String;Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 41
    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_2
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget p1, Ll/tec0;->P:I

    .line 49
    .line 50
    invoke-virtual {p0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;

    .line 55
    .line 56
    invoke-virtual {p0, p3, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->w(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 57
    .line 58
    .line 59
    return-object p0
.end method

.method public static b(Ll/qrg$a;)Landroid/view/View;
    .locals 5

    .line 1
    invoke-static {p0}, Ll/qrg$a;->a(Ll/qrg$a;)Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0}, Ll/qrg$a;->c(Ll/qrg$a;)Ll/n570;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {p0}, Ll/qrg$a;->e(Ll/qrg$a;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {p0}, Ll/qrg$a;->f(Ll/qrg$a;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-static {p0}, Ll/qrg$a;->d(Ll/qrg$a;)Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-static {v0, v1, v2, v3, v4}, Ll/qrg;->a(Lcom/p1/mobile/android/app/Act;Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p0}, Ll/qrg$a;->b(Ll/qrg$a;)Landroid/view/ViewGroup;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method
