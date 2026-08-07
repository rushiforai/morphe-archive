.class public final synthetic Ll/sha0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/md20;

.field public final synthetic b:Landroid/widget/FrameLayout;

.field public final synthetic c:Lcom/google/android/gms/ads/nativead/NativeAdView;


# direct methods
.method public synthetic constructor <init>(Ll/md20;Landroid/widget/FrameLayout;Lcom/google/android/gms/ads/nativead/NativeAdView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sha0;->a:Ll/md20;

    iput-object p2, p0, Ll/sha0;->b:Landroid/widget/FrameLayout;

    iput-object p3, p0, Ll/sha0;->c:Lcom/google/android/gms/ads/nativead/NativeAdView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sha0;->a:Ll/md20;

    iget-object v1, p0, Ll/sha0;->b:Landroid/widget/FrameLayout;

    iget-object p0, p0, Ll/sha0;->c:Lcom/google/android/gms/ads/nativead/NativeAdView;

    invoke-static {v0, v1, p0}, Ll/aia0;->g(Ll/md20;Landroid/widget/FrameLayout;Lcom/google/android/gms/ads/nativead/NativeAdView;)V

    return-void
.end method
