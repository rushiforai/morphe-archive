.class public interface abstract Ll/bi70;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract act()Lcom/p1/mobile/android/app/Act;
.end method

.method public b(ILjava/lang/String;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/bi70;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0, v0}, Ll/bi70;->c(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p0}, Ll/bi70;->getEntranceType()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {p0, v0, p1, v1, p2}, Ll/bi70;->k(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)[Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "e_interested_user"

    .line 18
    .line 19
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/interaction/FeedInteractionAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "p_interactcell_detail"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "p_activity"

    .line 9
    .line 10
    return-object p0
.end method

.method public abstract getEntranceType()Ljava/lang/String;
.end method

.method public k(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)[Ll/pf60;
    .locals 2

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array v0, p0, [Ll/pf60;

    .line 3
    .line 4
    const-string v1, "user_num"

    .line 5
    .line 6
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-static {v1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    const/4 v1, 0x0

    .line 15
    aput-object p2, v0, v1

    .line 16
    .line 17
    const-string p2, "interested_user_entrance_type"

    .line 18
    .line 19
    invoke-static {p2, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const/4 p3, 0x1

    .line 24
    aput-object p2, v0, p3

    .line 25
    .line 26
    const-string p2, "p_interactcell_detail"

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    const/4 p1, 0x3

    .line 41
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, [Ll/pf60;

    .line 46
    .line 47
    const-string p2, "interact_type"

    .line 48
    .line 49
    invoke-static {p2, p4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    aput-object p2, p1, p0

    .line 54
    .line 55
    return-object p1

    .line 56
    :cond_0
    return-object v0
.end method

.method public n(ILjava/lang/String;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/bi70;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0, v0}, Ll/bi70;->c(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p0}, Ll/bi70;->getEntranceType()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {p0, v0, p1, v1, p2}, Ll/bi70;->k(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)[Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "e_interested_user"

    .line 18
    .line 19
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
