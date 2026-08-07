.class public Ll/xh80;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;ZLjava/lang/String;Ll/uul;)V
    .locals 2

    .line 1
    new-instance v0, Ll/ush$b;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v1, 0x2

    .line 8
    :goto_0
    invoke-direct {v0, p0, v1}, Ll/ush$b;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p4}, Ll/ush$b;->b(Ll/uul;)Ll/ush$b;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/ush$b;->d(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;)Ll/ush$b;

    .line 15
    .line 16
    .line 17
    const-class p0, Landroid/app/Dialog;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p3, p0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    const-string p2, "poi_lighten_guide"

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    const-string p2, "poi_lighten_click"

    .line 33
    .line 34
    :goto_1
    const-string p4, "poi_pop_type"

    .line 35
    .line 36
    invoke-static {p4, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iget-boolean p4, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->firstTimeShow:Z

    .line 41
    .line 42
    if-eqz p4, :cond_2

    .line 43
    .line 44
    const/4 p4, 0x0

    .line 45
    goto :goto_2

    .line 46
    :cond_2
    iget p4, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->swipeLimit:I

    .line 47
    .line 48
    :goto_2
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object p4

    .line 52
    const-string v1, "showtime"

    .line 53
    .line 54
    invoke-static {v1, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p4

    .line 58
    const-string v1, "user_segment"

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->userPostType:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    filled-new-array {p2, p4, p1}, [Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, p3, p0}, Ll/ush$b;->c(Ljava/lang/String;Ll/l4g0;)Ll/ush$b;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ll/ush$b;->a()Ll/ush;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Ll/ush;->show()V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;ZLl/uul;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ikh;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/arh;->Q:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1, p2, v0, p3}, Ll/xh80;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;ZLjava/lang/String;Ll/uul;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Ll/sqh$a;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/sqh$a;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/sqh$a;->b(Lcom/p1/mobile/android/app/Act;)Ll/sqh$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p1}, Ll/sqh$a;->e(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;)Ll/sqh$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p2}, Ll/sqh$a;->d(Z)Ll/sqh$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p3}, Ll/sqh$a;->c(Ll/uul;)Ll/sqh$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/sqh$a;->a()Ll/sqh;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/sqh;->show()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;ZLl/uul;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ikh;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/arh;->Q:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1, p2, v0, p3}, Ll/xh80;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;ZLjava/lang/String;Ll/uul;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Ll/arh$a;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/arh$a;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/arh$a;->b(Lcom/p1/mobile/android/app/Act;)Ll/arh$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p1}, Ll/arh$a;->e(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;)Ll/arh$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p2}, Ll/arh$a;->d(Z)Ll/arh$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p3}, Ll/arh$a;->c(Ll/uul;)Ll/arh$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/arh$a;->a()Ll/arh;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/arh;->show()V

    .line 39
    .line 40
    .line 41
    return-void
.end method
