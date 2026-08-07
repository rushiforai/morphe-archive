.class public final synthetic Ll/yry0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/media/AudioTrack;

.field public final synthetic b:Ll/nqy0;

.field public final synthetic c:Landroid/os/Handler;

.field public final synthetic d:Ll/jqy0;

.field public final synthetic e:Ll/bjv0;


# direct methods
.method public synthetic constructor <init>(Landroid/media/AudioTrack;Ll/nqy0;Landroid/os/Handler;Ll/jqy0;Ll/bjv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yry0;->a:Landroid/media/AudioTrack;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yry0;->b:Ll/nqy0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/yry0;->c:Landroid/os/Handler;

    .line 9
    .line 10
    iput-object p4, p0, Ll/yry0;->d:Ll/jqy0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/yry0;->e:Ll/bjv0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yry0;->a:Landroid/media/AudioTrack;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yry0;->b:Ll/nqy0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/yry0;->c:Landroid/os/Handler;

    .line 6
    .line 7
    iget-object v3, p0, Ll/yry0;->d:Ll/jqy0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/yry0;->e:Ll/bjv0;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Ll/jty0;->x(Landroid/media/AudioTrack;Ll/nqy0;Landroid/os/Handler;Ll/jqy0;Ll/bjv0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
