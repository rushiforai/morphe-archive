.class public final Ll/jju0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nzt0;


# instance fields
.field public final a:Ljava/util/Map;

.field public final b:Ljava/util/Map;

.field public final c:Ljava/util/Map;

.field public final d:Ll/kqx0;

.field public final e:Ll/fmu0;


# direct methods
.method public constructor <init>(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ll/kqx0;Ll/fmu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jju0;->a:Ljava/util/Map;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jju0;->b:Ljava/util/Map;

    .line 7
    .line 8
    iput-object p3, p0, Ll/jju0;->c:Ljava/util/Map;

    .line 9
    .line 10
    iput-object p4, p0, Ll/jju0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/jju0;->e:Ll/fmu0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final d(ILjava/lang/String;)Ll/pcv0;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jju0;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/pcv0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    const/4 v0, 0x1

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eq p1, v0, :cond_3

    .line 15
    .line 16
    const/4 v0, 0x4

    .line 17
    if-eq p1, v0, :cond_1

    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_1
    iget-object p1, p0, Ll/jju0;->c:Ljava/util/Map;

    .line 21
    .line 22
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ll/tfv0;

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    new-instance p0, Ll/qcv0;

    .line 31
    .line 32
    sget-object p2, Ll/pzt0;->a:Ll/pzt0;

    .line 33
    .line 34
    invoke-direct {p0, p1, p2}, Ll/qcv0;-><init>(Ll/pcv0;Ll/eow0;)V

    .line 35
    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    iget-object p0, p0, Ll/jju0;->b:Ljava/util/Map;

    .line 39
    .line 40
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ll/pcv0;

    .line 45
    .line 46
    if-nez p0, :cond_5

    .line 47
    .line 48
    return-object v1

    .line 49
    :cond_3
    iget-object v0, p0, Ll/jju0;->e:Ll/fmu0;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/fmu0;->e()Ll/sms0;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    if-nez v0, :cond_4

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_4
    iget-object p0, p0, Ll/jju0;->d:Ll/kqx0;

    .line 59
    .line 60
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Ll/nzt0;

    .line 65
    .line 66
    invoke-interface {p0, p1, p2}, Ll/nzt0;->d(ILjava/lang/String;)Ll/pcv0;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    if-nez p0, :cond_5

    .line 71
    .line 72
    :goto_0
    return-object v1

    .line 73
    :cond_5
    new-instance p1, Ll/qcv0;

    .line 74
    .line 75
    sget-object p2, Ll/qzt0;->a:Ll/qzt0;

    .line 76
    .line 77
    invoke-direct {p1, p0, p2}, Ll/qcv0;-><init>(Ll/pcv0;Ll/eow0;)V

    .line 78
    .line 79
    .line 80
    return-object p1
.end method
