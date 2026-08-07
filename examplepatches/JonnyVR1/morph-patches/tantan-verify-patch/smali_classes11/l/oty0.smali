.class public final Ll/oty0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nqy0;


# instance fields
.field public final synthetic a:Ll/pty0;


# direct methods
.method public synthetic constructor <init>(Ll/pty0;Ll/nty0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/oty0;->a:Ll/pty0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    const-string v0, "MediaCodecAudioRenderer"

    .line 2
    .line 3
    const-string v1, "Audio sink error"

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Ll/y4w0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/oty0;->a:Ll/pty0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/pty0;->U0(Ll/pty0;)Ll/fqy0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p1}, Ll/fqy0;->b(Ljava/lang/Exception;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final zzb()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/oty0;->a:Ll/pty0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/pty0;->T0(Ll/pty0;)Ll/sey0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/pty0;->T0(Ll/pty0;)Ll/sey0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/sey0;->zzb()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
