.class public final synthetic Ll/g4w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/j4w0;

.field public final synthetic b:Lcom/google/android/gms/ads/internal/client/zze;


# direct methods
.method public synthetic constructor <init>(Ll/j4w0;Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/g4w0;->a:Ll/j4w0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/g4w0;->b:Lcom/google/android/gms/ads/internal/client/zze;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g4w0;->a:Ll/j4w0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/j4w0;->e:Ll/k4w0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/k4w0;->c(Ll/k4w0;)Ll/o5w0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/g4w0;->b:Lcom/google/android/gms/ads/internal/client/zze;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/o5w0;->u(Lcom/google/android/gms/ads/internal/client/zze;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
