.class public final Ltech/sud/gip/asr/base/Sudfor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic Suddo:Ltech/sud/gip/asr/base/Sudint;


# direct methods
.method public constructor <init>(Ltech/sud/gip/asr/base/Sudint;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/gip/asr/base/Sudfor;->Suddo:Ltech/sud/gip/asr/base/Sudint;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/Sudfor;->Suddo:Ltech/sud/gip/asr/base/Sudint;

    .line 2
    .line 3
    invoke-virtual {v0}, Ltech/sud/gip/asr/base/Sudint;->Suddo()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ltech/sud/gip/asr/base/Sudfor;->Suddo:Ltech/sud/gip/asr/base/Sudint;

    .line 7
    .line 8
    iget-object v0, p0, Ltech/sud/gip/asr/base/Sudint;->Sudgoto:Landroid/os/Handler;

    .line 9
    .line 10
    iget-object v1, p0, Ltech/sud/gip/asr/base/Sudint;->Sudelse:Ltech/sud/gip/asr/base/Sudfor;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ltech/sud/gip/asr/base/Sudint;->Sudgoto:Landroid/os/Handler;

    .line 16
    .line 17
    iget-object p0, p0, Ltech/sud/gip/asr/base/Sudint;->Sudelse:Ltech/sud/gip/asr/base/Sudfor;

    .line 18
    .line 19
    const-wide/16 v1, 0x2710

    .line 20
    .line 21
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method
