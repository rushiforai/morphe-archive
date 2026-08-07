.class public final synthetic Ll/mqd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/source/rtsp/g$g;

.field public final synthetic b:[B

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/source/rtsp/g$g;[BLjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mqd0;->a:Lcom/google/android/exoplayer2/source/rtsp/g$g;

    iput-object p2, p0, Ll/mqd0;->b:[B

    iput-object p3, p0, Ll/mqd0;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mqd0;->a:Lcom/google/android/exoplayer2/source/rtsp/g$g;

    iget-object v1, p0, Ll/mqd0;->b:[B

    iget-object p0, p0, Ll/mqd0;->c:Ljava/util/List;

    invoke-static {v0, v1, p0}, Lcom/google/android/exoplayer2/source/rtsp/g$g;->b(Lcom/google/android/exoplayer2/source/rtsp/g$g;[BLjava/util/List;)V

    return-void
.end method
