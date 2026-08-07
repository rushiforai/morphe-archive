.class public final synthetic Ll/ad1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/audio/c$a;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/audio/c$a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ad1;->a:Lcom/google/android/exoplayer2/audio/c$a;

    iput-boolean p2, p0, Ll/ad1;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ad1;->a:Lcom/google/android/exoplayer2/audio/c$a;

    iget-boolean p0, p0, Ll/ad1;->b:Z

    invoke-static {v0, p0}, Lcom/google/android/exoplayer2/audio/c$a;->g(Lcom/google/android/exoplayer2/audio/c$a;Z)V

    return-void
.end method
