.class public final synthetic Ll/rc1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/audio/c$a;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/audio/c$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rc1;->a:Lcom/google/android/exoplayer2/audio/c$a;

    iput-object p2, p0, Ll/rc1;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rc1;->a:Lcom/google/android/exoplayer2/audio/c$a;

    iget-object p0, p0, Ll/rc1;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/google/android/exoplayer2/audio/c$a;->c(Lcom/google/android/exoplayer2/audio/c$a;Ljava/lang/String;)V

    return-void
.end method
