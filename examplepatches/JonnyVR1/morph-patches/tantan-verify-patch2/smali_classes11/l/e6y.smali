.class public final synthetic Ll/e6y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/source/j$a;

.field public final synthetic b:Lcom/google/android/exoplayer2/source/j;

.field public final synthetic c:Lcom/google/android/exoplayer2/source/i$b;

.field public final synthetic d:Ll/ktx;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/source/j$a;Lcom/google/android/exoplayer2/source/j;Lcom/google/android/exoplayer2/source/i$b;Ll/ktx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e6y;->a:Lcom/google/android/exoplayer2/source/j$a;

    iput-object p2, p0, Ll/e6y;->b:Lcom/google/android/exoplayer2/source/j;

    iput-object p3, p0, Ll/e6y;->c:Lcom/google/android/exoplayer2/source/i$b;

    iput-object p4, p0, Ll/e6y;->d:Ll/ktx;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e6y;->a:Lcom/google/android/exoplayer2/source/j$a;

    iget-object v1, p0, Ll/e6y;->b:Lcom/google/android/exoplayer2/source/j;

    iget-object v2, p0, Ll/e6y;->c:Lcom/google/android/exoplayer2/source/i$b;

    iget-object p0, p0, Ll/e6y;->d:Ll/ktx;

    invoke-static {v0, v1, v2, p0}, Lcom/google/android/exoplayer2/source/j$a;->d(Lcom/google/android/exoplayer2/source/j$a;Lcom/google/android/exoplayer2/source/j;Lcom/google/android/exoplayer2/source/i$b;Ll/ktx;)V

    return-void
.end method
