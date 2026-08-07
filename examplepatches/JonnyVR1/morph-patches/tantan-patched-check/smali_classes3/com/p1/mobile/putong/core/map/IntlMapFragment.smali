.class public Lcom/p1/mobile/putong/core/map/IntlMapFragment;
.super Lcom/google/android/gms/maps/SupportMapFragment;
.source "SourceFile"

# interfaces
.implements Ll/hyl;
.implements Ll/um50;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;,
        Lcom/p1/mobile/putong/core/map/IntlMapFragment$b;,
        Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;
    }
.end annotation


# instance fields
.field public final A:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final B:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;",
            ">;"
        }
    .end annotation
.end field

.field public C:Ll/w6k;

.field public D:Ll/hyl$a;

.field public E:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/maps/SupportMapFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->A:Lrx/subjects/a;

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->B:Ljava/util/List;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/core/map/IntlMapFragment;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->d4(I)V

    return-void
.end method

.method public static synthetic Y3(Lcom/p1/mobile/putong/core/map/IntlMapFragment;Ll/w6k;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->e4(Ll/w6k;)V

    return-void
.end method

.method public static synthetic Z3(Ll/txw;Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/txw;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;->b(Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;)Ll/txw;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/txw;->a()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic a4(Lcom/p1/mobile/putong/core/map/IntlMapFragment;Ll/txw;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->f4(Ll/txw;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic b4(Lcom/p1/mobile/putong/core/map/IntlMapFragment;)Ll/w6k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->C:Ll/w6k;

    return-object p0
.end method

.method public static bridge synthetic c4(Lcom/p1/mobile/putong/core/map/IntlMapFragment;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->B:Ljava/util/List;

    return-object p0
.end method

.method private synthetic d4(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->E:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->D:Ll/hyl$a;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->D:Ll/hyl$a;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    invoke-interface {p0, v0}, Ll/hyl$a;->b(Z)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method private synthetic f4(Ll/txw;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->D:Ll/hyl$a;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->B:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/zbo;

    .line 12
    .line 13
    invoke-direct {v1, p1}, Ll/zbo;-><init>(Ll/txw;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->D:Ll/hyl$a;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ll/hyl$a;->c(Ll/hyl$b;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public static g4(Lcom/google/android/gms/maps/GoogleMapOptions;)Lcom/p1/mobile/putong/core/map/IntlMapFragment;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/map/IntlMapFragment;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "MapOptions"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/SupportMapFragment;->setArguments(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method


# virtual methods
.method public E3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->A:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public K1(DDF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->C:Ll/w6k;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->C:Ll/w6k;

    .line 10
    .line 11
    new-instance v0, Lcom/google/android/gms/maps/model/LatLng;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, p5}, Ll/zc4;->a(Lcom/google/android/gms/maps/model/LatLng;F)Ll/yc4;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/w6k;->b(Ll/yc4;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public P2(Ll/w6k;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->C:Ll/w6k;

    .line 2
    .line 3
    new-instance v0, Ll/wbo;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/wbo;-><init>(Lcom/p1/mobile/putong/core/map/IntlMapFragment;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ll/w6k;->h(Ll/w6k$b;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/xbo;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Ll/xbo;-><init>(Lcom/p1/mobile/putong/core/map/IntlMapFragment;Ll/w6k;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ll/w6k;->g(Ll/w6k$a;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/ybo;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/ybo;-><init>(Lcom/p1/mobile/putong/core/map/IntlMapFragment;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ll/w6k;->j(Ll/w6k$d;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->A:Lrx/subjects/a;

    .line 28
    .line 29
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public X2(I)Ll/hyl$d;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$b;

    .line 2
    .line 3
    invoke-static {p1}, Ll/r13;->b(I)Ll/q13;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/map/IntlMapFragment$b;-><init>(Ll/q13;)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public b2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->C:Ll/w6k;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->C:Ll/w6k;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/w6k;->c()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public d3()Ll/hyl$c;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/map/IntlMapFragment$c;-><init>(Lcom/p1/mobile/putong/core/map/IntlMapFragment;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic e4(Ll/w6k;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->D:Ll/hyl$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/w6k;->d()Lcom/google/android/gms/maps/model/CameraPosition;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->D:Ll/hyl$a;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/google/android/gms/maps/model/CameraPosition;->target:Lcom/google/android/gms/maps/model/LatLng;

    .line 16
    .line 17
    move-object v3, v1

    .line 18
    iget-wide v1, v3, Lcom/google/android/gms/maps/model/LatLng;->latitude:D

    .line 19
    .line 20
    iget-wide v3, v3, Lcom/google/android/gms/maps/model/LatLng;->longitude:D

    .line 21
    .line 22
    iget v5, p1, Lcom/google/android/gms/maps/model/CameraPosition;->zoom:F

    .line 23
    .line 24
    iget p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->E:I

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    if-ne p0, p1, :cond_0

    .line 28
    .line 29
    :goto_0
    move v6, p1

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    const/4 p1, 0x0

    .line 32
    goto :goto_0

    .line 33
    :goto_1
    invoke-interface/range {v0 .. v6}, Ll/hyl$a;->d(DDFZ)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/gms/maps/SupportMapFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/google/android/gms/maps/SupportMapFragment;->V3(Ll/um50;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public r1(Ll/hyl$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->D:Ll/hyl$a;

    .line 2
    .line 3
    return-void
.end method
