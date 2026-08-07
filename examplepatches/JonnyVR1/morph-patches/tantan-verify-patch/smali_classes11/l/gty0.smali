.class public final Ll/gty0;
.super Landroid/media/AudioTrack$StreamEventCallback;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/jty0;

.field public final synthetic b:Ll/hty0;


# direct methods
.method public constructor <init>(Ll/hty0;Ll/jty0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/gty0;->a:Ll/jty0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/gty0;->b:Ll/hty0;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/media/AudioTrack$StreamEventCallback;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onDataRequest(Landroid/media/AudioTrack;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/gty0;->b:Ll/hty0;

    .line 2
    .line 3
    iget-object p2, p2, Ll/hty0;->c:Ll/jty0;

    .line 4
    .line 5
    invoke-static {p2}, Ll/jty0;->u(Ll/jty0;)Landroid/media/AudioTrack;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/gty0;->b:Ll/hty0;

    .line 17
    .line 18
    iget-object p0, p0, Ll/hty0;->c:Ll/jty0;

    .line 19
    .line 20
    invoke-static {p0}, Ll/jty0;->v(Ll/jty0;)Ll/nqy0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-static {p0}, Ll/jty0;->y(Ll/jty0;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    invoke-static {p0}, Ll/jty0;->v(Ll/jty0;)Ll/nqy0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0}, Ll/nqy0;->zzb()V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public final onTearDown(Landroid/media/AudioTrack;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gty0;->b:Ll/hty0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/hty0;->c:Ll/jty0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jty0;->u(Ll/jty0;)Landroid/media/AudioTrack;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/gty0;->b:Ll/hty0;

    .line 17
    .line 18
    iget-object p0, p0, Ll/hty0;->c:Ll/jty0;

    .line 19
    .line 20
    invoke-static {p0}, Ll/jty0;->v(Ll/jty0;)Ll/nqy0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-static {p0}, Ll/jty0;->y(Ll/jty0;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    invoke-static {p0}, Ll/jty0;->v(Ll/jty0;)Ll/nqy0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0}, Ll/nqy0;->zzb()V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method
