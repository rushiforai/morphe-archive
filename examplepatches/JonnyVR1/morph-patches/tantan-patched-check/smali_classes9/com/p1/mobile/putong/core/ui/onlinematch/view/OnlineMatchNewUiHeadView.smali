.class public Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;
.super Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public B:I

.field public C:Ljava/lang/String;

.field public D:Ljava/lang/CharSequence;

.field public E:Ljava/lang/CharSequence;

.field public F:Ljava/lang/CharSequence;

.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VDraweeView;

.field public f:Lv/VImage;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/VLinear;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/LinearLayout;

.field public n:Landroid/widget/LinearLayout;

.field public o:Lv/VImage;

.field public p:Lv/VText;

.field public q:Landroid/widget/LinearLayout;

.field public r:Lv/VImage;

.field public s:Lv/VText;

.field public t:Landroid/widget/LinearLayout;

.field public u:Lv/VImage;

.field public v:Lv/VText;

.field public w:Landroid/widget/LinearLayout;

.field public x:Lv/VImage;

.field public y:Lv/VText;

.field public z:Lv/VRelative;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B:I

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->C:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->D:Ljava/lang/CharSequence;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->E:Ljava/lang/CharSequence;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->F:Ljava/lang/CharSequence;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseHeadView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B:I

    .line 20
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->C:Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->D:Ljava/lang/CharSequence;

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->E:Ljava/lang/CharSequence;

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->F:Ljava/lang/CharSequence;

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Tag;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "places"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "personality"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private getCheckTxt()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "icebreaking_check_txt"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string p0, "content"

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    return-object p0

    .line 36
    :catch_0
    :cond_1
    :goto_0
    const-string p0, "\u67e5\u770b\u66f4\u591a"

    .line 37
    .line 38
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->K(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "sports"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/data/Tag;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "literature"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic l(Ljava/util/List;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    new-instance v0, Ll/gv50;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/gv50;-><init>(Lcom/p1/mobile/putong/data/Tag;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "music"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/data/Tag;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->L(Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/data/Tag;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->N(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic r(Ljava/util/List;Lcom/p1/mobile/putong/data/Tag;Lcom/p1/mobile/putong/data/Tag;)I
    .locals 1

    .line 1
    new-instance v0, Ll/cv50;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/cv50;-><init>(Lcom/p1/mobile/putong/data/Tag;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    new-instance v0, Ll/dv50;

    .line 11
    .line 12
    invoke-direct {v0, p2}, Ll/dv50;-><init>(Lcom/p1/mobile/putong/data/Tag;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sub-int/2addr p1, p0

    .line 20
    return p1
.end method

.method public static synthetic s(Ljava/util/List;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    new-instance v0, Ll/ev50;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ev50;-><init>(Lcom/p1/mobile/putong/data/Tag;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic u(Ll/y20;Ll/z80;)V
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p1}, Ll/z80;->c()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/z80;->c()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-virtual {p1}, Ll/z80;->f()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/z80;->f()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic v(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/data/Tag;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic x(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    new-instance v0, Ll/fv50;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/fv50;-><init>(Lcom/p1/mobile/putong/data/Tag;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method


# virtual methods
.method public final A(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x3

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    :goto_0
    if-ge v1, v0, :cond_3

    .line 19
    .line 20
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B:I

    .line 21
    .line 22
    const/16 v3, 0x8

    .line 23
    .line 24
    if-lt v2, v3, :cond_1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-nez v2, :cond_2

    .line 36
    .line 37
    const-string v2, "\u3001"

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    :cond_2
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B:I

    .line 43
    .line 44
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B:I

    .line 47
    .line 48
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Lcom/p1/mobile/putong/data/Tag;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    :goto_1
    return-void
.end method

.method public final B(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    const-string p1, "female"

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "\u5979"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "\u4ed6"

    .line 15
    .line 16
    return-object p0
.end method

.method public final C(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 5

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const-string v3, "default"

    .line 33
    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_1

    .line 47
    .line 48
    :cond_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 55
    .line 56
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 68
    .line 69
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 70
    .line 71
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 77
    .line 78
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 79
    .line 80
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-nez v2, :cond_3

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-nez v2, :cond_3

    .line 100
    .line 101
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-eqz v2, :cond_3

    .line 106
    .line 107
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 108
    .line 109
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_3

    .line 114
    .line 115
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 116
    .line 117
    iget v1, v1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 118
    .line 119
    const/16 v2, 0x3e8

    .line 120
    .line 121
    if-ge v1, v2, :cond_2

    .line 122
    .line 123
    new-instance v1, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    sget-object v2, Ll/q8g0;->b:Ljava/text/DecimalFormat;

    .line 129
    .line 130
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 131
    .line 132
    iget v3, v3, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 133
    .line 134
    int-to-long v3, v3

    .line 135
    invoke-virtual {v2, v3, v4}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 143
    .line 144
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->U4:I

    .line 145
    .line 146
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    goto :goto_0

    .line 158
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .line 162
    .line 163
    sget-object v2, Ll/q8g0;->b:Ljava/text/DecimalFormat;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 166
    .line 167
    iget v3, v3, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 168
    .line 169
    int-to-float v3, v3

    .line 170
    const/high16 v4, 0x447a0000    # 1000.0f

    .line 171
    .line 172
    div-float/2addr v3, v4

    .line 173
    float-to-double v3, v3

    .line 174
    invoke-virtual {v2, v3, v4}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 182
    .line 183
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->i4:I

    .line 184
    .line 185
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    :goto_0
    const-string v2, "\u5c45\u4f4f\u5728"

    .line 197
    .line 198
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    const-string v0, "("

    .line 205
    .line 206
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string v0, ")"

    .line 213
    .line 214
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 218
    .line 219
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 220
    .line 221
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_5

    .line 226
    .line 227
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    if-nez v0, :cond_4

    .line 236
    .line 237
    const-string v0, ", "

    .line 238
    .line 239
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    :cond_4
    const-string v0, "\u6765\u81ea"

    .line 243
    .line 244
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    :cond_5
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object p0

    .line 254
    return-object p0
.end method

.method public final D(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [Ljava/lang/CharSequence;

    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->F(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const/4 v2, 0x0

    .line 9
    aput-object v1, v0, v2

    .line 10
    .line 11
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->r:Lv/VImage;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->r:Lv/VImage;

    .line 26
    .line 27
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    sget p1, Ll/ibc0;->G2:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    sget p1, Ll/ibc0;->D2:I

    .line 45
    .line 46
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 47
    .line 48
    .line 49
    :cond_1
    aget-object p0, v0, v2

    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_2
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_3

    .line 57
    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v3, "\u4f60\u4eec\u66fe\u7ecf\u5728 "

    .line 61
    .line 62
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v3, " \u64e6\u80a9\u800c\u8fc7"

    .line 69
    .line 70
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {p0, v1, p3}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->S(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    aput-object p3, v0, v2

    .line 82
    .line 83
    :cond_3
    aget-object p3, v0, v2

    .line 84
    .line 85
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result p3

    .line 89
    if-nez p3, :cond_4

    .line 90
    .line 91
    aget-object p0, v0, v2

    .line 92
    .line 93
    return-object p0

    .line 94
    :cond_4
    iget-object p3, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 95
    .line 96
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 97
    .line 98
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p3

    .line 102
    if-eqz p3, :cond_5

    .line 103
    .line 104
    iget-object p3, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 105
    .line 106
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 107
    .line 108
    iget p3, p3, Lcom/p1/mobile/putong/data/Passby;->count:I

    .line 109
    .line 110
    if-lez p3, :cond_5

    .line 111
    .line 112
    new-instance p3, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v1, "\u4f60\u4eec\u66fe\u64e6\u80a9\u800c\u8fc7\u8fc7 "

    .line 115
    .line 116
    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 122
    .line 123
    iget v1, v1, Lcom/p1/mobile/putong/data/Passby;->count:I

    .line 124
    .line 125
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v1, " \u6b21"

    .line 129
    .line 130
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p3

    .line 137
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 140
    .line 141
    iget v1, v1, Lcom/p1/mobile/putong/data/Passby;->count:I

    .line 142
    .line 143
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {p0, p3, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->S(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    aput-object p3, v0, v2

    .line 152
    .line 153
    :cond_5
    aget-object p3, v0, v2

    .line 154
    .line 155
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result p3

    .line 159
    if-nez p3, :cond_6

    .line 160
    .line 161
    aget-object p0, v0, v2

    .line 162
    .line 163
    return-object p0

    .line 164
    :cond_6
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->O(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    return-object p0
.end method

.method public final E(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 7
    .line 8
    const-string p2, ""

    .line 9
    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p3, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    new-instance v0, Lcom/baidu/mapapi/model/LatLng;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Passby;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 23
    .line 24
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 25
    .line 26
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/baidu/mapapi/model/LatLng;-><init>(DD)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Ll/xc2;->b(Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-static {p1, v0}, Ll/fmj;->c(Ll/ner;Z)Ll/fmj;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    if-nez p0, :cond_2

    .line 39
    .line 40
    invoke-interface {p3, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    iget-wide v3, p0, Lcom/baidu/mapapi/model/LatLng;->latitude:D

    .line 45
    .line 46
    iget-wide v5, p0, Lcom/baidu/mapapi/model/LatLng;->longitude:D

    .line 47
    .line 48
    new-instance v7, Ll/av50;

    .line 49
    .line 50
    invoke-direct {v7, p3}, Ll/av50;-><init>(Ll/y20;)V

    .line 51
    .line 52
    .line 53
    new-instance v8, Ll/bv50;

    .line 54
    .line 55
    invoke-direct {v8}, Ll/bv50;-><init>()V

    .line 56
    .line 57
    .line 58
    move-object v2, p1

    .line 59
    invoke-virtual/range {v1 .. v8}, Ll/fmj;->e(Ll/ner;DDLl/y20;Ll/y20;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final F(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "sports"

    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    const-string v1, "music"

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    const-string v1, "places"

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    const-string v1, "food"

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    const-string v1, "movies"

    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 34
    .line 35
    new-instance v1, Ll/kv50;

    .line 36
    .line 37
    invoke-direct {v1, v0}, Ll/kv50;-><init>(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p2, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    const-string v2, ""

    .line 49
    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    return-object v2

    .line 53
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 56
    .line 57
    new-instance v1, Ll/lv50;

    .line 58
    .line 59
    invoke-direct {v1, v0}, Ll/lv50;-><init>(Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    return-object v2

    .line 73
    :cond_1
    new-instance v1, Ll/mv50;

    .line 74
    .line 75
    invoke-direct {v1, v0}, Ll/mv50;-><init>(Ljava/util/List;)V

    .line 76
    .line 77
    .line 78
    invoke-static {p1, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p2, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 82
    .line 83
    .line 84
    new-instance v0, Ll/nv50;

    .line 85
    .line 86
    invoke-direct {v0, p1}, Ll/nv50;-><init>(Ljava/util/ArrayList;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p2, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    if-eqz p2, :cond_2

    .line 98
    .line 99
    return-object v2

    .line 100
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v0, "\u4f60\u4eec\u90fd\u559c\u6b22\uff1a"

    .line 103
    .line 104
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    .line 111
    .line 112
    const/4 v1, 0x0

    .line 113
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-ge v1, v2, :cond_4

    .line 118
    .line 119
    if-eqz v1, :cond_3

    .line 120
    .line 121
    const-string v2, "\u3001"

    .line 122
    .line 123
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    :cond_3
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    check-cast v2, Lcom/p1/mobile/putong/data/Tag;

    .line 131
    .line 132
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    add-int/lit8 v1, v1, 0x1

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_4
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p2

    .line 151
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->S(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    return-object p0
.end method

.method public final G(Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B:I

    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 12
    .line 13
    iget-boolean v2, v2, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 14
    .line 15
    const-string v3, "\u5b66\u751f"

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B:I

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B:I

    .line 24
    .line 25
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    goto/16 :goto_1

    .line 29
    .line 30
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const-string v2, "\u5176\u5b83"

    .line 39
    .line 40
    const-string v4, "\u5176\u4ed6"

    .line 41
    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_1

    .line 55
    .line 56
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_1

    .line 67
    .line 68
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_1

    .line 79
    .line 80
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B:I

    .line 81
    .line 82
    add-int/lit8 v1, v1, 0x1

    .line 83
    .line 84
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B:I

    .line 85
    .line 86
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 89
    .line 90
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 96
    .line 97
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 98
    .line 99
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-nez v1, :cond_3

    .line 106
    .line 107
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 108
    .line 109
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 110
    .line 111
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-nez v1, :cond_3

    .line 118
    .line 119
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 122
    .line 123
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_3

    .line 130
    .line 131
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 132
    .line 133
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 134
    .line 135
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-nez v1, :cond_3

    .line 142
    .line 143
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-nez v1, :cond_2

    .line 148
    .line 149
    const-string v1, "\u00b7"

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B:I

    .line 156
    .line 157
    add-int/lit8 v1, v1, 0x1

    .line 158
    .line 159
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B:I

    .line 160
    .line 161
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 162
    .line 163
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 164
    .line 165
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    :cond_3
    :goto_1
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 171
    .line 172
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 173
    .line 174
    new-instance v2, Ll/ov50;

    .line 175
    .line 176
    invoke-direct {v2}, Ll/ov50;-><init>()V

    .line 177
    .line 178
    .line 179
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->A(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 184
    .line 185
    .line 186
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 187
    .line 188
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 189
    .line 190
    new-instance v2, Ll/pv50;

    .line 191
    .line 192
    invoke-direct {v2}, Ll/pv50;-><init>()V

    .line 193
    .line 194
    .line 195
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->A(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 200
    .line 201
    .line 202
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 203
    .line 204
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 205
    .line 206
    new-instance v2, Ll/xu50;

    .line 207
    .line 208
    invoke-direct {v2}, Ll/xu50;-><init>()V

    .line 209
    .line 210
    .line 211
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->A(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 216
    .line 217
    .line 218
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 219
    .line 220
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 221
    .line 222
    new-instance v2, Ll/yu50;

    .line 223
    .line 224
    invoke-direct {v2}, Ll/yu50;-><init>()V

    .line 225
    .line 226
    .line 227
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->A(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 232
    .line 233
    .line 234
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 235
    .line 236
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 237
    .line 238
    new-instance v2, Ll/zu50;

    .line 239
    .line 240
    invoke-direct {v2}, Ll/zu50;-><init>()V

    .line 241
    .line 242
    .line 243
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->A(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    if-eqz v1, :cond_4

    .line 259
    .line 260
    const-string p0, ""

    .line 261
    .line 262
    return-object p0

    .line 263
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 264
    .line 265
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    const-string p1, "\u7684\u6807\u7b7e\uff1a"

    .line 276
    .line 277
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->S(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    return-object p0
.end method

.method public final H(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/data/Answer;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ll/kua;->o3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Question;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v0, 0x0

    .line 34
    :goto_0
    if-nez v0, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    move-object p2, v0

    .line 38
    :goto_1
    if-nez p2, :cond_2

    .line 39
    .line 40
    const-string p0, ""

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v1, "\u548c"

    .line 46
    .line 47
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->B(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p0, "\u804a\u804a: "

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0
.end method

.method public final I(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 4
    .line 5
    const-string v0, "unknown_"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 20
    .line 21
    invoke-static {p0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    const-string p0, ""

    .line 27
    .line 28
    return-object p0
.end method

.method public J(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p2, "messages_thumbnail_left"

    .line 12
    .line 13
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p2, p1}, Ll/clz;->w6(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string p0, "e_match_person_quickchat"

    .line 19
    .line 20
    const-string p1, "p_chat_view"

    .line 21
    .line 22
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic L(Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/data/Question;

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p0, p2, p3, p4, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->R(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->e:Ll/wzh0;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-virtual {v0, v1, v1, v2}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v5

    .line 11
    new-instance v3, Ll/iv50;

    .line 12
    .line 13
    move-object v4, p0

    .line 14
    move-object v6, p1

    .line 15
    move-object v7, p2

    .line 16
    move-object v8, p3

    .line 17
    invoke-direct/range {v3 .. v8}, Ll/iv50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v3}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->C(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->C:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->n:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->p:Lv/VText;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->C:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->n:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->C:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    xor-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->C:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->C:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    invoke-virtual {p0, p2, p1, p4}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->D(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->D:Ljava/lang/CharSequence;

    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->q:Landroid/widget/LinearLayout;

    .line 61
    .line 62
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    const-string p4, "\n"

    .line 67
    .line 68
    const-string v1, ""

    .line 69
    .line 70
    if-eqz p2, :cond_2

    .line 71
    .line 72
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->s:Lv/VText;

    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->D:Ljava/lang/CharSequence;

    .line 75
    .line 76
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->q:Landroid/widget/LinearLayout;

    .line 80
    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->D:Ljava/lang/CharSequence;

    .line 82
    .line 83
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    xor-int/lit8 v2, v2, 0x1

    .line 88
    .line 89
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->D:Ljava/lang/CharSequence;

    .line 94
    .line 95
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    if-nez p2, :cond_4

    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    if-eqz p2, :cond_3

    .line 110
    .line 111
    move-object p2, v1

    .line 112
    goto :goto_1

    .line 113
    :cond_3
    move-object p2, p4

    .line 114
    :goto_1
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->D:Ljava/lang/CharSequence;

    .line 118
    .line 119
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    :cond_4
    :goto_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->G(Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->E:Ljava/lang/CharSequence;

    .line 127
    .line 128
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->t:Landroid/widget/LinearLayout;

    .line 129
    .line 130
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    if-eqz p2, :cond_5

    .line 135
    .line 136
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->v:Lv/VText;

    .line 137
    .line 138
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->E:Ljava/lang/CharSequence;

    .line 139
    .line 140
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->t:Landroid/widget/LinearLayout;

    .line 144
    .line 145
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->E:Ljava/lang/CharSequence;

    .line 146
    .line 147
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    xor-int/lit8 v2, v2, 0x1

    .line 152
    .line 153
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 154
    .line 155
    .line 156
    goto :goto_4

    .line 157
    :cond_5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->E:Ljava/lang/CharSequence;

    .line 158
    .line 159
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    if-nez p2, :cond_7

    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p2

    .line 169
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 170
    .line 171
    .line 172
    move-result p2

    .line 173
    if-eqz p2, :cond_6

    .line 174
    .line 175
    move-object p2, v1

    .line 176
    goto :goto_3

    .line 177
    :cond_6
    move-object p2, p4

    .line 178
    :goto_3
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->E:Ljava/lang/CharSequence;

    .line 182
    .line 183
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    :cond_7
    :goto_4
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->H(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/CharSequence;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->F:Ljava/lang/CharSequence;

    .line 191
    .line 192
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->w:Landroid/widget/LinearLayout;

    .line 193
    .line 194
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    if-eqz p1, :cond_8

    .line 199
    .line 200
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->y:Lv/VText;

    .line 201
    .line 202
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->F:Ljava/lang/CharSequence;

    .line 203
    .line 204
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->w:Landroid/widget/LinearLayout;

    .line 208
    .line 209
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->F:Ljava/lang/CharSequence;

    .line 210
    .line 211
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    xor-int/lit8 p0, p0, 0x1

    .line 216
    .line 217
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 218
    .line 219
    .line 220
    return-void

    .line 221
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->F:Ljava/lang/CharSequence;

    .line 222
    .line 223
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    if-nez p1, :cond_a

    .line 228
    .line 229
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    if-eqz p1, :cond_9

    .line 238
    .line 239
    move-object p4, v1

    .line 240
    :cond_9
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->F:Ljava/lang/CharSequence;

    .line 244
    .line 245
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    :cond_a
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, ""

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-nez p2, :cond_1

    .line 33
    .line 34
    return-object v1

    .line 35
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->r:Lv/VImage;

    .line 36
    .line 37
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_3

    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->r:Lv/VImage;

    .line 44
    .line 45
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    sget v0, Ll/ibc0;->C2:I

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    sget v0, Ll/ibc0;->z2:I

    .line 63
    .line 64
    :goto_0
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v0, "\u4f60\u4eec\u90fd\u5728 "

    .line 70
    .line 71
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v0, " \u4e0a\u8fc7\u5b66"

    .line 84
    .line 85
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->S(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0
.end method

.method public final P(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ll/ina;->z3(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->J(Lcom/p1/mobile/putong/data/User;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v0, v2

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    move v0, v1

    .line 23
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->i:Lv/VText;

    .line 24
    .line 25
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_3

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->J(Lcom/p1/mobile/putong/data/User;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->i:Lv/VText;

    .line 36
    .line 37
    if-eqz v3, :cond_2

    .line 38
    .line 39
    iget-object v3, p2, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_2
    iget-object v3, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    :goto_2
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->i:Lv/VText;

    .line 51
    .line 52
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->k:Lv/VText;

    .line 60
    .line 61
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    if-nez v0, :cond_4

    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->k:Lv/VText;

    .line 70
    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v3, " \u00b7 "

    .line 74
    .line 75
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v3, p2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 79
    .line 80
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v3, "\u5c81"

    .line 84
    .line 85
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->k:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 98
    .line 99
    .line 100
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->c:Lv/VDraweeView;

    .line 101
    .line 102
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_5

    .line 107
    .line 108
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->c:Lv/VDraweeView;

    .line 111
    .line 112
    invoke-static {p1}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 121
    .line 122
    .line 123
    :cond_5
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->J(Lcom/p1/mobile/putong/data/User;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-nez p1, :cond_6

    .line 128
    .line 129
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->j:Lv/VText;

    .line 130
    .line 131
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-eqz p1, :cond_6

    .line 136
    .line 137
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->j:Lv/VText;

    .line 138
    .line 139
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->I(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    :cond_6
    return-void
.end method

.method public final Q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->J(Lcom/p1/mobile/putong/data/User;)Z

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
    new-instance v0, Ll/hv50;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1, p2, p3}, Ll/hv50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final R(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;)V
    .locals 1

    .line 1
    new-instance v0, Ll/jv50;

    .line 2
    .line 3
    invoke-direct {v0, p0, p3, p2, p4}, Ll/jv50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Question;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p3, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->E(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final S(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    new-instance p0, Landroid/text/SpannableString;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    add-int/2addr p2, p1

    .line 28
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 29
    .line 30
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    const/high16 v1, -0x1000000

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const-string v1, "#cc000000"

    .line 48
    .line 49
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    :goto_0
    invoke-direct {v0, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 54
    .line 55
    .line 56
    const/16 v1, 0x21

    .line 57
    .line 58
    invoke-virtual {p0, v0, p1, p2, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 59
    .line 60
    .line 61
    new-instance v0, Landroid/text/style/StyleSpan;

    .line 62
    .line 63
    const/4 v2, 0x1

    .line 64
    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v0, p1, p2, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_1
    return-object p0
.end method

.method public a(Lcom/p1/mobile/putong/data/User;I)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->getImageSmall()Lv/VDraweeView;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-interface {p2}, Ll/r97;->f3()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/16 v1, 0x64

    .line 41
    .line 42
    if-eq p2, v1, :cond_3

    .line 43
    .line 44
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatClearAvatar(Lcom/p1/mobile/putong/data/User;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->getImageSmall()Lv/VDraweeView;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {p1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-interface {v0, p0, p1, p2}, Ll/r97;->y2(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_3
    :goto_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->getImageSmall()Lv/VDraweeView;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {p1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p2, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->a:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    new-instance v0, Ll/wu50;

    .line 4
    .line 5
    invoke-direct {v0, p0, p2}, Ll/wu50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p1}, Ll/r97;->D()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ll/w600;->h()Ll/w600;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->getTickleAnimContent()Landroid/widget/FrameLayout;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->getImageSmall()Lv/VDraweeView;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "headView"

    .line 40
    .line 41
    invoke-virtual {p1, p2, v2, v0, v1}, Ll/w600;->p(Ljava/lang/String;Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatClearAvatar(Lcom/p1/mobile/putong/data/User;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_1

    .line 63
    .line 64
    const-string p1, "\u6bcf\u4eba\u53d1\u900120\u53e5\u6d88\u606f\uff0c\u5373\u53ef\u6210\u4e3a\u6b63\u5f0f\u597d\u53cb"

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const-string p1, ""

    .line 68
    .line 69
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-nez p2, :cond_2

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->A:Lv/VText;

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->P(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->z()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->Q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->z:Lv/VRelative;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getImageSmall()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTickleAnimContent()Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->y(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->i:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->g:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->j:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget v2, Ll/g9c0;->i:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->k:Lv/VText;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    sget v2, Ll/g9c0;->i:I

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->l:Landroid/widget/TextView;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget v2, Ll/g9c0;->i:I

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->o:Lv/VImage;

    .line 82
    .line 83
    sget v1, Ll/ibc0;->v2:I

    .line 84
    .line 85
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->p:Lv/VText;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sget v2, Ll/g9c0;->h:I

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->r:Lv/VImage;

    .line 104
    .line 105
    sget v1, Ll/ibc0;->y2:I

    .line 106
    .line 107
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->s:Lv/VText;

    .line 111
    .line 112
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    sget v2, Ll/g9c0;->h:I

    .line 117
    .line 118
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->u:Lv/VImage;

    .line 126
    .line 127
    sget v1, Ll/ibc0;->G2:I

    .line 128
    .line 129
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->v:Lv/VText;

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    sget v2, Ll/g9c0;->h:I

    .line 139
    .line 140
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->x:Lv/VImage;

    .line 148
    .line 149
    sget v1, Ll/ibc0;->J2:I

    .line 150
    .line 151
    invoke-static {v0, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->y:Lv/VText;

    .line 155
    .line 156
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    sget v2, Ll/g9c0;->h:I

    .line 161
    .line 162
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->A:Lv/VText;

    .line 170
    .line 171
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    sget v2, Ll/g9c0;->i:I

    .line 176
    .line 177
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 182
    .line 183
    .line 184
    :cond_0
    const-string v0, "e_match_person_information"

    .line 185
    .line 186
    const-string v1, "p_chat_view"

    .line 187
    .line 188
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->l:Landroid/widget/TextView;

    .line 192
    .line 193
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->getCheckTxt()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public final y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qv50;->a(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    return-object p0
.end method
