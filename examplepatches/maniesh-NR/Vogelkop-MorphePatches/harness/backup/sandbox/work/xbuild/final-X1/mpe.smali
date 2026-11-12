.class public final Lmpe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final a:Lbi;

.field public final b:Ljv1;

.field public final c:Ljv1;

.field public final d:Llld;

.field public final e:Lix5;

.field public final f:Luu1;

.field public final g:Llv1;

.field public final h:Liab;

.field public final i:Liab;

.field public final j:Lhga;

.field public final k:Ljv1;

.field public final l:Ljv1;

.field public final m:Lpjn;

.field public final n:Ljv1;


# direct methods
.method public constructor <init>(Lbi;Ljv1;Ljv1;Llld;Lix5;Luu1;Llv1;Liab;Liab;Lhga;Ljv1;Ljv1;Lpjn;Ljv1;Luu1;)V
    .registers 16

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmpe;->a:Lbi;

    iput-object p2, p0, Lmpe;->b:Ljv1;

    iput-object p3, p0, Lmpe;->c:Ljv1;

    iput-object p4, p0, Lmpe;->d:Llld;

    iput-object p5, p0, Lmpe;->e:Lix5;

    iput-object p6, p0, Lmpe;->f:Luu1;

    iput-object p7, p0, Lmpe;->g:Llv1;

    iput-object p8, p0, Lmpe;->h:Liab;

    iput-object p9, p0, Lmpe;->i:Liab;

    iput-object p10, p0, Lmpe;->j:Lhga;

    iput-object p11, p0, Lmpe;->k:Ljv1;

    iput-object p12, p0, Lmpe;->l:Ljv1;

    iput-object p13, p0, Lmpe;->m:Lpjn;

    iput-object p14, p0, Lmpe;->n:Ljv1;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    check-cast p1, Lmt5;

    new-instance v0, Lbhi;

    invoke-static {p1}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object p1

    invoke-direct {v0, p1}, Lbhi;-><init>(Lmt5;)V

    new-instance p1, Lez;

    const/4 v1, 0x2

    invoke-direct {p1, v0, p0, v1}, Lez;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lvr3;

    new-instance v2, Lj12;

    const/16 v3, 0x9

    invoke-direct {v2, p1, v3}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    invoke-direct {v1, v2}, Lvr3;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {v1}, Lvr3;->b()Ltt2;

    move-result-object p1

    invoke-virtual {v1}, Lvr3;->b()Ltt2;

    move-result-object v2

    invoke-virtual {v1}, Lvr3;->b()Ltt2;

    move-result-object v3

    invoke-virtual {v1}, Lvr3;->d()V

    iget-object v1, p0, Lmpe;->d:Llld;

    check-cast p1, Lcom/opera/api/Callback;

    invoke-virtual {v1, p1}, Llld;->e0(Lcom/opera/api/Callback;)V

    iget-object p1, p0, Lmpe;->g:Llv1;

    check-cast v2, Lcom/opera/api/Callback;

    invoke-virtual {p1, v2}, Llv1;->a(Lcom/opera/api/Callback;)V

    new-instance p1, Lvr3;

    check-cast v3, Lcom/opera/api/Callback;

    invoke-direct {p1, v3}, Lvr3;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {p1}, Lvr3;->b()Ltt2;

    move-result-object v1

    iget-object v2, p0, Lmpe;->a:Lbi;

    iget-object v2, v2, Lbi;->b:Ljava/lang/Object;

    check-cast v2, Le00;

    invoke-virtual {v2, v1}, Le00;->a(Lcom/opera/api/Callback;)V

    iget-object v1, p0, Lmpe;->e:Lix5;

    invoke-virtual {p1}, Lvr3;->b()Ltt2;

    move-result-object v2

    invoke-virtual {v1, v2}, Lix5;->q(Lcom/opera/api/Callback;)V

    iget-object v1, p0, Lmpe;->h:Liab;

    invoke-virtual {p1}, Lvr3;->b()Ltt2;

    move-result-object v2

    invoke-virtual {v1, v2}, Ls75;->e(Lcom/opera/api/Callback;)V

    iget-object v1, p0, Lmpe;->i:Liab;

    invoke-virtual {p1}, Lvr3;->b()Ltt2;

    move-result-object v2

    invoke-virtual {v1, v2}, Ls75;->e(Lcom/opera/api/Callback;)V

    iget-object p0, p0, Lmpe;->m:Lpjn;

    invoke-virtual {p1}, Lvr3;->b()Ltt2;

    move-result-object v1

    invoke-virtual {p0, v1}, Lpjn;->g(Lcom/opera/api/Callback;)V

    invoke-virtual {p1}, Lvr3;->d()V

    invoke-virtual {v0}, Lbhi;->a()Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    return-object p0
.end method
