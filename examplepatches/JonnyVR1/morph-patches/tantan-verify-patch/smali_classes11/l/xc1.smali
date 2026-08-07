.class public final synthetic Ll/xc1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/audio/c$a;

.field public final synthetic b:Lcom/google/android/exoplayer2/k;

.field public final synthetic c:Ll/nid;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/audio/c$a;Lcom/google/android/exoplayer2/k;Ll/nid;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xc1;->a:Lcom/google/android/exoplayer2/audio/c$a;

    iput-object p2, p0, Ll/xc1;->b:Lcom/google/android/exoplayer2/k;

    iput-object p3, p0, Ll/xc1;->c:Ll/nid;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xc1;->a:Lcom/google/android/exoplayer2/audio/c$a;

    iget-object v1, p0, Ll/xc1;->b:Lcom/google/android/exoplayer2/k;

    iget-object p0, p0, Ll/xc1;->c:Ll/nid;

    invoke-static {v0, v1, p0}, Lcom/google/android/exoplayer2/audio/c$a;->d(Lcom/google/android/exoplayer2/audio/c$a;Lcom/google/android/exoplayer2/k;Ll/nid;)V

    return-void
.end method
