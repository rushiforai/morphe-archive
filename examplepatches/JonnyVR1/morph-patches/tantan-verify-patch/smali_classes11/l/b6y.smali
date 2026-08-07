.class public final synthetic Ll/b6y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/source/j$a;

.field public final synthetic b:Lcom/google/android/exoplayer2/source/j;

.field public final synthetic c:Ll/mtv;

.field public final synthetic d:Ll/ktx;

.field public final synthetic e:Ljava/io/IOException;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/source/j$a;Lcom/google/android/exoplayer2/source/j;Ll/mtv;Ll/ktx;Ljava/io/IOException;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b6y;->a:Lcom/google/android/exoplayer2/source/j$a;

    iput-object p2, p0, Ll/b6y;->b:Lcom/google/android/exoplayer2/source/j;

    iput-object p3, p0, Ll/b6y;->c:Ll/mtv;

    iput-object p4, p0, Ll/b6y;->d:Ll/ktx;

    iput-object p5, p0, Ll/b6y;->e:Ljava/io/IOException;

    iput-boolean p6, p0, Ll/b6y;->f:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/b6y;->a:Lcom/google/android/exoplayer2/source/j$a;

    iget-object v1, p0, Ll/b6y;->b:Lcom/google/android/exoplayer2/source/j;

    iget-object v2, p0, Ll/b6y;->c:Ll/mtv;

    iget-object v3, p0, Ll/b6y;->d:Ll/ktx;

    iget-object v4, p0, Ll/b6y;->e:Ljava/io/IOException;

    iget-boolean v5, p0, Ll/b6y;->f:Z

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/j$a;->b(Lcom/google/android/exoplayer2/source/j$a;Lcom/google/android/exoplayer2/source/j;Ll/mtv;Ll/ktx;Ljava/io/IOException;Z)V

    return-void
.end method
