.class public final synthetic Ll/ude;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/drm/b$a;

.field public final synthetic b:Lcom/google/android/exoplayer2/drm/b;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/drm/b$a;Lcom/google/android/exoplayer2/drm/b;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ude;->a:Lcom/google/android/exoplayer2/drm/b$a;

    iput-object p2, p0, Ll/ude;->b:Lcom/google/android/exoplayer2/drm/b;

    iput p3, p0, Ll/ude;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ude;->a:Lcom/google/android/exoplayer2/drm/b$a;

    iget-object v1, p0, Ll/ude;->b:Lcom/google/android/exoplayer2/drm/b;

    iget p0, p0, Ll/ude;->c:I

    invoke-static {v0, v1, p0}, Lcom/google/android/exoplayer2/drm/b$a;->d(Lcom/google/android/exoplayer2/drm/b$a;Lcom/google/android/exoplayer2/drm/b;I)V

    return-void
.end method
