.class public final synthetic Ll/iod;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/drm/DefaultDrmSession;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/drm/DefaultDrmSession;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iod;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSession;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iod;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSession;

    invoke-static {p0}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->c(Lcom/google/android/exoplayer2/drm/DefaultDrmSession;)V

    return-void
.end method
