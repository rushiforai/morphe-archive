.class public final synthetic Ll/t60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y60;

.field public final synthetic b:Lcom/google/android/gms/ads/nativead/NativeAdView;


# direct methods
.method public synthetic constructor <init>(Ll/y60;Lcom/google/android/gms/ads/nativead/NativeAdView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t60;->a:Ll/y60;

    iput-object p2, p0, Ll/t60;->b:Lcom/google/android/gms/ads/nativead/NativeAdView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t60;->a:Ll/y60;

    iget-object p0, p0, Ll/t60;->b:Lcom/google/android/gms/ads/nativead/NativeAdView;

    invoke-static {v0, p0}, Ll/y60;->k(Ll/y60;Lcom/google/android/gms/ads/nativead/NativeAdView;)V

    return-void
.end method
