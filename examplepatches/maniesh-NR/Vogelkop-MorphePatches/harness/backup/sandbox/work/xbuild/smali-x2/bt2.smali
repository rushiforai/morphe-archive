.class public final Lbt2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;
.implements Lqo3;


# instance fields
.field public final a:Ldx3;

.field public final b:Landroid/view/ViewGroup;

.field public final c:Lnak;

.field public final d:Lrlh;

.field public final e:Lhp2;

.field public final f:Lxs2;

.field public final g:Li7f;

.field public h:Lov0;

.field public final i:Lus2;


# direct methods
.method public constructor <init>(Ldx3;Landroid/view/ViewGroup;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbt2;->a:Ldx3;

    iput-object p2, p0, Lbt2;->b:Landroid/view/ViewGroup;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v0}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v0

    iput-object v0, p0, Lbt2;->c:Lnak;

    invoke-static {v0}, La26;->j(Lnak;)Lrlh;

    move-result-object v0

    iput-object v0, p0, Lbt2;->d:Lrlh;

    new-instance v0, Lhp2;

    const/16 v1, 0xd

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lhp2;-><init>(BZ)V

    iput-object v0, p0, Lbt2;->e:Lhp2;

    new-instance v0, Lxs2;

    invoke-direct {v0, p0}, Lxs2;-><init>(Lbt2;)V

    iput-object v0, p0, Lbt2;->f:Lxs2;

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lbt2;->g:Li7f;

    new-instance v0, Lus2;

    invoke-direct {v0, p0, v2}, Lus2;-><init>(Lbt2;B)V

    iput-object v0, p0, Lbt2;->i:Lus2;

    instance-of p1, p1, Lcom/opera/android/BrowserActivity;

    new-instance v0, Lvw;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p0, p1}, Lvw;-><init>(BLjava/lang/Object;Z)V

    sget-object p0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p2, v0}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lss2;

    iget-object p0, p0, Lbt2;->g:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lss2;

    iget-object p0, p0, Lbt2;->g:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final m()Llak;
    .registers 1

    iget-object p0, p0, Lbt2;->d:Lrlh;

    return-object p0
.end method
