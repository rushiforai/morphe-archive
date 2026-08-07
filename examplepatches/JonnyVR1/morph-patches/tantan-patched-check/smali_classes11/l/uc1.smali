.class public final synthetic Ll/uc1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/audio/c$a;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/audio/c$a;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uc1;->a:Lcom/google/android/exoplayer2/audio/c$a;

    iput-wide p2, p0, Ll/uc1;->b:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uc1;->a:Lcom/google/android/exoplayer2/audio/c$a;

    iget-wide v1, p0, Ll/uc1;->b:J

    invoke-static {v0, v1, v2}, Lcom/google/android/exoplayer2/audio/c$a;->a(Lcom/google/android/exoplayer2/audio/c$a;J)V

    return-void
.end method
