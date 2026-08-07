.class public final Ll/tbr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/display/DisplayManager$DisplayListener;
.implements Ll/rbr0;


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x11
.end annotation


# instance fields
.field public final a:Landroid/hardware/display/DisplayManager;

.field public b:Ll/obr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/hardware/display/DisplayManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tbr0;->a:Landroid/hardware/display/DisplayManager;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Landroid/content/Context;)Ll/rbr0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "display"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/hardware/display/DisplayManager;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/tbr0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/tbr0;-><init>(Landroid/hardware/display/DisplayManager;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method


# virtual methods
.method public final a(Ll/obr0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/tbr0;->b:Ll/obr0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/tbr0;->a:Landroid/hardware/display/DisplayManager;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v1}, Ll/mpw0;->L(Landroid/os/Handler$Callback;)Landroid/os/Handler;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, p0, v1}, Landroid/hardware/display/DisplayManager;->registerDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;Landroid/os/Handler;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p1, Ll/obr0;->a:Ll/vbr0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tbr0;->c()Landroid/view/Display;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p1, p0}, Ll/vbr0;->b(Ll/vbr0;Landroid/view/Display;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final c()Landroid/view/Display;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tbr0;->a:Landroid/hardware/display/DisplayManager;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final onDisplayAdded(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onDisplayChanged(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tbr0;->b:Ll/obr0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tbr0;->c()Landroid/view/Display;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p1, v0, Ll/obr0;->a:Ll/vbr0;

    .line 12
    .line 13
    invoke-static {p1, p0}, Ll/vbr0;->b(Ll/vbr0;Landroid/view/Display;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final onDisplayRemoved(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final zza()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tbr0;->a:Landroid/hardware/display/DisplayManager;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/hardware/display/DisplayManager;->unregisterDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/tbr0;->b:Ll/obr0;

    .line 8
    .line 9
    return-void
.end method
