.class public final synthetic Ll/zc1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/audio/c$a;

.field public final synthetic b:I

.field public final synthetic c:J

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/audio/c$a;IJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zc1;->a:Lcom/google/android/exoplayer2/audio/c$a;

    iput p2, p0, Ll/zc1;->b:I

    iput-wide p3, p0, Ll/zc1;->c:J

    iput-wide p5, p0, Ll/zc1;->d:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/zc1;->a:Lcom/google/android/exoplayer2/audio/c$a;

    iget v1, p0, Ll/zc1;->b:I

    iget-wide v2, p0, Ll/zc1;->c:J

    iget-wide v4, p0, Ll/zc1;->d:J

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer2/audio/c$a;->f(Lcom/google/android/exoplayer2/audio/c$a;IJJ)V

    return-void
.end method
