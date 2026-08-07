.class public final Ll/vly0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eny0;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/j;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vly0;->a:Lcom/google/android/gms/measurement/internal/j;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/vly0;->a:Lcom/google/android/gms/measurement/internal/j;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/j;->j(Lcom/google/android/gms/measurement/internal/j;)Ll/atx0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/vly0;->a:Lcom/google/android/gms/measurement/internal/j;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/google/android/gms/measurement/internal/j;->j(Lcom/google/android/gms/measurement/internal/j;)Ll/atx0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "AppId not known when logging event"

    .line 30
    .line 31
    invoke-virtual {p0, p1, p2}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void

    .line 35
    :cond_1
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/j;->zzl()Ll/qsx0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/bmy0;

    .line 40
    .line 41
    invoke-direct {v1, p0, p1, p2, p3}, Ll/bmy0;-><init>(Ll/vly0;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
