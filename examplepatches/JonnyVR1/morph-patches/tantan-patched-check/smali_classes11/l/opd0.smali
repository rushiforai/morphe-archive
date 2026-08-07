.class public final synthetic Ll/opd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/source/rtsp/b;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/google/android/exoplayer2/source/rtsp/a;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/source/rtsp/b;Ljava/lang/String;Lcom/google/android/exoplayer2/source/rtsp/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/opd0;->a:Lcom/google/android/exoplayer2/source/rtsp/b;

    iput-object p2, p0, Ll/opd0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/opd0;->c:Lcom/google/android/exoplayer2/source/rtsp/a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/opd0;->a:Lcom/google/android/exoplayer2/source/rtsp/b;

    iget-object v1, p0, Ll/opd0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/opd0;->c:Lcom/google/android/exoplayer2/source/rtsp/a;

    invoke-static {v0, v1, p0}, Lcom/google/android/exoplayer2/source/rtsp/b;->b(Lcom/google/android/exoplayer2/source/rtsp/b;Ljava/lang/String;Lcom/google/android/exoplayer2/source/rtsp/a;)V

    return-void
.end method
