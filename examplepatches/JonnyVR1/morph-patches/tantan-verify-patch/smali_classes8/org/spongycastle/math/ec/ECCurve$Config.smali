.class public Lorg/spongycastle/math/ec/ECCurve$Config;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/math/ec/ECCurve;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Config"
.end annotation


# instance fields
.field protected coord:I

.field protected endomorphism:Lorg/spongycastle/math/ec/endo/ECEndomorphism;

.field protected multiplier:Lorg/spongycastle/math/ec/ECMultiplier;

.field final synthetic this$0:Lorg/spongycastle/math/ec/ECCurve;


# direct methods
.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;ILorg/spongycastle/math/ec/endo/ECEndomorphism;Lorg/spongycastle/math/ec/ECMultiplier;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->this$0:Lorg/spongycastle/math/ec/ECCurve;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->coord:I

    .line 7
    .line 8
    iput-object p3, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->endomorphism:Lorg/spongycastle/math/ec/endo/ECEndomorphism;

    .line 9
    .line 10
    iput-object p4, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->multiplier:Lorg/spongycastle/math/ec/ECMultiplier;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public create()Lorg/spongycastle/math/ec/ECCurve;
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->this$0:Lorg/spongycastle/math/ec/ECCurve;

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->coord:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECCurve;->supportsCoordinateSystem(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->this$0:Lorg/spongycastle/math/ec/ECCurve;

    .line 13
    .line 14
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve;->cloneCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v2, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->this$0:Lorg/spongycastle/math/ec/ECCurve;

    .line 19
    .line 20
    if-eq v0, v2, :cond_0

    .line 21
    .line 22
    monitor-enter v0

    .line 23
    :try_start_0
    iget v1, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->coord:I

    .line 24
    .line 25
    iput v1, v0, Lorg/spongycastle/math/ec/ECCurve;->coord:I

    .line 26
    .line 27
    iget-object v1, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->endomorphism:Lorg/spongycastle/math/ec/endo/ECEndomorphism;

    .line 28
    .line 29
    iput-object v1, v0, Lorg/spongycastle/math/ec/ECCurve;->endomorphism:Lorg/spongycastle/math/ec/endo/ECEndomorphism;

    .line 30
    .line 31
    iget-object p0, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->multiplier:Lorg/spongycastle/math/ec/ECMultiplier;

    .line 32
    .line 33
    iput-object p0, v0, Lorg/spongycastle/math/ec/ECCurve;->multiplier:Lorg/spongycastle/math/ec/ECMultiplier;

    .line 34
    .line 35
    monitor-exit v0

    .line 36
    return-object v0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p0

    .line 40
    :cond_0
    const-string p0, "implementation returned current curve"

    .line 41
    .line 42
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-object v1

    .line 46
    :cond_1
    const-string p0, "unsupported coordinate system"

    .line 47
    .line 48
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-object v1
.end method

.method public setCoordinateSystem(I)Lorg/spongycastle/math/ec/ECCurve$Config;
    .locals 0

    .line 1
    iput p1, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->coord:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setEndomorphism(Lorg/spongycastle/math/ec/endo/ECEndomorphism;)Lorg/spongycastle/math/ec/ECCurve$Config;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->endomorphism:Lorg/spongycastle/math/ec/endo/ECEndomorphism;

    .line 2
    .line 3
    return-object p0
.end method

.method public setMultiplier(Lorg/spongycastle/math/ec/ECMultiplier;)Lorg/spongycastle/math/ec/ECCurve$Config;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/math/ec/ECCurve$Config;->multiplier:Lorg/spongycastle/math/ec/ECMultiplier;

    .line 2
    .line 3
    return-object p0
.end method
