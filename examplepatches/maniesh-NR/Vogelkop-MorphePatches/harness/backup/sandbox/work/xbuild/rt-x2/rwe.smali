.class public final Lrwe;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lbpd;

.field public final b:Lxg;

.field public final c:Lqim;

.field public final d:Lgjm;

.field public final e:Leej;

.field public final f:Lyqd;

.field public final g:Lrqd;

.field public final h:Lcom/opera/android/BrowserActivity;

.field public final i:Lorm;

.field public j:Lqz;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lgjm;Lxg;Lorm;Leej;)V
    .registers 11

    new-instance v0, Lbpd;

    invoke-direct {v0, p1}, Lbpd;-><init>(Landroid/content/Context;)V

    iget-object v1, p1, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lyqd;

    const/16 v3, 0x11

    invoke-direct {v2, p2, v3}, Lyqd;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lrqd;

    const/16 v4, 0x17

    invoke-direct {v3, v4}, Lrqd;-><init>(B)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lrwe;->a:Lbpd;

    iput-object p3, p0, Lrwe;->b:Lxg;

    iput-object v1, p0, Lrwe;->c:Lqim;

    iput-object p2, p0, Lrwe;->d:Lgjm;

    iput-object p5, p0, Lrwe;->e:Leej;

    iput-object v2, p0, Lrwe;->f:Lyqd;

    iput-object v3, p0, Lrwe;->g:Lrqd;

    iput-object p1, p0, Lrwe;->h:Lcom/opera/android/BrowserActivity;

    iput-object p4, p0, Lrwe;->i:Lorm;

    new-instance p1, Lqz;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Lqz;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lrwe;->j:Lqz;

    invoke-virtual {p3, p1}, Lxg;->a(La2l;)V

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lrwe;->j:Lqz;

    if-eqz p1, :cond_13

    iget-object v0, p0, Lrwe;->b:Lxg;

    invoke-virtual {v0, p1}, Lxg;->b(La2l;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lrwe;->j:Lqz;

    :cond_13
    return-void
.end method
