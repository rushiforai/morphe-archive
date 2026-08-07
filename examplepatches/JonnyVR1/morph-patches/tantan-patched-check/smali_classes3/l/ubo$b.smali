.class public Ll/ubo$b;
.super Lcom/google/android/gms/location/LocationCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ubo;->l(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ubo;


# direct methods
.method public constructor <init>(Ll/ubo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ubo$b;->a:Ll/ubo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/location/LocationCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLocationResult(Lcom/google/android/gms/location/LocationResult;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/location/LocationResult;->getLastLocation()Landroid/location/Location;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Ll/ubo$b;->a:Ll/ubo;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Lcom/p1/mobile/putong/location/Location;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/location/Location;-><init>(Landroid/location/Location;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/ubo;->d(Ll/ubo;Lcom/p1/mobile/putong/location/Location;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    invoke-static {v1, p1}, Ll/ubo;->d(Ll/ubo;Lcom/p1/mobile/putong/location/Location;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object p1, p0, Ll/ubo$b;->a:Ll/ubo;

    .line 30
    .line 31
    invoke-static {p1}, Ll/ubo;->c(Ll/ubo;)Lcom/p1/mobile/putong/location/Location;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Ll/ubo$b;->a:Ll/ubo;

    .line 42
    .line 43
    invoke-static {p0}, Ll/ubo;->c(Ll/ubo;)Lcom/p1/mobile/putong/location/Location;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, p1, v0}, Ll/ubo;->j(Lcom/p1/mobile/putong/location/Location;Z)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method
