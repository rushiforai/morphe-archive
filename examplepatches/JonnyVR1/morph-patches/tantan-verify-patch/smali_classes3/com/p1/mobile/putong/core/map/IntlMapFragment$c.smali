.class public Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hyl$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/map/IntlMapFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:Lcom/google/android/gms/maps/model/MarkerOptions;

.field public final synthetic b:Lcom/p1/mobile/putong/core/map/IntlMapFragment;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/map/IntlMapFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;->b:Lcom/p1/mobile/putong/core/map/IntlMapFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 7
    .line 8
    invoke-direct {p1}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public b()Ll/hyl$b;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;->b:Lcom/p1/mobile/putong/core/map/IntlMapFragment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->b4(Lcom/p1/mobile/putong/core/map/IntlMapFragment;)Ll/w6k;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;->b:Lcom/p1/mobile/putong/core/map/IntlMapFragment;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->b4(Lcom/p1/mobile/putong/core/map/IntlMapFragment;)Ll/w6k;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ll/w6k;->a(Lcom/google/android/gms/maps/model/MarkerOptions;)Ll/txw;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;-><init>(Lcom/p1/mobile/putong/core/map/IntlMapFragment;Ll/txw;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;->b:Lcom/p1/mobile/putong/core/map/IntlMapFragment;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->c4(Lcom/p1/mobile/putong/core/map/IntlMapFragment;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method

.method public c(FF)Ll/hyl$c;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/maps/model/MarkerOptions;->g(FF)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public d(Ll/hyl$d;)Ll/hyl$c;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/map/IntlMapFragment$b;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/map/IntlMapFragment$b;->a(Lcom/p1/mobile/putong/core/map/IntlMapFragment$b;)Ll/q13;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Lcom/google/android/gms/maps/model/MarkerOptions;->n0(Ll/q13;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public e(DD)Ll/hyl$c;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/gms/maps/model/LatLng;

    .line 4
    .line 5
    invoke-direct {v1, p1, p2, p3, p4}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/model/MarkerOptions;->r0(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public g(Z)Ll/hyl$c;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/maps/model/MarkerOptions;->h(Z)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
