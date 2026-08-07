.class public Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hyl$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:Lcom/google/android/gms/maps/model/MarkerOptions;

.field public b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->c:Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(I)Ll/hyl$c;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/hyl$b;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->c:Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;->b4(Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;)Ll/w6k;

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
    new-instance v0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$a;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->c:Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;->b4(Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;)Ll/w6k;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ll/w6k;->a(Lcom/google/android/gms/maps/model/MarkerOptions;)Ll/txw;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$a;-><init>(Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;Ll/txw;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->c:Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;->c4(Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment;)Ll/fvf0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget p0, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->b:I

    .line 37
    .line 38
    invoke-virtual {v1, p0, v0}, Ll/fvf0;->j(ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-object v0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return-object p0
.end method

.method public c(FF)Ll/hyl$c;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$b;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$b;->a(Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$b;)Ll/q13;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

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

.method public f(F)Ll/hyl$c;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/maps/model/MarkerOptions;->s0(F)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public g(Z)Ll/hyl$c;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlHideAndSeekFragment$c;->a:Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/maps/model/MarkerOptions;->h(Z)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
