.class public final synthetic Ll/jhu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k8u0;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Lcom/google/android/gms/internal/ads/zzcei;

.field public final synthetic c:Ll/q6w0;

.field public final synthetic d:Ll/o7w0;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/q6w0;Ll/o7w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jhu0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jhu0;->b:Lcom/google/android/gms/internal/ads/zzcei;

    .line 7
    .line 8
    iput-object p3, p0, Ll/jhu0;->c:Ll/q6w0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/jhu0;->d:Ll/o7w0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final zzr()V
    .locals 4

    .line 1
    invoke-static {}, Ll/bxy0;->u()Ll/d6s0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/jhu0;->a:Landroid/content/Context;

    .line 6
    .line 7
    iget-object v2, p0, Ll/jhu0;->b:Lcom/google/android/gms/internal/ads/zzcei;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v3, p0, Ll/jhu0;->c:Ll/q6w0;

    .line 12
    .line 13
    iget-object v3, v3, Ll/q6w0;->D:Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    iget-object p0, p0, Ll/jhu0;->d:Ll/o7w0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/o7w0;->f:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/d6s0;->n(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    return-void
.end method
