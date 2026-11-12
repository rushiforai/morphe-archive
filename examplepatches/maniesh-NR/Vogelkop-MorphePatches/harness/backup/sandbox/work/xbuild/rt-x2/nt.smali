.class public final Lnt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lysi;


# instance fields
.field public final a:Lumi;

.field public final b:Lqb7;

.field public final c:Lrq8;

.field public final d:Lcom/opera/android/suggestion/SuggestionManagerBridge;

.field public final e:Ltr8;

.field public final f:Ltsd;

.field public g:Lesi;

.field public h:I

.field public final i:Lqie;

.field public final j:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lumi;Lnr8;Lqb7;Lrq8;Lcom/opera/android/suggestion/SuggestionManagerBridge;Ltr8;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnt;->a:Lumi;

    iput-object p3, p0, Lnt;->b:Lqb7;

    iput-object p4, p0, Lnt;->c:Lrq8;

    iput-object p5, p0, Lnt;->d:Lcom/opera/android/suggestion/SuggestionManagerBridge;

    iput-object p6, p0, Lnt;->e:Ltr8;

    new-instance p1, Ltsd;

    sget-object p3, Ll08;->a:Ll08;

    invoke-direct {p1, p3}, Ltsd;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lnt;->f:Ltsd;

    new-instance p3, Lqie;

    const/16 p4, 0x13

    invoke-direct {p3, p4}, Lqie;-><init>(B)V

    iput-object p3, p0, Lnt;->i:Lqie;

    move-object p3, p2

    check-cast p3, Lcom/opera/android/favorites/e;

    iget-object p3, p3, Lcom/opera/android/favorites/e;->g:Lcom/opera/android/favorites/b;

    check-cast p2, Lcom/opera/android/favorites/e;

    iget-object p2, p2, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    const/4 p4, 0x1

    new-array p4, p4, [Lhq8;

    const/4 p5, 0x0

    aput-object p2, p4, p5

    invoke-static {p3, p4}, Lsfe;->Y(Ltq8;[Lhq8;)Ljava/util/ArrayList;

    move-result-object p2

    iput-object p2, p0, Lnt;->j:Ljava/util/ArrayList;

    iget-object p2, p6, Ltr8;->e:Lwnm;

    new-instance p3, Lz3;

    const/16 p4, 0x9

    invoke-direct {p3, p0, p4}, Lz3;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lpb;

    const/4 p4, 0x6

    invoke-direct {p0, p3, p4}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, p0}, Ltsd;->s(Lekc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final g(Lesi;)V
    .registers 3

    iget-object v0, p0, Lnt;->g:Lesi;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    iput-object p1, p0, Lnt;->g:Lesi;

    invoke-virtual {p0}, Lnt;->l()V

    return-void
.end method

.method public final i()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final l()V
    .registers 14

    iget-object v0, p0, Lnt;->d:Lcom/opera/android/suggestion/SuggestionManagerBridge;

    iget-wide v1, v0, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a:J

    invoke-static {v1, v2}, LJ/N;->MFZ1dBII(J)V

    iget-object v1, p0, Lnt;->g:Lesi;

    if-nez v1, :cond_13

    iget-object p0, p0, Lnt;->f:Ltsd;

    sget-object v0, Ll08;->a:Ll08;

    invoke-virtual {p0, v0}, Ltsd;->r(Ljava/lang/Object;)V

    return-void

    :cond_13
    new-instance v2, Lpqh;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    new-instance v3, Lpqh;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    new-instance v4, Lkt;

    const/4 v5, 0x0

    invoke-direct {v4, v2, v3, p0, v5}, Lkt;-><init>(Lpqh;Lpqh;Lnt;B)V

    iget-object v8, v1, Lesi;->a:Ljava/lang/String;

    new-instance v11, Lbi;

    const/16 v5, 0x8

    invoke-direct {v11, v4, v5}, Lbi;-><init>(Ljava/lang/Object;B)V

    const/4 v12, 0x0

    iget-wide v6, v0, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a:J

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static/range {v6 .. v12}, LJ/N;->MopJ6PdP(JLjava/lang/Object;ZZLjava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lkt;

    const/4 v4, 0x1

    invoke-direct {v0, v3, v2, p0, v4}, Lkt;-><init>(Lpqh;Lpqh;Lnt;B)V

    new-instance v2, Lxj;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v1, v3}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, p0, Lnt;->a:Lumi;

    invoke-virtual {v1, v2}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v2

    new-instance v3, Lbi;

    const/4 v4, 0x7

    invoke-direct {v3, v0, v4}, Lbi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {v2, v0}, Lnml;->b(Lnml;)V

    new-instance v0, Loml;

    invoke-direct {v0, v2}, Loml;-><init>(Lnml;)V

    const/4 v1, 0x0

    iget-object p0, p0, Lnt;->i:Lqie;

    invoke-virtual {p0, v0, v1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final m()Lekc;
    .registers 1

    iget-object p0, p0, Lnt;->f:Ltsd;

    return-object p0
.end method
