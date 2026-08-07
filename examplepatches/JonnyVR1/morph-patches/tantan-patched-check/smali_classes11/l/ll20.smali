.class public final synthetic Ll/ll20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/util/NetworkTypeObserver;

.field public final synthetic b:Lcom/google/android/exoplayer2/util/NetworkTypeObserver$c;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/util/NetworkTypeObserver;Lcom/google/android/exoplayer2/util/NetworkTypeObserver$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ll20;->a:Lcom/google/android/exoplayer2/util/NetworkTypeObserver;

    iput-object p2, p0, Ll/ll20;->b:Lcom/google/android/exoplayer2/util/NetworkTypeObserver$c;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ll20;->a:Lcom/google/android/exoplayer2/util/NetworkTypeObserver;

    iget-object p0, p0, Ll/ll20;->b:Lcom/google/android/exoplayer2/util/NetworkTypeObserver$c;

    invoke-static {v0, p0}, Lcom/google/android/exoplayer2/util/NetworkTypeObserver;->a(Lcom/google/android/exoplayer2/util/NetworkTypeObserver;Lcom/google/android/exoplayer2/util/NetworkTypeObserver$c;)V

    return-void
.end method
