.class public final synthetic Ll/z7f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b7h0;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/source/i$a;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/source/i$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z7f;->a:Lcom/google/android/exoplayer2/source/i$a;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z7f;->a:Lcom/google/android/exoplayer2/source/i$a;

    invoke-static {p0}, Lcom/google/android/exoplayer2/ExoPlayer$c;->b(Lcom/google/android/exoplayer2/source/i$a;)Lcom/google/android/exoplayer2/source/i$a;

    move-result-object p0

    return-object p0
.end method
