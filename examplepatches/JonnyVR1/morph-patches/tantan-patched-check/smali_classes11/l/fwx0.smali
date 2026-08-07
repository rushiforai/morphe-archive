.class public final Ll/fwx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# instance fields
.field public final a:Landroid/os/Handler;

.field public final synthetic b:Ll/mwx0;


# direct methods
.method public constructor <init>(Ll/mwx0;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fwx0;->b:Ll/mwx0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/fwx0;->a:Landroid/os/Handler;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onAudioFocusChange(I)V
    .locals 1

    .line 1
    new-instance v0, Ll/awx0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/awx0;-><init>(Ll/fwx0;I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/fwx0;->a:Landroid/os/Handler;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
