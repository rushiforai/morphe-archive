.class public final synthetic Ll/v8f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/i;

.field public final synthetic b:Lcom/google/android/exoplayer2/j$e;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/j$e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v8f;->a:Lcom/google/android/exoplayer2/i;

    iput-object p2, p0, Ll/v8f;->b:Lcom/google/android/exoplayer2/j$e;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v8f;->a:Lcom/google/android/exoplayer2/i;

    iget-object p0, p0, Ll/v8f;->b:Lcom/google/android/exoplayer2/j$e;

    invoke-static {v0, p0}, Lcom/google/android/exoplayer2/i;->z(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/j$e;)V

    return-void
.end method
