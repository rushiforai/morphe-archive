.class public final Ll/ytw0;
.super Ll/ztw0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/hpr;Ljava/lang/Class;Ll/eow0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ztw0;-><init>(Ll/hpr;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic D(Ljava/lang/Object;Ljava/lang/Throwable;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/eow0;

    .line 2
    .line 3
    invoke-interface {p1, p2}, Ll/eow0;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final E(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/n3;->e(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method
