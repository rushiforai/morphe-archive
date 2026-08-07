.class public final synthetic Ll/uog;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# instance fields
.field public final synthetic a:Ll/lpg;


# direct methods
.method public synthetic constructor <init>(Ll/lpg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uog;->a:Ll/lpg;

    return-void
.end method


# virtual methods
.method public final onAudioFocusChange(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uog;->a:Ll/lpg;

    invoke-static {p0, p1}, Ll/lpg;->k(Ll/lpg;I)V

    return-void
.end method
