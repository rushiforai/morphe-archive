.class public final Ll/mvx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/zzo;

.field public final synthetic b:Ll/iux0;


# direct methods
.method public constructor <init>(Ll/iux0;Lcom/google/android/gms/measurement/internal/zzo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/mvx0;->a:Lcom/google/android/gms/measurement/internal/zzo;

    .line 2
    .line 3
    iput-object p1, p0, Ll/mvx0;->b:Ll/iux0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mvx0;->b:Ll/iux0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/iux0;->P2(Ll/iux0;)Lcom/google/android/gms/measurement/internal/j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->u0()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/mvx0;->b:Ll/iux0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/iux0;->P2(Ll/iux0;)Lcom/google/android/gms/measurement/internal/j;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Ll/mvx0;->a:Lcom/google/android/gms/measurement/internal/zzo;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->zzl()Ll/qsx0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/yyx0;->h()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->v0()V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzo;->zza:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p0}, Lcom/google/android/gms/measurement/internal/j;->i(Lcom/google/android/gms/measurement/internal/zzo;)Ll/zqw0;

    .line 34
    .line 35
    .line 36
    return-void
.end method
