.class public final synthetic Ll/pes0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/RemoteCall;


# static fields
.field public static final synthetic a:Ll/pes0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/pes0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/pes0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/pes0;->a:Ll/pes0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f5u0;

    .line 2
    .line 3
    check-cast p2, Ll/sni0;

    .line 4
    .line 5
    new-instance p0, Lcom/google/android/gms/location/LastLocationRequest$Builder;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/location/LastLocationRequest$Builder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/google/android/gms/location/LastLocationRequest$Builder;->build()Lcom/google/android/gms/location/LastLocationRequest;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0, p2}, Ll/f5u0;->l(Lcom/google/android/gms/location/LastLocationRequest;Ll/sni0;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
