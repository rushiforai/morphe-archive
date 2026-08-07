.class public final synthetic Ll/w0s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/e6s0;


# direct methods
.method public synthetic constructor <init>(Ll/e6s0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/w0s0;->a:Ll/e6s0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const-string v2, "Web view timed out."

    .line 5
    .line 6
    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/w0s0;->a:Ll/e6s0;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/e6s0;->k(Lcom/google/android/gms/internal/consent_sdk/zzg;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
