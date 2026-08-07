.class public Ll/o6k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qol;


# instance fields
.field public a:Ll/qol$a;


# direct methods
.method public constructor <init>(Ll/qol$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o6k;->a:Ll/qol$a;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Ll/o6k;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o6k;->h(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d(Ll/o6k;Lcom/p1/mobile/putong/location/Location;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o6k;->g(Lcom/p1/mobile/putong/location/Location;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/location/Location;)Ljava/util/List;
    .locals 6

    .line 1
    new-instance v0, Landroid/location/Geocoder;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 11
    .line 12
    .line 13
    move-result-wide v3

    .line 14
    const/16 v5, 0xa

    .line 15
    .line 16
    invoke-virtual/range {v0 .. v5}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic f(Landroid/location/Address;Ll/g90;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/location/Address;->getFeatureName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/g90;->c()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/location/Location;Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    new-instance v0, Ll/k6k;

    .line 2
    .line 3
    invoke-direct {v0, p2, p1}, Ll/k6k;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/location/Location;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    new-instance v0, Ll/l6k;

    .line 23
    .line 24
    invoke-direct {v0, p0, p1}, Ll/l6k;-><init>(Ll/o6k;Lcom/p1/mobile/putong/location/Location;)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Ll/m6k;

    .line 28
    .line 29
    invoke-direct {p1, p0}, Ll/m6k;-><init>(Ll/o6k;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    sget-boolean p0, Ll/uqb0;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/location/Location;Ljava/util/List;)V
    .locals 4

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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string p2, "No address found at location(%s,%s)"

    .line 28
    .line 29
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p0, p0, Ll/o6k;->a:Ll/qol$a;

    .line 34
    .line 35
    new-instance p2, Ljava/lang/IllegalArgumentException;

    .line 36
    .line 37
    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p0, p2}, Ll/qol$a;->onError(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_5

    .line 58
    .line 59
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Landroid/location/Address;

    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/location/Address;->getFeatureName()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    if-eqz v2, :cond_1

    .line 70
    .line 71
    new-instance v2, Ll/n6k;

    .line 72
    .line 73
    invoke-direct {v2, v1}, Ll/n6k;-><init>(Landroid/location/Address;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v0, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    if-eqz v2, :cond_2

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    invoke-virtual {v1}, Landroid/location/Address;->hasLatitude()Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_3

    .line 88
    .line 89
    invoke-virtual {v1}, Landroid/location/Address;->hasLongitude()Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-nez v2, :cond_4

    .line 94
    .line 95
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 96
    .line 97
    .line 98
    move-result-wide v2

    .line 99
    invoke-virtual {v1, v2, v3}, Landroid/location/Address;->setLatitude(D)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 103
    .line 104
    .line 105
    move-result-wide v2

    .line 106
    invoke-virtual {v1, v2, v3}, Landroid/location/Address;->setLongitude(D)V

    .line 107
    .line 108
    .line 109
    :cond_4
    new-instance v2, Ll/g90;

    .line 110
    .line 111
    invoke-direct {v2, v1}, Ll/g90;-><init>(Landroid/location/Address;)V

    .line 112
    .line 113
    .line 114
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_5
    new-instance p1, Ll/g90;

    .line 119
    .line 120
    invoke-direct {p1}, Ll/g90;-><init>()V

    .line 121
    .line 122
    .line 123
    const/4 p2, 0x0

    .line 124
    invoke-interface {v0, p2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Ll/o6k;->a:Ll/qol$a;

    .line 128
    .line 129
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_6

    .line 134
    .line 135
    iget-object p0, p0, Ll/o6k;->a:Ll/qol$a;

    .line 136
    .line 137
    invoke-interface {p0, v0}, Ll/qol$a;->a(Ljava/util/List;)V

    .line 138
    .line 139
    .line 140
    :cond_6
    return-void
.end method

.method public final synthetic h(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/o6k;->a:Ll/qol$a;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qol$a;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/lang/Throwable;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "GoogleAddressProvider: tr"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {p0, v0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public init()V
    .locals 0

    .line 1
    return-void
.end method
