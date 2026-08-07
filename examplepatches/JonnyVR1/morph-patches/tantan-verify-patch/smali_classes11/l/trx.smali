.class public final synthetic Ll/trx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil$f;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/k;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/trx;->a:Lcom/google/android/exoplayer2/k;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/trx;->a:Lcom/google/android/exoplayer2/k;

    check-cast p1, Lcom/google/android/exoplayer2/mediacodec/d;

    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil;->d(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/mediacodec/d;)I

    move-result p0

    return p0
.end method
