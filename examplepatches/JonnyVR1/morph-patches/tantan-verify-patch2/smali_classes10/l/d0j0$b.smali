.class public Ll/d0j0$b;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/d0j0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/d0j0;


# direct methods
.method public constructor <init>(Ll/d0j0;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d0j0$b;->a:Ll/d0j0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/d0j0$b;->a:Ll/d0j0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/d0j0;->v()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
