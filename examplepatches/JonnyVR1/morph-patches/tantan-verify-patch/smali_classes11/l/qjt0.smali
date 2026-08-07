.class public final Ll/qjt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/utt0;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/common/api/internal/ListenerHolder;

.field public final synthetic b:Ll/sni0;


# direct methods
.method public constructor <init>(Ll/f5u0;Lcom/google/android/gms/common/api/internal/ListenerHolder;Ll/sni0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/qjt0;->a:Lcom/google/android/gms/common/api/internal/ListenerHolder;

    .line 2
    .line 3
    iput-object p3, p0, Ll/qjt0;->b:Ll/sni0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/common/api/internal/ListenerHolder;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public final zza()Lcom/google/android/gms/common/api/internal/ListenerHolder;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qjt0;->a:Lcom/google/android/gms/common/api/internal/ListenerHolder;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzb()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qjt0;->b:Ll/sni0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/sni0;->e(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method
