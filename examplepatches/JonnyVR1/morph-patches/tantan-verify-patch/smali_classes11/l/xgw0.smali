.class public final Ll/xgw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lorg/json/JSONObject;

.field public final b:Ll/jhw0;


# direct methods
.method public constructor <init>(Ll/jhw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xgw0;->b:Ll/jhw0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()Lorg/json/JSONObject;
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xgw0;->a:Lorg/json/JSONObject;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()V
    .locals 1

    .line 1
    new-instance v0, Ll/khw0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/khw0;-><init>(Ll/xgw0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/xgw0;->b:Ll/jhw0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/jhw0;->b(Ll/ihw0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final c(Lorg/json/JSONObject;Ljava/util/HashSet;J)V
    .locals 6

    .line 1
    new-instance v0, Ll/lhw0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v3, p1

    .line 5
    move-object v2, p2

    .line 6
    move-wide v4, p3

    .line 7
    invoke-direct/range {v0 .. v5}, Ll/lhw0;-><init>(Ll/xgw0;Ljava/util/HashSet;Lorg/json/JSONObject;J)V

    .line 8
    .line 9
    .line 10
    iget-object p0, v1, Ll/xgw0;->b:Ll/jhw0;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/jhw0;->b(Ll/ihw0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final d(Lorg/json/JSONObject;Ljava/util/HashSet;J)V
    .locals 6

    .line 1
    new-instance v0, Ll/mhw0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v3, p1

    .line 5
    move-object v2, p2

    .line 6
    move-wide v4, p3

    .line 7
    invoke-direct/range {v0 .. v5}, Ll/mhw0;-><init>(Ll/xgw0;Ljava/util/HashSet;Lorg/json/JSONObject;J)V

    .line 8
    .line 9
    .line 10
    iget-object p0, v1, Ll/xgw0;->b:Ll/jhw0;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/jhw0;->b(Ll/ihw0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final e(Lorg/json/JSONObject;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xgw0;->a:Lorg/json/JSONObject;

    .line 2
    .line 3
    return-void
.end method
