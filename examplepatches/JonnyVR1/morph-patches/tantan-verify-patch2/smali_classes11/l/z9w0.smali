.class public final Ll/z9w0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/z9w0;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/internal/ads/zzfiz;Landroid/content/Context;Ll/d9w0;Ll/faw0;)Ll/y9w0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z9w0;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/y9w0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/i9w0;

    .line 12
    .line 13
    invoke-static {p1, p2}, Lcom/google/android/gms/internal/ads/zzfjc;->g(Lcom/google/android/gms/internal/ads/zzfiz;Landroid/content/Context;)Lcom/google/android/gms/internal/ads/zzfjc;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-direct {v0, p2}, Ll/i9w0;-><init>(Lcom/google/android/gms/internal/ads/zzfjc;)V

    .line 18
    .line 19
    .line 20
    new-instance p2, Ll/haw0;

    .line 21
    .line 22
    invoke-direct {p2, v0, p3, p4}, Ll/haw0;-><init>(Ll/h9w0;Ll/d9w0;Ll/faw0;)V

    .line 23
    .line 24
    .line 25
    new-instance p3, Ll/y9w0;

    .line 26
    .line 27
    invoke-direct {p3, v0, p2}, Ll/y9w0;-><init>(Ll/h9w0;Ll/haw0;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/z9w0;->a:Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-virtual {p0, p1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    return-object p3

    .line 36
    :cond_0
    return-object v0
.end method
