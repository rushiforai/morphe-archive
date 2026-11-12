.class public final Lhoo;
.super Lljo;
.source "SourceFile"


# instance fields
.field public final b:Lssi;

.field public final c:Landroid/os/Handler;

.field public final d:Lmjo;

.field public final e:Lfr;


# direct methods
.method public constructor <init>(Lmjo;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lssi;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lssi;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lhoo;->b:Lssi;

    new-instance v0, Lfr;

    const/4 v1, 0x4

    const/16 v2, 0x1d

    invoke-direct {v0, v2, v1}, Lfr;-><init>(BI)V

    iput-object v0, p0, Lhoo;->e:Lfr;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lhoo;->c:Landroid/os/Handler;

    iput-object p1, p0, Lhoo;->d:Lmjo;

    return-void
.end method
