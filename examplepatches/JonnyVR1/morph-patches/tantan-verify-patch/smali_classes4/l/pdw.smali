.class public Ll/pdw;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Ll/few;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/uew;",
        ">;",
        "Ll/few;"
    }
.end annotation


# instance fields
.field public a:Ll/jxd0;

.field public final b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

.field public e:Ll/l4g0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "love_letter_func_dialog_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/pdw;->a:Ll/jxd0;

    .line 34
    .line 35
    iput-object p1, p0, Ll/pdw;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic e0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Ll/pdw;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pdw;->q0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic g0(Ll/pdw;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pdw;->p0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/pdw;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pdw;->t0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic i0(Ll/pdw;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pdw;->r0(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k0(Ll/pdw;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pdw;->o0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m0(Ll/pdw;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/pdw;->s0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method private synthetic o0(Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p1, p1, Ll/dkb;->U1:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/pdw;->n0(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic p0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pdw;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic q0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/pdw;->e:Ll/l4g0;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Ll/pdw;->e:Ll/l4g0;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method


# virtual methods
.method public F()V
    .locals 2

    .line 1
    const-string v0, "e_search_entrance"

    .line 2
    .line 3
    const-string v1, "p_love_letter"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/pdw;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/loveletter/search/LoveLetterSearchAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public R(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Ll/pdw;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 13
    .line 14
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/dkb;->da()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/gdw;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/gdw;-><init>(Ll/pdw;)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Ll/hdw;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Ll/hdw;-><init>(Ll/pdw;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/pdw;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/idw;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/idw;-><init>(Ll/pdw;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final n0(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/pdw;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->display:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Ll/pdw;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iput-object p1, p0, Ll/pdw;->d:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 20
    .line 21
    iget-object v0, p0, Ll/pdw;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "extra_msg_id"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "extra_user_id"

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-nez p1, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Ll/pdw;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->new_()Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->id:Ljava/lang/String;

    .line 64
    .line 65
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->otherUser:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, v2, p1}, Ll/pdw;->x0(Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->message:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 72
    .line 73
    if-eqz v0, :cond_5

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->otherUser:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_5

    .line 82
    .line 83
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 86
    .line 87
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->message:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->otherUser:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    if-nez v0, :cond_4

    .line 96
    .line 97
    iget-object p0, p0, Ll/pdw;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_4
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->message:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 104
    .line 105
    invoke-virtual {p0, p1, v0}, Ll/pdw;->x0(Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_5
    invoke-virtual {p0}, Ll/pdw;->y0()V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_love_letter"

    .line 2
    .line 3
    return-object p0
.end method

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pdw;->c:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/g;->an(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/mdw;

    .line 14
    .line 15
    invoke-direct {v2}, Ll/mdw;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v3, Ll/ndw;

    .line 19
    .line 20
    invoke-direct {v3, p0, v0}, Ll/ndw;-><init>(Ll/pdw;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Ll/pdw;->c:Ljava/lang/String;

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final synthetic r0(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pdw;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic s0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 7

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    const-string p0, "\u5f53\u524d\u4f1a\u8bdd\u5df2\u79fb\u9664\uff0c\u6709\u65b0\u6d88\u606f\u65f6\u4f1a\u518d\u6b21\u5c55\u793a"

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Ll/pdw;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 10
    .line 11
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v4, -0x1

    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    move-object v5, p2

    .line 18
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->N2(Landroid/content/Context;Ljava/lang/String;ZZILjava/lang/String;Z)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Ll/pdw;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterAct;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic t0(Ll/vg60;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Ll/pdw;->c:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/uew;

    .line 12
    .line 13
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 14
    .line 15
    iget-object v1, p0, Ll/pdw;->d:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 16
    .line 17
    invoke-virtual {v0, p1, v1}, Ll/uew;->n(Ljava/util/List;Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/pdw;->a:Ll/jxd0;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Ll/pdw;->a:Ll/jxd0;

    .line 35
    .line 36
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p0, Ll/uew;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/uew;->q()V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public u0(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    const-string v0, "e_view_letter"

    .line 2
    .line 3
    const-string v1, "p_letter_sent"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Me()Ll/mm6;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/odw;

    .line 32
    .line 33
    invoke-direct {v1, p0, p2, p1}, Ll/odw;-><init>(Ll/pdw;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final x0(Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/uew;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->id:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p2, v2}, Ll/uew;->m(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    const-string v0, "p_letter_sent"

    .line 21
    .line 22
    invoke-static {v0, p2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iput-object p2, p0, Ll/pdw;->e:Ll/l4g0;

    .line 27
    .line 28
    new-instance v0, Ll/pf60;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 31
    .line 32
    const-string v1, "replied"

    .line 33
    .line 34
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    const-string p1, "1"

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-string p1, "0"

    .line 44
    .line 45
    :goto_0
    const-string v1, "is_reply"

    .line 46
    .line 47
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    filled-new-array {v0}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p2, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/pdw;->e:Ll/l4g0;

    .line 58
    .line 59
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final y0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/g;->X1:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->X1:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/jdw;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/jdw;-><init>(Ll/pdw;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    const-string v1, ""

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->an(Ljava/lang/String;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/kdw;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/kdw;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance v2, Ll/ldw;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/ldw;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v1, "p_love_letter"

    .line 69
    .line 70
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Ll/pdw;->e:Ll/l4g0;

    .line 75
    .line 76
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
