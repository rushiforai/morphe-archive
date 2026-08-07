.class public final Ll/muw0;
.super Ll/ouw0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/hpr;Ll/xuw0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ouw0;-><init>(Ll/hpr;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final bridge synthetic D(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/xuw0;

    .line 2
    .line 3
    invoke-interface {p1, p2}, Ll/xuw0;->zza(Ljava/lang/Object;)Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p2, "AsyncFunction.apply returned null instead of a Future. Did you mean to return immediateFuture(null)? %s"

    .line 8
    .line 9
    invoke-static {p0, p2, p1}, Ll/tow0;->d(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public final synthetic E(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/hpr;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/n3;->u(Ll/hpr;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
