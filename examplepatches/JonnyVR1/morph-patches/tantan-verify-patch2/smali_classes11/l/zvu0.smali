.class public final Ll/zvu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mcw0;


# instance fields
.field public final a:Ljava/util/Map;

.field public final b:Ll/fcs0;


# direct methods
.method public constructor <init>(Ll/fcs0;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/zvu0;->a:Ljava/util/Map;

    .line 5
    .line 6
    iput-object p1, p0, Ll/zvu0;->b:Ll/fcs0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final D(Lcom/google/android/gms/internal/ads/zzflg;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/zvu0;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/zvu0;->b:Ll/fcs0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/zvu0;->a:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/yvu0;

    .line 18
    .line 19
    iget p0, p0, Ll/yvu0;->c:I

    .line 20
    .line 21
    invoke-virtual {p2, p0}, Ll/fcs0;->c(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final b(Lcom/google/android/gms/internal/ads/zzflg;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/zvu0;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/zvu0;->b:Ll/fcs0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/zvu0;->a:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/yvu0;

    .line 18
    .line 19
    iget p0, p0, Ll/yvu0;->a:I

    .line 20
    .line 21
    invoke-virtual {p2, p0}, Ll/fcs0;->c(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final k(Lcom/google/android/gms/internal/ads/zzflg;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/zvu0;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/zvu0;->b:Ll/fcs0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/zvu0;->a:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/yvu0;

    .line 18
    .line 19
    iget p0, p0, Ll/yvu0;->b:I

    .line 20
    .line 21
    invoke-virtual {p2, p0}, Ll/fcs0;->c(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final z(Lcom/google/android/gms/internal/ads/zzflg;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method
