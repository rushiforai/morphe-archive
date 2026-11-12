.class public final Lzvi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field public final a:Landroid/os/Handler;

.field public b:Lfh4;

.field public final synthetic c:Lawi;


# direct methods
.method public constructor <init>(Lawi;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzvi;->c:Lawi;

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lzvi;->a:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public final a(Landroid/text/Editable;)V
    .registers 5

    iget-object v0, p0, Lzvi;->b:Lfh4;

    iget-object v1, p0, Lzvi;->a:Landroid/os/Handler;

    if-eqz v0, :cond_9

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_9
    new-instance v0, Lfh4;

    const/16 v2, 0x10

    invoke-direct {v0, p0, p1, v2}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lzvi;->b:Lfh4;

    const-wide/16 p0, 0x5dc

    invoke-virtual {v1, v0, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    invoke-virtual {p0, p1}, Lzvi;->a(Landroid/text/Editable;)V

    iget-object p0, p0, Lzvi;->c:Lawi;

    invoke-virtual {p0}, Lawi;->K0()V

    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method
