.class public final synthetic Ll/pdt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/internal/ads/zzcfp;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/internal/ads/zzcfp;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pdt0;->a:Lcom/google/android/gms/internal/ads/zzcfp;

    .line 5
    .line 6
    iput p2, p0, Ll/pdt0;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pdt0;->a:Lcom/google/android/gms/internal/ads/zzcfp;

    .line 2
    .line 3
    iget p0, p0, Ll/pdt0;->b:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/ads/zzcfp;->zzm(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
