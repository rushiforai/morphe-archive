.class public final Ll/cru0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public final a:Ll/lms0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ll/qru0;

.field public final c:Ll/kpx0;


# direct methods
.method public constructor <init>(Ll/fmu0;Ll/ulu0;Ll/qru0;Ll/kpx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/ulu0;->a()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-virtual {p1, p2}, Ll/fmu0;->c(Ljava/lang/String;)Ll/lms0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/cru0;->a:Ll/lms0;

    .line 13
    .line 14
    iput-object p3, p0, Ll/cru0;->b:Ll/qru0;

    .line 15
    .line 16
    iput-object p4, p0, Ll/cru0;->c:Ll/kpx0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 1

    .line 1
    const-string p1, "asset"

    .line 2
    .line 3
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    :try_start_0
    iget-object p2, p0, Ll/cru0;->a:Ll/lms0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/cru0;->c:Ll/kpx0;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/kpx0;->zzb()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/bms0;

    .line 18
    .line 19
    invoke-interface {p2, p0, p1}, Ll/lms0;->T7(Ll/bms0;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p0

    .line 24
    new-instance p2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v0, "Failed to call onCustomClick for asset "

    .line 27
    .line 28
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p1, "."

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cru0;->a:Ll/lms0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/cru0;->b:Ll/qru0;

    .line 7
    .line 8
    const-string v1, "/nativeAdCustomClick"

    .line 9
    .line 10
    invoke-virtual {v0, v1, p0}, Ll/qru0;->i(Ljava/lang/String;Ll/bqs0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
