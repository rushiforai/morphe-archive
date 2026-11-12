.class public final Lhq9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lgq9;

.field public final b:Lxr5;

.field public final c:Lumi;

.field public final d:Lx5f;

.field public final e:Lhd;

.field public final f:Lki;

.field public final g:Lqt6;

.field public h:S

.field public final i:Lxy0;


# direct methods
.method public constructor <init>(Lxr5;Lcom/opera/android/browser/chromium/ChromiumContent;Lumi;Lx5f;Lhd;Lki;ZZ)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lgq9;

    invoke-direct {v0, p0}, Lgq9;-><init>(Lhq9;)V

    iput-object v0, p0, Lhq9;->a:Lgq9;

    iput-object p1, p0, Lhq9;->b:Lxr5;

    iput-object p3, p0, Lhq9;->c:Lumi;

    iput-object p4, p0, Lhq9;->d:Lx5f;

    iput-object p5, p0, Lhq9;->e:Lhd;

    iput-object p6, p0, Lhq9;->f:Lki;

    new-instance p1, Lqt6;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p0, p1, Lqt6;->f:Ljava/lang/Object;

    new-instance p3, Li18;

    iget-object p4, p0, Lhq9;->c:Lumi;

    iget-object p5, p0, Lhq9;->d:Lx5f;

    iget-object p6, p0, Lhq9;->e:Lhd;

    iget-object v0, p0, Lhq9;->f:Lki;

    invoke-direct {p3, p4, p5, p6, v0}, Li18;-><init>(Lumi;Lx5f;Lhd;Lki;)V

    iput-object p3, p1, Lqt6;->d:Ljava/lang/Object;

    iput-object p2, p1, Lqt6;->c:Ljava/lang/Object;

    iput-boolean p7, p1, Lqt6;->a:Z

    iput-boolean p8, p1, Lqt6;->b:Z

    iput-object p1, p0, Lhq9;->g:Lqt6;

    new-instance p1, Lxy0;

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {p1, p2}, Lxy0;-><init>(Ljava/lang/ref/WeakReference;)V

    iput-object p1, p0, Lhq9;->i:Lxy0;

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
