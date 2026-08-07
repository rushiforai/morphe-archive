.class public final Ll/int0;
.super Ll/fyx0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ljava/lang/Object;

.field public final synthetic b:Ll/sni0;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ll/sni0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/int0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    iput-object p2, p0, Ll/int0;->b:Ll/sni0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/fyx0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final Z7(Lcom/google/android/gms/internal/location/zzg;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/location/zzg;->getStatus()Lcom/google/android/gms/common/api/Status;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/int0;->a:Ljava/lang/Object;

    .line 6
    .line 7
    iget-object p0, p0, Ll/int0;->b:Ll/sni0;

    .line 8
    .line 9
    invoke-static {p1, v0, p0}, Lcom/google/android/gms/common/api/internal/TaskUtil;->setResultOrApiException(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Ll/sni0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final zze()V
    .locals 0

    .line 1
    return-void
.end method
