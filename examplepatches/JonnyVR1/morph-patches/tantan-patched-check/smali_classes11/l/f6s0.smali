.class public final synthetic Ll/f6s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/RemoteCall;


# instance fields
.field public final synthetic a:Ll/yqs0;

.field public final synthetic b:Lcom/google/android/gms/location/LocationRequest;


# direct methods
.method public synthetic constructor <init>(Ll/yqs0;Lcom/google/android/gms/location/LocationRequest;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/f6s0;->a:Ll/yqs0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/f6s0;->b:Lcom/google/android/gms/location/LocationRequest;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f6s0;->a:Ll/yqs0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/f6s0;->b:Lcom/google/android/gms/location/LocationRequest;

    .line 4
    .line 5
    check-cast p1, Ll/f5u0;

    .line 6
    .line 7
    check-cast p2, Ll/sni0;

    .line 8
    .line 9
    sget-object v1, Ll/vrs0;->a:Lcom/google/android/gms/common/api/Api$ClientKey;

    .line 10
    .line 11
    invoke-virtual {p1, v0, p0, p2}, Ll/f5u0;->m(Ll/utt0;Lcom/google/android/gms/location/LocationRequest;Ll/sni0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
