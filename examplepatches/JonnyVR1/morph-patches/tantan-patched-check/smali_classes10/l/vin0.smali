.class public Ll/vin0;
.super Ll/h3p0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/CharSequence;ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/h3p0;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Ll/vin0;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vin0;->S(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public P(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;)V
    .locals 2

    .line 1
    new-instance v0, Ll/uin0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/uin0;-><init>(Ll/vin0;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ic3;->A(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    invoke-super {p0, p1}, Ll/h3p0;->P(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Ll/htd0;->e:Ll/htd0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/ifv;

    .line 19
    .line 20
    iget-object v0, v0, Ll/ifv;->i:Ll/jxd0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v1, p0, Ll/ic3;->f:Ljava/lang/CharSequence;

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object p0, p0, Ll/ic3;->e:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, v1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;->c(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;Landroid/view/View;)V
    .locals 4

    .line 1
    sget-object p2, Ll/htd0;->e:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/ifv;

    .line 8
    .line 9
    iget-object v0, v0, Ll/ifv;->i:Ll/jxd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Ll/ic3;->a:Ll/qct;

    .line 22
    .line 23
    iget-object v2, p0, Ll/ic3;->b:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 24
    .line 25
    iget-object p0, p0, Ll/h3p0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;

    .line 26
    .line 27
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->id:I

    .line 28
    .line 29
    xor-int/lit8 v3, v0, 0x1

    .line 30
    .line 31
    invoke-static {v1, v2, p0, v3}, Ll/ptm0;->d(Ll/qct;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IZ)V

    .line 32
    .line 33
    .line 34
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ll/ifv;

    .line 39
    .line 40
    iget-object p0, p0, Ll/ifv;->i:Ll/jxd0;

    .line 41
    .line 42
    xor-int/lit8 p2, v0, 0x1

    .line 43
    .line 44
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p0, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_0

    .line 56
    .line 57
    const/4 p0, 0x1

    .line 58
    xor-int/lit8 p2, v0, 0x1

    .line 59
    .line 60
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;->d(ZZ)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vin0;->P(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
