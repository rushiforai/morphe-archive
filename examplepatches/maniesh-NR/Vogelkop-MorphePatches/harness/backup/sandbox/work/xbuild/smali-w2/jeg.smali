.class public final Ljeg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lb2l;

.field public final synthetic b:Lc23;

.field public final synthetic c:Lk6l;

.field public final synthetic d:Lkeg;

.field public final synthetic e:Lleg;

.field public final synthetic f:Leq9;

.field public final synthetic g:Lfq9;

.field public final synthetic h:Lorg/chromium/content/browser/MediaSessionImpl;

.field public final synthetic i:Lmeg;


# direct methods
.method public constructor <init>(Lmeg;Lb2l;Lc23;Lk6l;Lkeg;Lleg;Leq9;Lfq9;Lorg/chromium/content/browser/MediaSessionImpl;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ljeg;->a:Lb2l;

    iput-object p3, p0, Ljeg;->b:Lc23;

    iput-object p4, p0, Ljeg;->c:Lk6l;

    iput-object p5, p0, Ljeg;->d:Lkeg;

    iput-object p6, p0, Ljeg;->e:Lleg;

    iput-object p7, p0, Ljeg;->f:Leq9;

    iput-object p8, p0, Ljeg;->g:Lfq9;

    iput-object p9, p0, Ljeg;->h:Lorg/chromium/content/browser/MediaSessionImpl;

    iput-object p1, p0, Ljeg;->i:Lmeg;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-object v0, p0, Ljeg;->b:Lc23;

    iget-object v1, p0, Ljeg;->a:Lb2l;

    check-cast v1, Ld7l;

    invoke-virtual {v1, v0}, Ld7l;->s0(La2l;)V

    iget-object v0, p0, Ljeg;->c:Lk6l;

    iget-object v1, p0, Ljeg;->d:Lkeg;

    invoke-virtual {v0, v1}, Lk6l;->x(Lj6l;)V

    iget-object v0, p0, Ljeg;->e:Lleg;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lptn;->c(Lorg/chromium/content_public/browser/WebContents;)V

    iget-object v0, p0, Ljeg;->g:Lfq9;

    iget-object v1, p0, Ljeg;->f:Leq9;

    iget-object v1, v1, Leq9;->c:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Ljeg;->h:Lorg/chromium/content/browser/MediaSessionImpl;

    if-eqz v0, :cond_2f

    invoke-static {v0}, Lk1g;->I(Lorg/chromium/content/browser/MediaSessionImpl;)Z

    move-result v1

    iget-object p0, p0, Ljeg;->i:Lmeg;

    iget-object p0, p0, Lmeg;->b:Levn;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Lsc;->l(Ljava/lang/Object;ZZ)V

    :cond_2f
    return-void
.end method
