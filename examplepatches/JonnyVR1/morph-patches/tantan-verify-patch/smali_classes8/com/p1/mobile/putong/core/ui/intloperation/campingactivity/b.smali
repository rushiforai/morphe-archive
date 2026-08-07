.class public final Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0012\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\r\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u001d\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0015\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\r\u0010\u0014\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u0014\u0010\u0003J\u0015\u0010\u0016\u001a\u00020\u000e2\u0006\u0010\u0015\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0017\u0010\u0019\u001a\u00020\u000c2\u0006\u0010\u0018\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001aR\u001b\u0010\u001f\u001a\u00020\u000c8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001b\u0010\u001c\u001a\u0004\u0008\u001d\u0010\u001e\u00a8\u0006 "
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;",
        "",
        "<init>",
        "()V",
        "",
        "f",
        "()Ljava/lang/String;",
        "Ll/jxd0;",
        "h",
        "()Ll/jxd0;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "",
        "source",
        "",
        "i",
        "(Lcom/p1/mobile/android/app/Act;I)V",
        "from",
        "e",
        "(I)V",
        "l",
        "option",
        "m",
        "(Ljava/lang/String;)V",
        "config",
        "k",
        "(Ljava/lang/String;)I",
        "a",
        "Lkotlin/Lazy;",
        "g",
        "()I",
        "swipeCount",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;->INSTANCE:Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;

    .line 7
    .line 8
    new-instance v0, Ll/l5n;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/l5n;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;->a:Lkotlin/Lazy;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()I
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;->INSTANCE:Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;

    .line 2
    .line 3
    const-string v1, "intl_camping_config"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;->k(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method public static b(I)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget v0, Ll/uqb0;->f0:I

    .line 2
    .line 3
    if-ne v0, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;->j(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/IntlCampingEnvelope;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/IntlCampingEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlCampingData;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->type:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->z1:Ll/m69;

    .line 17
    .line 18
    new-instance v0, Ll/o5n;

    .line 19
    .line 20
    invoke-direct {v0, p0, p1}, Ll/o5n;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, p0, v0}, Ll/m69;->o3(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function1;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->Companion:Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct$a;

    .line 28
    .line 29
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct$a;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/IntlCampingEnvelope;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance p2, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 34
    .line 35
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 42
    .line 43
    return-object p0
.end method

.method public static final j(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlCampingConfigData;

    .line 10
    .line 11
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/a;->s(Lcom/p1/mobile/putong/core/data/IntlCampingConfigData;I)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 15
    .line 16
    return-object p0
.end method


# virtual methods
.method public final e(I)V
    .locals 1

    .line 1
    const-string p0, "show_source"

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "activities_type"

    .line 12
    .line 13
    const-string v0, "camping"

    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "e_petsactivities_show"

    .line 24
    .line 25
    const-string v0, "p_activities_pets_page"

    .line 26
    .line 27
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final f()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "core_intl_camping_entrance_anim.svga"

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()I
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;->a:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final h()Ll/jxd0;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Ll/jxd0;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "camping_is_upload_"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-direct {p0, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method public final i(Lcom/p1/mobile/android/app/Act;I)V
    .locals 2
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p0, Lcom/p1/mobile/putong/core/data/IntlCampingRequestParams;

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IntlCampingRequestParams;-><init>()V

    .line 7
    .line 8
    .line 9
    sget v0, Ll/uqb0;->f0:I

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingRequestParams;->mcc:Ljava/lang/String;

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z1:Ll/m69;

    .line 20
    .line 21
    new-instance v1, Ll/m5n;

    .line 22
    .line 23
    invoke-direct {v1, p1, p2}, Ll/m5n;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1, p0, v1}, Ll/m69;->p3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/IntlCampingRequestParams;Lkotlin/jvm/functions/Function1;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final k(Ljava/lang/String;)I
    .locals 1

    .line 1
    const/4 p0, -0x1

    .line 2
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    new-instance v0, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string p1, "enable"

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const-string p1, "mcc"

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 33
    .line 34
    invoke-static {p1, v0}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Ljava/util/Collection;

    .line 39
    .line 40
    new-instance v0, Ll/n5n;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/n5n;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {p1, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 46
    .line 47
    .line 48
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    const/4 p0, 0x1

    .line 52
    :catch_0
    :cond_0
    return p0
.end method

.method public final l()V
    .locals 2

    .line 1
    const-string p0, "activities_type"

    .line 2
    .line 3
    const-string v0, "camping"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_petactivities_click"

    .line 14
    .line 15
    const-string v1, "p_activities_pets_page"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final m(Ljava/lang/String;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    const-string p0, "e_petactivities_success"

    .line 5
    .line 6
    const-string v0, "p_activities_pets_page"

    .line 7
    .line 8
    const-string v1, "activities_type"

    .line 9
    .line 10
    const-string v2, "camping"

    .line 11
    .line 12
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "activities_options"

    .line 17
    .line 18
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    filled-new-array {v1, p1}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p0, v0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    :catch_0
    return-void
.end method
