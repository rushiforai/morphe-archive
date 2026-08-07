.class public final Ll/dly0;
.super Ll/j1v0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/sni0;


# direct methods
.method public constructor <init>(Ll/qoy0;Ll/sni0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/dly0;->a:Ll/sni0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/j1v0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final v1(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/appset/zzc;)V
    .locals 2
    .param p2    # Lcom/google/android/gms/appset/zzc;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/gx0;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/google/android/gms/appset/zzc;->zzb()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p2}, Lcom/google/android/gms/appset/zzc;->zza()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-direct {v0, v1, p2}, Ll/gx0;-><init>(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    iget-object p0, p0, Ll/dly0;->a:Ll/sni0;

    .line 19
    .line 20
    invoke-static {p1, v0, p0}, Lcom/google/android/gms/common/api/internal/TaskUtil;->setResultOrApiException(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Ll/sni0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
