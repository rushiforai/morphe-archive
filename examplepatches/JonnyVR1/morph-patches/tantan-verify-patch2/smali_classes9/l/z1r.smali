.class public Ll/z1r;
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

.method public static a(ZLcom/p1/mobile/putong/live/base/data/BLiveData;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "anchor"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_2

    .line 11
    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-lez p0, :cond_2

    .line 19
    .line 20
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 28
    .line 29
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isKnight:Z

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 40
    .line 41
    iget-wide p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->createdTime:J

    .line 42
    .line 43
    long-to-double p0, p0

    .line 44
    invoke-static {p0, p1}, Ll/fvk;->s(D)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    const-string p0, "user_knight_first_24h"

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_1
    const-string p0, "user_knight_not_first_24h "

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_2
    const-string p0, "user_not_knight"

    .line 57
    .line 58
    return-object p0
.end method

.method public static b(Ll/oo2;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "anchor_id"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "button_type"

    .line 14
    .line 15
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string v0, "source"

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    filled-new-array {p0, p2, p1}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "e_live_guard_info_pay"

    .line 30
    .line 31
    const-string p2, "p_user_live_room"

    .line 32
    .line 33
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static c(ZLl/oo2;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string v0, "p_anchor_live_room"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "p_user_live_room"

    .line 7
    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "anchor_id"

    .line 15
    .line 16
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v1, "source"

    .line 21
    .line 22
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    const-string v1, "user_type"

    .line 27
    .line 28
    invoke-static {p0, p3}, Ll/z1r;->a(ZLcom/p1/mobile/putong/live/base/data/BLiveData;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    filled-new-array {p1, p2, p0}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "e_live_guard_info"

    .line 41
    .line 42
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
