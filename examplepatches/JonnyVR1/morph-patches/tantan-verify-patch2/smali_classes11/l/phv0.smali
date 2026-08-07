.class public final synthetic Ll/phv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wiu0;


# instance fields
.field public final synthetic a:Ll/scv0;


# direct methods
.method public synthetic constructor <init>(Ll/scv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/phv0;->a:Ll/scv0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(ZLandroid/content/Context;Ll/c7u0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/phv0;->a:Ll/scv0;

    .line 2
    .line 3
    :try_start_0
    iget-object p3, p0, Ll/scv0;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p3, Ll/r8w0;

    .line 6
    .line 7
    invoke-virtual {p3, p1}, Ll/r8w0;->A(Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/scv0;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Ll/r8w0;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ll/r8w0;->E(Landroid/content/Context;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzfho; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    new-instance p1, Lcom/google/android/gms/internal/ads/zzdkv;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/ads/zzdkv;-><init>(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    throw p1
.end method
