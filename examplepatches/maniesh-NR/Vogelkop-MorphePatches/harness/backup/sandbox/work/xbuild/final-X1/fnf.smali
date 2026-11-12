.class public final Lfnf;
.super Lcom/google/android/gms/ads/nativead/NativeAd$Image;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lqhe;


# direct methods
.method public constructor <init>(Lqhe;)V
    .registers 2

    iput-object p1, p0, Lfnf;->a:Lqhe;

    invoke-direct {p0}, Lcom/google/android/gms/ads/nativead/NativeAd$Image;-><init>()V

    return-void
.end method


# virtual methods
.method public final getDrawable()Landroid/graphics/drawable/Drawable;
    .registers 1

    iget-object p0, p0, Lfnf;->a:Lqhe;

    iget-object p0, p0, Lqhe;->b:Ltqo;

    return-object p0
.end method

.method public final getScale()D
    .registers 3

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    return-wide v0
.end method

.method public final getUri()Landroid/net/Uri;
    .registers 1

    iget-object p0, p0, Lfnf;->a:Lqhe;

    iget-object p0, p0, Lqhe;->a:Landroid/net/Uri;

    return-object p0
.end method
