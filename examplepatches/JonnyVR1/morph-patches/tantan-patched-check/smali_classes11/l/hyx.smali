.class public final synthetic Ll/hyx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/p;

.field public final synthetic b:Lcom/google/common/collect/ImmutableList$a;

.field public final synthetic c:Lcom/google/android/exoplayer2/source/i$b;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/p;Lcom/google/common/collect/ImmutableList$a;Lcom/google/android/exoplayer2/source/i$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hyx;->a:Lcom/google/android/exoplayer2/p;

    iput-object p2, p0, Ll/hyx;->b:Lcom/google/common/collect/ImmutableList$a;

    iput-object p3, p0, Ll/hyx;->c:Lcom/google/android/exoplayer2/source/i$b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hyx;->a:Lcom/google/android/exoplayer2/p;

    iget-object v1, p0, Ll/hyx;->b:Lcom/google/common/collect/ImmutableList$a;

    iget-object p0, p0, Ll/hyx;->c:Lcom/google/android/exoplayer2/source/i$b;

    invoke-static {v0, v1, p0}, Lcom/google/android/exoplayer2/p;->a(Lcom/google/android/exoplayer2/p;Lcom/google/common/collect/ImmutableList$a;Lcom/google/android/exoplayer2/source/i$b;)V

    return-void
.end method
