.class public Ll/kyt;
.super Ll/mer;
.source "SourceFile"


# instance fields
.field public g:Z

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Ll/oo2;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mer;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic K2(Ll/kyt;)Ll/oo2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kyt;->i:Ll/oo2;

    return-object p0
.end method

.method public static bridge synthetic L2(Ll/kyt;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kyt;->N2(Z)V

    return-void
.end method

.method private M2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kyt;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/yec0;->P5:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Ll/mdc0;->W2:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Ll/kyt$a;

    .line 32
    .line 33
    invoke-direct {v2, p0, v0}, Ll/kyt$a;-><init>(Ll/kyt;Lcom/p1/mobile/android/app/Dialog;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v2, Ll/mdc0;->t6:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    new-instance v2, Ll/kyt$b;

    .line 50
    .line 51
    invoke-direct {v2, p0, v0}, Ll/kyt$b;-><init>(Ll/kyt;Lcom/p1/mobile/android/app/Dialog;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 71
    .line 72
    .line 73
    return-void
.end method


# virtual methods
.method public F2(Ll/dum;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/mer;->F2(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object v0, p0, Ll/kyt;->h:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object v0, p1, Ll/dum;->h:Ll/oo2;

    .line 9
    .line 10
    iput-object v0, p0, Ll/kyt;->i:Ll/oo2;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-boolean v0, p0, Ll/kyt;->g:Z

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Ll/kyt;->g:Z

    .line 21
    .line 22
    iget-object p1, p1, Ll/dum;->l:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->switchMute()Ll/v3f$d;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0}, Ll/kyt;->M2()V

    .line 36
    .line 37
    .line 38
    new-instance p1, Ljava/util/HashMap;

    .line 39
    .line 40
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/kyt;->i:Ll/oo2;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    const-string v1, "anchorId"

    .line 52
    .line 53
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/kyt;->i:Ll/oo2;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v0, "liveId"

    .line 63
    .line 64
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    const-string p0, "e_live_room_audio_open_pop"

    .line 68
    .line 69
    const-string v0, "p_user_live_room"

    .line 70
    .line 71
    invoke-static {p0, v0, p1}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    :goto_0
    return-void
.end method

.method public final N2(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mer;->D2()Ll/dum;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/dum;->l:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->switchMute()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
