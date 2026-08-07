.class public final synthetic Ll/rmv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ymv0;

.field public final synthetic b:Lcom/google/android/gms/ads/internal/client/zze;


# direct methods
.method public synthetic constructor <init>(Ll/ymv0;Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rmv0;->a:Ll/ymv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rmv0;->b:Lcom/google/android/gms/ads/internal/client/zze;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rmv0;->a:Ll/ymv0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ymv0;->e:Ll/zmv0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/zmv0;->c(Ll/zmv0;)Ll/jmv0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/jmv0;->a()Ll/s6u0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Ll/rmv0;->b:Lcom/google/android/gms/ads/internal/client/zze;

    .line 14
    .line 15
    invoke-interface {v0, p0}, Ll/s6u0;->u(Lcom/google/android/gms/ads/internal/client/zze;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
