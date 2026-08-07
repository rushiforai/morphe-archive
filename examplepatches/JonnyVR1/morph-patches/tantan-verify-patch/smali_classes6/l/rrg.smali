.class public Ll/rrg;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rrg$a;
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

.method public static a(Ll/rrg$a;)Landroid/view/View;
    .locals 6

    .line 1
    invoke-static {p0}, Ll/rrg$a;->a(Ll/rrg$a;)Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0}, Ll/rrg$a;->c(Ll/rrg$a;)Ll/n570;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {p0}, Ll/rrg$a;->e(Ll/rrg$a;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {p0}, Ll/rrg$a;->f(Ll/rrg$a;)Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-static {p0}, Ll/rrg$a;->g(Ll/rrg$a;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-static {p0}, Ll/rrg$a;->d(Ll/rrg$a;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    invoke-static/range {v0 .. v5}, Ll/rrg;->b(Lcom/p1/mobile/android/app/Act;Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {p0}, Ll/rrg$a;->b(Ll/rrg$a;)Landroid/view/ViewGroup;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    return-object v0
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;
    .locals 8

    .line 1
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/tec0;->t1:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    move-object v1, v0

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;

    .line 14
    .line 15
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 16
    .line 17
    const/4 v2, -0x2

    .line 18
    invoke-direct {v0, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 19
    .line 20
    .line 21
    const/high16 v2, 0x41400000    # 12.0f

    .line 22
    .line 23
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/high16 v4, 0x41200000    # 10.0f

    .line 32
    .line 33
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    const/4 v5, 0x0

    .line 38
    invoke-virtual {v0, v3, v2, v4, v5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    .line 43
    .line 44
    move-object v2, p0

    .line 45
    move-object v7, p1

    .line 46
    move-object v3, p2

    .line 47
    move-object v4, p3

    .line 48
    move-object v5, p4

    .line 49
    move-object v6, p5

    .line 50
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedMomentMesagesView;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;Ll/n570;)V

    .line 51
    .line 52
    .line 53
    return-object v1
.end method
