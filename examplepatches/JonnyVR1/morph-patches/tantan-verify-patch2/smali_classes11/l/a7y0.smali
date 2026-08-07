.class public final Ll/a7y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eny0;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a7y0;->a:Lcom/google/android/gms/measurement/internal/g;

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
    iget-object p0, p0, Ll/a7y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 6
    .line 7
    const-string v1, "auto"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v1, p2, p3, p1}, Lcom/google/android/gms/measurement/internal/g;->Z(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0, v1, p2, p3}, Lcom/google/android/gms/measurement/internal/g;->N0(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
