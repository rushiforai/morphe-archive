.class public Ll/skk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dxv$c;


# instance fields
.field public a:Ll/wyd0;

.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/putong/data/User;

.field public d:Lcom/p1/mobile/putong/data/User;

.field public e:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wyd0;

    .line 5
    .line 6
    const-string v1, "history_avatar"

    .line 7
    .line 8
    const-string v2, ""

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/skk0;->a:Ll/wyd0;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic A(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->c0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->X(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C(Ll/skk0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/skk0;->l0()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->e0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->j0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F()Ljava/lang/Object;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    return-object v0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    return-object v0
.end method

.method public static synthetic G(Ll/skk0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/skk0;->m0()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic c(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->V(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->Z(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/skk0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/skk0;->o0()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->h0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "0"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 23
    .line 24
    const/16 v0, 0x62

    .line 25
    .line 26
    if-le p0, v0, :cond_1

    .line 27
    .line 28
    const-string p0, "99+"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic i(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->a0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j()Ljava/lang/Object;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static synthetic k(Ll/skk0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/skk0;->n0()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->f0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private synthetic l0()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/skk0;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    iget-object p0, p0, Ll/skk0;->b:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public static synthetic m(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->i0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private synthetic m0()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/skk0;->c:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic n0()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/skk0;->d:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->d0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private synthetic o0()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/skk0;->e:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic q(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->W(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->Y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 7
    .line 8
    return-object p0
.end method

.method public static synthetic t(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->b0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->T(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->k0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic y(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->g0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z(Ll/skk0;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->U(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final I(Lcom/p1/mobile/putong/data/Settings;Z)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "female"

    .line 2
    .line 3
    const-string v1, "male"

    .line 4
    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1, p2}, Ll/skk0;->K(Lcom/p1/mobile/putong/data/Gender;Z)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1, p2}, Ll/skk0;->K(Lcom/p1/mobile/putong/data/Gender;Z)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_2
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_3

    .line 62
    .line 63
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    goto :goto_1

    .line 68
    :cond_3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    :goto_1
    invoke-virtual {p0, p1, p2}, Ll/skk0;->K(Lcom/p1/mobile/putong/data/Gender;Z)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public final J(Lcom/p1/mobile/putong/data/Settings;ZZ)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "female"

    .line 2
    .line 3
    const-string v1, "male"

    .line 4
    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1, p2, p3}, Ll/skk0;->L(Lcom/p1/mobile/putong/data/Gender;ZZ)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1, p2, p3}, Ll/skk0;->L(Lcom/p1/mobile/putong/data/Gender;ZZ)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_2
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_3

    .line 62
    .line 63
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    goto :goto_1

    .line 68
    :cond_3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    :goto_1
    invoke-virtual {p0, p1, p2, p3}, Ll/skk0;->L(Lcom/p1/mobile/putong/data/Gender;ZZ)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public final K(Lcom/p1/mobile/putong/data/Gender;Z)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-string p1, "female"

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_2

    .line 15
    .line 16
    const-string p1, "male"

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    const-string p0, ""

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    if-eqz p2, :cond_1

    .line 28
    .line 29
    const-string p0, "\u7537\u751f"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    const-string p0, "\u7537\u6027"

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    if-eqz p2, :cond_3

    .line 36
    .line 37
    const-string p0, "\u5973\u751f"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_3
    const-string p0, "\u5973\u6027"

    .line 41
    .line 42
    return-object p0
.end method

.method public final L(Lcom/p1/mobile/putong/data/Gender;ZZ)Ljava/lang/String;
    .locals 1

    .line 1
    const-string p0, "male"

    .line 2
    .line 3
    const-string v0, "female"

    .line 4
    .line 5
    if-eqz p3, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string p0, "\u5c0f\u54e5\u54e5"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    const-string p0, "\u5c0f\u59d0\u59d0"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    if-nez p3, :cond_5

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-nez p0, :cond_3

    .line 51
    .line 52
    :goto_0
    const-string p0, ""

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_3
    if-eqz p2, :cond_4

    .line 56
    .line 57
    const-string p0, "\u4ed6"

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_4
    const-string p0, "\u4ed6\u4eec"

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_5
    if-eqz p2, :cond_6

    .line 64
    .line 65
    const-string p0, "\u5979"

    .line 66
    .line 67
    return-object p0

    .line 68
    :cond_6
    const-string p0, "\u5979\u4eec"

    .line 69
    .line 70
    return-object p0
.end method

.method public final M(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->l4()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const-string p0, "\u5b8c\u6210\u771f\u5b9e\u5934\u50cf\u548c\u771f\u4eba\u5b9e\u540d\u8ba4\u8bc1\u540e\uff0c\u4f60\u53ef\u4ee5\u8bbe\u7f6e\u4f18\u5148\u63a8\u8350\u8ba4\u8bc1\u7528\u6237\uff0c\u66f4\u5feb\u9047\u89c1\u4f18\u8d28\u3001\u9760\u8c31\u7684\u4eba"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    const-string p0, "\u5b8c\u6210\u771f\u5b9e\u5934\u50cf\u548c\u771f\u4eba\u5b9e\u540d\u8ba4\u8bc1\u540e\uff0c\u4f1a\u663e\u8457\u63d0\u5347\u4f60\u7ed9\u5bf9\u65b9\u7684\u5b89\u5168\u611f\uff0c\u66f4\u6709\u53ef\u80fd\u88ab\u53f3\u6ed1\u5594"

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v0, Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_3

    .line 50
    .line 51
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v0, Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_2

    .line 66
    .line 67
    const-string p0, "\u4f60\u7684\u771f\u4eba\u5b9e\u540d\u8ba4\u8bc1\u8fd8\u672a\u5b8c\u6210\uff0c\u8ba4\u8bc1\u6210\u529f\u540e\u4f60\u53ef\u4ee5\u8bbe\u7f6e\u4f18\u5148\u63a8\u8350\u8ba4\u8bc1\u7528\u6237\uff0c\u66f4\u5feb\u9047\u89c1\u4f18\u8d28\u3001\u9760\u8c31\u7684\u4eba"

    .line 68
    .line 69
    return-object p0

    .line 70
    :cond_2
    const-string p0, "\u4f60\u7684\u771f\u4eba\u5b9e\u540d\u8ba4\u8bc1\u8fd8\u672a\u5b8c\u6210\uff0c\u8ba4\u8bc1\u6210\u529f\u540e\u4f1a\u663e\u8457\u63d0\u5347\u4f60\u7ed9\u5bf9\u65b9\u7684\u5b89\u5168\u611f\uff0c\u66f4\u6709\u53ef\u80fd\u88ab\u53f3\u6ed1\u5594"

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_3
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v0, Ljava/lang/Boolean;

    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_5

    .line 82
    .line 83
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast p0, Ljava/lang/Boolean;

    .line 86
    .line 87
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_5

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-eqz p0, :cond_4

    .line 98
    .line 99
    const-string p0, "\u4f60\u7684\u771f\u4eba\u5b9e\u540d\u8ba4\u8bc1\u8fd8\u672a\u6fc0\u6d3b\uff0c\u6fc0\u6d3b\u540e\u4f60\u53ef\u4ee5\u8bbe\u7f6e\u4f18\u5148\u63a8\u8350\u8ba4\u8bc1\u7528\u6237\uff0c\u66f4\u5feb\u9047\u89c1\u4f18\u8d28\u3001\u9760\u8c31\u7684\u4eba"

    .line 100
    .line 101
    return-object p0

    .line 102
    :cond_4
    const-string p0, "\u4f60\u7684\u771f\u4eba\u5b9e\u540d\u8ba4\u8bc1\u8fd8\u672a\u6fc0\u6d3b\uff0c\u6fc0\u6d3b\u540e\u4f1a\u663e\u8457\u63d0\u5347\u4f60\u7ed9\u5bf9\u65b9\u7684\u5b89\u5168\u611f\uff0c\u66f4\u6709\u53ef\u80fd\u88ab\u53f3\u6ed1\u5594"

    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_5
    const-string p0, ""

    .line 106
    .line 107
    return-object p0
.end method

.method public N()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isIdCardVerified()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const-string p0, "verified"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_1
    const-string p0, "unknown_"

    .line 50
    .line 51
    return-object p0
.end method

.method public O()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const-string p0, "verified"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_1
    const-string p0, "unknown_"

    .line 50
    .line 51
    return-object p0
.end method

.method public final P()Ljava/lang/Object;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->l4()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "\u300a\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1\u534f\u8bae\u300b"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "\u300a\u771f\u4eba\u5b9e\u540d\u8ba4\u8bc1\u534f\u8bae\u300b"

    .line 23
    .line 24
    return-object p0
.end method

.method public final Q()Ljava/lang/Object;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->l4()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "\u6211\u540c\u610f\u817e\u8baf\u3001\u963f\u91cc\u3001\u964c\u964c\u5c06\u91c7\u96c6\u6211\u7684\u9762\u90e8\u4fe1\u606f\u5e76\u4e0e\u5934\u50cf\u6bd4\u5bf9\uff0c\u8be6\u89c1"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "\u6211\u5df2\u9605\u8bfb\u5e76\u540c\u610f\uff0c\u771f\u4eba\u5b9e\u540d\u8ba4\u8bc1\u9700\u8981\u8f93\u5165\u6211\u7684\u59d3\u540d\u548c\u8eab\u4efd\u8bc1\u53f7\uff0c\u5e76\u901a\u8fc7\u4f9b\u5e94\u5546\u817e\u8baf\u3001\u963f\u91cc\u548c\u964c\u964c\u91c7\u96c6\u6211\u7684\u9762\u90e8\u4fe1\u606f\uff0c\u6765\u786e\u4fdd\u5934\u50cf\u3001\u8eab\u4efd\u8bc1\u90fd\u662f\u6211\u672c\u4eba\uff0c\u6bcf\u4e2a\u8eab\u4efd\u8bc1\u53ea\u80fd\u8ba4\u8bc1\u4e00\u4e2a\u63a2\u63a2\u8d26\u53f7\uff0c\u8be6\u89c1"

    .line 23
    .line 24
    return-object p0
.end method

.method public final R(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
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
    const-string p0, "\u600e\u4e48\u66f4\u5feb\u9047\u89c1\u9760\u8c31\u7684\u53e6\u4e00\u534a\uff1f"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "\u600e\u6837\u83b7\u5f97\u66f4\u591a\u914d\u5bf9\uff1f"

    .line 15
    .line 16
    return-object p0
.end method

.method public S()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->l4()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "avatar_verification"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "id_verification"

    .line 23
    .line 24
    return-object p0
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, p1, v0, v1}, Ll/skk0;->L(Lcom/p1/mobile/putong/data/Gender;ZZ)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic U(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, p1, v0, v1}, Ll/skk0;->J(Lcom/p1/mobile/putong/data/Settings;ZZ)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0, v0}, Ll/skk0;->J(Lcom/p1/mobile/putong/data/Settings;ZZ)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/skk0;->I(Lcom/p1/mobile/putong/data/Settings;Z)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/skk0;->I(Lcom/p1/mobile/putong/data/Settings;Z)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final synthetic Y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0, v0}, Ll/skk0;->J(Lcom/p1/mobile/putong/data/Settings;ZZ)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 2

    .line 1
    const/4 p1, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v1, p1, v0}, Ll/skk0;->J(Lcom/p1/mobile/putong/data/Settings;ZZ)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public a(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/dxv$b<",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ekk0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ekk0;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "me"

    .line 7
    .line 8
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/fkk0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/fkk0;-><init>(Ll/skk0;)V

    .line 14
    .line 15
    .line 16
    const-string v1, "swipe_user"

    .line 17
    .line 18
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/gkk0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/gkk0;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v1, "first_liker"

    .line 27
    .line 28
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/hkk0;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/hkk0;-><init>(Ll/skk0;)V

    .line 34
    .line 35
    .line 36
    const-string v1, "like_me_profile"

    .line 37
    .line 38
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/jkk0;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/jkk0;-><init>(Ll/skk0;)V

    .line 44
    .line 45
    .line 46
    const-string v1, "nearby_comment_me_profile"

    .line 47
    .line 48
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/kkk0;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/kkk0;-><init>(Ll/skk0;)V

    .line 54
    .line 55
    .line 56
    const-string p0, "nearby_user_profile"

    .line 57
    .line 58
    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, p1, v0, v0}, Ll/skk0;->J(Lcom/p1/mobile/putong/data/Settings;ZZ)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/dxv$a<",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mjk0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mjk0;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "receiveLikes"

    .line 7
    .line 8
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/ojk0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/ojk0;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "see_total_num"

    .line 17
    .line 18
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/vjk0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/vjk0;-><init>(Ll/skk0;)V

    .line 24
    .line 25
    .line 26
    const-string v1, "history_avatar"

    .line 27
    .line 28
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/wjk0;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/wjk0;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v1, "name"

    .line 37
    .line 38
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/yjk0;

    .line 42
    .line 43
    invoke-direct {v0}, Ll/yjk0;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v1, "gender"

    .line 47
    .line 48
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/zjk0;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/zjk0;-><init>(Ll/skk0;)V

    .line 54
    .line 55
    .line 56
    const-string v1, "gender_refer"

    .line 57
    .line 58
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    new-instance v0, Ll/akk0;

    .line 62
    .line 63
    invoke-direct {v0}, Ll/akk0;-><init>()V

    .line 64
    .line 65
    .line 66
    const-string v1, "age"

    .line 67
    .line 68
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/bkk0;

    .line 72
    .line 73
    invoke-direct {v0}, Ll/bkk0;-><init>()V

    .line 74
    .line 75
    .line 76
    const-string v1, "city"

    .line 77
    .line 78
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    new-instance v0, Ll/ckk0;

    .line 82
    .line 83
    invoke-direct {v0}, Ll/ckk0;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v1, "distance"

    .line 87
    .line 88
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    new-instance v0, Ll/dkk0;

    .line 92
    .line 93
    invoke-direct {v0}, Ll/dkk0;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v1, "avatar"

    .line 97
    .line 98
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    new-instance v0, Ll/xjk0;

    .line 102
    .line 103
    invoke-direct {v0, p0}, Ll/xjk0;-><init>(Ll/skk0;)V

    .line 104
    .line 105
    .line 106
    const-string v1, "searching_gender_refer"

    .line 107
    .line 108
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    new-instance v0, Ll/ikk0;

    .line 112
    .line 113
    invoke-direct {v0, p0}, Ll/ikk0;-><init>(Ll/skk0;)V

    .line 114
    .line 115
    .line 116
    const-string v1, "searching_genders_refer"

    .line 117
    .line 118
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    new-instance v0, Ll/lkk0;

    .line 122
    .line 123
    invoke-direct {v0, p0}, Ll/lkk0;-><init>(Ll/skk0;)V

    .line 124
    .line 125
    .line 126
    const-string v1, "searching_gender_sex1"

    .line 127
    .line 128
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    new-instance v0, Ll/mkk0;

    .line 132
    .line 133
    invoke-direct {v0, p0}, Ll/mkk0;-><init>(Ll/skk0;)V

    .line 134
    .line 135
    .line 136
    const-string v1, "searching_gender_sex2"

    .line 137
    .line 138
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    new-instance v0, Ll/nkk0;

    .line 142
    .line 143
    invoke-direct {v0, p0}, Ll/nkk0;-><init>(Ll/skk0;)V

    .line 144
    .line 145
    .line 146
    const-string v1, "searching_gender_nickname"

    .line 147
    .line 148
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    new-instance v0, Ll/okk0;

    .line 152
    .line 153
    invoke-direct {v0, p0}, Ll/okk0;-><init>(Ll/skk0;)V

    .line 154
    .line 155
    .line 156
    const-string v1, "opposite_gender"

    .line 157
    .line 158
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    new-instance v0, Ll/pkk0;

    .line 162
    .line 163
    invoke-direct {v0, p0}, Ll/pkk0;-><init>(Ll/skk0;)V

    .line 164
    .line 165
    .line 166
    const-string v1, "opposite_genders"

    .line 167
    .line 168
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    new-instance v0, Ll/qkk0;

    .line 172
    .line 173
    invoke-direct {v0, p0}, Ll/qkk0;-><init>(Ll/skk0;)V

    .line 174
    .line 175
    .line 176
    const-string v1, "opposite_gender_sex1"

    .line 177
    .line 178
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    new-instance v0, Ll/rkk0;

    .line 182
    .line 183
    invoke-direct {v0, p0}, Ll/rkk0;-><init>(Ll/skk0;)V

    .line 184
    .line 185
    .line 186
    const-string v1, "opposite_gender_sex2"

    .line 187
    .line 188
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    new-instance v0, Ll/njk0;

    .line 192
    .line 193
    invoke-direct {v0, p0}, Ll/njk0;-><init>(Ll/skk0;)V

    .line 194
    .line 195
    .line 196
    const-string v1, "verification_title"

    .line 197
    .line 198
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    new-instance v0, Ll/pjk0;

    .line 202
    .line 203
    invoke-direct {v0, p0}, Ll/pjk0;-><init>(Ll/skk0;)V

    .line 204
    .line 205
    .line 206
    const-string v1, "verification_content"

    .line 207
    .line 208
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    new-instance v0, Ll/qjk0;

    .line 212
    .line 213
    invoke-direct {v0, p0}, Ll/qjk0;-><init>(Ll/skk0;)V

    .line 214
    .line 215
    .line 216
    const-string v1, "verification_merge_type"

    .line 217
    .line 218
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    new-instance v0, Ll/rjk0;

    .line 222
    .line 223
    invoke-direct {v0, p0}, Ll/rjk0;-><init>(Ll/skk0;)V

    .line 224
    .line 225
    .line 226
    const-string v1, "verification_avatar"

    .line 227
    .line 228
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    new-instance v0, Ll/sjk0;

    .line 232
    .line 233
    invoke-direct {v0, p0}, Ll/sjk0;-><init>(Ll/skk0;)V

    .line 234
    .line 235
    .line 236
    const-string v1, "verification_id"

    .line 237
    .line 238
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    new-instance v0, Ll/tjk0;

    .line 242
    .line 243
    invoke-direct {v0, p0}, Ll/tjk0;-><init>(Ll/skk0;)V

    .line 244
    .line 245
    .line 246
    const-string v1, "verification_protocol_prefix"

    .line 247
    .line 248
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    new-instance v0, Ll/ujk0;

    .line 252
    .line 253
    invoke-direct {v0, p0}, Ll/ujk0;-><init>(Ll/skk0;)V

    .line 254
    .line 255
    .line 256
    const-string p0, "verification_protocol"

    .line 257
    .line 258
    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    return-void
.end method

.method public final synthetic b0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    invoke-virtual {p0, p1, v0}, Ll/skk0;->I(Lcom/p1/mobile/putong/data/Settings;Z)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic c0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, p1, v0}, Ll/skk0;->I(Lcom/p1/mobile/putong/data/Settings;Z)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic d0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->R(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic e0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skk0;->M(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic f0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/skk0;->S()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic g0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/skk0;->O()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic h0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/skk0;->N()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic i0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/skk0;->Q()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic j0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/skk0;->P()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/skk0;->a:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
