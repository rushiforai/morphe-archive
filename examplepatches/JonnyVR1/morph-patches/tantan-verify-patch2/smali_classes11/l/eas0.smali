.class public final synthetic Ll/eas0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/RemoteCall;


# static fields
.field public static final synthetic a:Ll/eas0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/eas0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/eas0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/eas0;->a:Ll/eas0;

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
    sget-object p0, Ll/vrs0;->a:Lcom/google/android/gms/common/api/Api$ClientKey;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/f5u0;->h()Lcom/google/android/gms/location/LocationAvailability;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p2, p0}, Ll/sni0;->c(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
