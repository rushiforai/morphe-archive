.class public final synthetic Ll/n3v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/v3v0;

.field public final synthetic b:Lcom/google/android/gms/internal/ads/zzbze;


# direct methods
.method public synthetic constructor <init>(Ll/v3v0;Lcom/google/android/gms/internal/ads/zzbze;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n3v0;->a:Ll/v3v0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/n3v0;->b:Lcom/google/android/gms/internal/ads/zzbze;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n3v0;->a:Ll/v3v0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n3v0;->b:Lcom/google/android/gms/internal/ads/zzbze;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/v3v0;->c(Lcom/google/android/gms/internal/ads/zzbze;)Ljava/io/InputStream;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
