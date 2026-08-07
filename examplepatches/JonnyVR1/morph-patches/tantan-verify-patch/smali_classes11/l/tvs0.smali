.class public final Ll/tvs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vhu0;


# instance fields
.field public final a:Ll/bou0;

.field public final b:Ll/bou0;


# direct methods
.method public constructor <init>(Ll/bou0;Ll/bou0;Ll/bou0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tvs0;->a:Ll/bou0;

    .line 5
    .line 6
    iput-object p3, p0, Ll/tvs0;->b:Ll/bou0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Lcom/google/android/gms/internal/consent_sdk/zzbr;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tvs0;->a:Ll/bou0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/bxs0;

    .line 8
    .line 9
    invoke-static {}, Ll/yur0;->a()Landroid/os/Handler;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Ll/tvs0;->b:Ll/bou0;

    .line 14
    .line 15
    check-cast p0, Ll/b3t0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/b3t0;->a()Ll/z1t0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v2, Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 22
    .line 23
    invoke-direct {v2, v0, v1, p0}, Lcom/google/android/gms/internal/consent_sdk/zzbr;-><init>(Ll/bxs0;Landroid/os/Handler;Ll/z1t0;)V

    .line 24
    .line 25
    .line 26
    return-object v2
.end method

.method public final bridge synthetic zza()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tvs0;->a()Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
