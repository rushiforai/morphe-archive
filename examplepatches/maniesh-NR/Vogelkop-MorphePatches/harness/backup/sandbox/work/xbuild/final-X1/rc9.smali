.class public final Lrc9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ltcl;

.field public final b:Lbf9;

.field public final c:Ljava/util/ArrayList;

.field public final d:Lh7f;

.field private final e:Lsc9;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public final f:Ljava/util/ArrayList;

.field public g:Lih4;


# direct methods
.method public constructor <init>(Ltcl;Lbf9;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lrc9;->c:Ljava/util/ArrayList;

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lrc9;->d:Lh7f;

    new-instance v0, Lqc9;

    invoke-direct {v0, p0}, Lqc9;-><init>(Lrc9;)V

    iput-object v0, p0, Lrc9;->e:Lsc9;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lrc9;->f:Ljava/util/ArrayList;

    iput-object p1, p0, Lrc9;->a:Ltcl;

    iput-object p2, p0, Lrc9;->b:Lbf9;

    invoke-virtual {p2}, Lbf9;->q()Lpc9;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz p0, :cond_59

    iget-object p2, p0, Lpc9;->e:Ljava/util/Set;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lpc9;->f:Ljava/util/HashSet;

    invoke-virtual {p2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lpc9;->g:Lqie;

    iget-object v1, p0, Lpc9;->b:Lumi;

    new-instance v2, Lec9;

    invoke-direct {v2, p0, p1}, Lec9;-><init>(Lpc9;B)V

    invoke-interface {v1, v2}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p1

    new-instance v2, Lge5;

    const/16 v3, 0x16

    invoke-direct {v2, p0, v0, v3}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p1, p0}, Lnml;->b(Lnml;)V

    new-instance p0, Loml;

    invoke-direct {p0, p1}, Loml;-><init>(Lnml;)V

    const/4 p1, 0x0

    invoke-virtual {p2, p0, p1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void

    :cond_59
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {v0, p1, p0}, Lqc9;->a(ILjava/util/List;)V

    return-void
.end method
