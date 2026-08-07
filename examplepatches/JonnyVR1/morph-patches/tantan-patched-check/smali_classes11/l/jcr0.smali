.class public final Ll/jcr0;
.super Ll/mpr0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/r4z0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ll/mpr0;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final d(Ll/gix0;Ljava/util/List;)Ll/ewr0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gix0;",
            "Ljava/util/List<",
            "Ll/ewr0;",
            ">;)",
            "Ll/ewr0;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/glr0;

    .line 2
    .line 3
    const-wide/16 p1, 0x0

    .line 4
    .line 5
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p1}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method
