.class public final Ll/d2s0;
.super Ll/s2u0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ll/d6s0;


# direct methods
.method public constructor <init>(Ll/d6s0;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/d2s0;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p1, p0, Ll/d2s0;->b:Ll/d6s0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/s2u0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final o5(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 2
    .param p1    # Lcom/google/android/gms/ads/internal/client/zze;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/d2s0;->b:Ll/d6s0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/d2s0;->a:Landroid/content/Context;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/client/zze;->zzb:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, p0, p1, v1, v1}, Ll/d6s0;->i(Landroid/content/Context;Ljava/lang/String;ZZ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
