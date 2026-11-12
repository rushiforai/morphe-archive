.class public final Lyy;
.super Llim;
.source "SourceFile"

# interfaces
.implements Ldue;


# instance fields
.field public final a:Lwy;

.field public final b:Lfqe;

.field public final c:Lfue;

.field private final d:Lq8j;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lq8j;"
        }
    .end annotation
.end field

.field public e:Z


# direct methods
.method public constructor <init>(Lcue;Lwy;Lfqe;Lfue;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lxy;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lxy;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lyy;->d:Lq8j;

    iput-object p2, p0, Lyy;->a:Lwy;

    iput-object p3, p0, Lyy;->b:Lfqe;

    iput-object p4, p0, Lyy;->c:Lfue;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 p1, 0x1

    if-eq p0, p1, :cond_1b

    const-string p0, ""

    goto :goto_1d

    :cond_1b
    const-string p0, "Newsfeed"

    :goto_1d
    iget-object p1, p2, Lwy;->e:Lvzk;

    iget-object p1, p1, Lvzk;->d:Ljava/lang/Object;

    check-cast p1, Li5o;

    iput-object p0, p1, Li5o;->n:Ljava/lang/Object;

    invoke-virtual {p1}, Li5o;->i()V

    return-void
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 2

    iget-object p1, p0, Lyy;->c:Lfue;

    invoke-virtual {p1, p0}, Lfue;->b(Ldue;)V

    iget-object p1, p0, Lyy;->b:Lfqe;

    iget-object p0, p0, Lyy;->d:Lq8j;

    invoke-virtual {p1, p0}, Lfqe;->a(Lq8j;)V

    return-void
.end method

.method public final b(Lcue;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_a

    const-string p1, ""

    goto :goto_c

    :cond_a
    const-string p1, "Newsfeed"

    :goto_c
    iget-object p0, p0, Lyy;->a:Lwy;

    iget-object p0, p0, Lwy;->e:Lvzk;

    iget-object p0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast p0, Li5o;

    iput-object p1, p0, Li5o;->n:Ljava/lang/Object;

    invoke-virtual {p0}, Li5o;->i()V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lyy;->c:Lfue;

    invoke-virtual {p1, p0}, Lfue;->e(Ldue;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lyy;->e:Z

    return-void
.end method
