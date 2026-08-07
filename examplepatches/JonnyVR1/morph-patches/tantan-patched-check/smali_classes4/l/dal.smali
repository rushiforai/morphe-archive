.class public final Ll/dal;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/dal;->d(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/dal;->f(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Ll/dal;->e(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Ll/dal;->c(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ll/dal;->b(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/spl0;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "e_page_switch"

    .line 16
    .line 17
    const-string v2, "p_suggest_users_home_view"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ll/rj50;->W(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    iget-object v2, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 52
    .line 53
    const-string v3, "local"

    .line 54
    .line 55
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-nez v2, :cond_0

    .line 60
    .line 61
    new-instance v2, Ll/mbl;

    .line 62
    .line 63
    iget-object v3, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 66
    .line 67
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->userDimension:Z

    .line 68
    .line 69
    xor-int/lit8 v1, v1, 0x1

    .line 70
    .line 71
    invoke-direct {v2, v3, v1}, Ll/mbl;-><init>(Ljava/lang/String;Z)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/d09;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/rtk;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/rtk;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-static {}, Ll/s7a;->r()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Ll/od80;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/od80;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;)V
    .locals 3

    .line 1
    new-instance v0, Ll/cal;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cal;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/bbl;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/bbl;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/py2;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/py2;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/gra;->M2()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    new-instance v0, Ll/ich0;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/ich0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    new-instance v0, Ll/gg50;

    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_offline_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-direct {v0, v1, v2}, Ll/gg50;-><init>(Ljava/lang/String;Z)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 52
    .line 53
    .line 54
    new-instance v0, Ll/qjj;

    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_vip_upgrade_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const/4 v2, 0x1

    .line 63
    invoke-direct {v0, v1, v2}, Ll/qjj;-><init>(Ljava/lang/String;Z)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;)V
    .locals 1

    .line 1
    new-instance v0, Ll/e230;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/e230;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/s7a;->k()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/zei;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/zei;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-static {}, Ll/s7a;->z()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    new-instance v0, Ll/xnq0;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/xnq0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/yna;->E3()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    new-instance v0, Ll/oy80;

    .line 48
    .line 49
    invoke-direct {v0}, Ll/oy80;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;)V
    .locals 3

    .line 1
    new-instance v0, Ll/vi0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vi0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/vtk;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_prompt_notification_auth_popup_view:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-direct {v0, v1, v2}, Ll/vtk;-><init>(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/lz40;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/lz40;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/pb0;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/pb0;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/spl0;->z()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    new-instance v0, Ll/rl70;

    .line 47
    .line 48
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->real_person_guide:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-direct {v0, v1, v2}, Ll/rl70;-><init>(Ljava/lang/String;Z)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method
