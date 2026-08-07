.class public Ll/psd0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/psd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public final b:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public final c:Z

.field public d:Z

.field public e:Ll/kcg0;

.field public f:Ll/kcg0;

.field public g:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public h:Z

.field public i:Z


# direct methods
.method public constructor <init>(Ll/pcj;Lrx/c;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/psd0$c;->d:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Ll/psd0$c;->g:Ljava/lang/Object;

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/psd0$c;->h:Z

    .line 11
    .line 12
    iput-object p1, p0, Ll/psd0$c;->a:Ll/pcj;

    .line 13
    .line 14
    iput-object p2, p0, Ll/psd0$c;->b:Lrx/c;

    .line 15
    .line 16
    iput-boolean p3, p0, Ll/psd0$c;->c:Z

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/psd0$c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/psd0$c;->f()V

    return-void
.end method

.method public static bridge synthetic b(Ll/psd0$c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/psd0$c;->c:Z

    return p0
.end method

.method public static bridge synthetic c(Ll/psd0$c;)Ll/pcj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/psd0$c;->a:Ll/pcj;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/psd0$c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/psd0$c;->f()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/psd0$c;->e(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Ll/gcg0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/psd0$c;->b:Lrx/c;

    .line 2
    .line 3
    new-instance v1, Ll/psd0$c$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/psd0$c$a;-><init>(Ll/psd0$c;Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/psd0$c;->f:Ll/kcg0;

    .line 13
    .line 14
    new-instance v0, Ll/qsd0;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/qsd0;-><init>(Ll/psd0$c;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/psd0$c;->g:Ljava/lang/Object;

    .line 3
    .line 4
    iget-object v1, p0, Ll/psd0$c;->e:Ll/kcg0;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-interface {v1}, Ll/kcg0;->isUnsubscribed()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/psd0$c;->e:Ll/kcg0;

    .line 15
    .line 16
    invoke-interface {v1}, Ll/kcg0;->unsubscribe()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iput-object v0, p0, Ll/psd0$c;->e:Ll/kcg0;

    .line 20
    .line 21
    iget-object v1, p0, Ll/psd0$c;->f:Ll/kcg0;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ll/kcg0;->isUnsubscribed()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    iget-object v1, p0, Ll/psd0$c;->f:Ll/kcg0;

    .line 32
    .line 33
    invoke-interface {v1}, Ll/kcg0;->unsubscribe()V

    .line 34
    .line 35
    .line 36
    :cond_1
    iput-object v0, p0, Ll/psd0$c;->f:Ll/kcg0;

    .line 37
    .line 38
    return-void
.end method
