.class public final Lhu2;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lgjm;

.field public final c:Lyu2;

.field public final d:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

.field public final e:Lx5g;

.field public final f:Lzg7;

.field public final g:Lumi;

.field public h:Loml;

.field public final i:Ljk;

.field public final j:Lh42;


# direct methods
.method public constructor <init>(Lgjm;Lyu2;Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;Lx5g;Lzg7;Lumi;)V
    .registers 7

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lhu2;->b:Lgjm;

    iput-object p2, p0, Lhu2;->c:Lyu2;

    iput-object p3, p0, Lhu2;->d:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    iput-object p4, p0, Lhu2;->e:Lx5g;

    iput-object p5, p0, Lhu2;->f:Lzg7;

    iput-object p6, p0, Lhu2;->g:Lumi;

    new-instance p1, Ljk;

    invoke-direct {p1}, Ljk;-><init>()V

    iput-object p1, p0, Lhu2;->i:Ljk;

    new-instance p1, Lh42;

    invoke-direct {p1}, Lh42;-><init>()V

    iput-object p1, p0, Lhu2;->j:Lh42;

    iget-object p2, p5, Loy;->e:Ljava/lang/Object;

    check-cast p2, Lkze;

    new-instance p3, Lgu2;

    const/4 p4, 0x0

    invoke-direct {p3, p0, p4}, Lgu2;-><init>(Lhu2;B)V

    new-instance p4, Lug;

    const/16 p6, 0x9

    invoke-direct {p4, p3, p6}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, p2, p4}, Lh42;->s(Lekc;Lf7f;)V

    iget-object p2, p5, Loy;->f:Ljava/lang/Object;

    check-cast p2, Lh42;

    new-instance p3, Lgu2;

    const/4 p4, 0x1

    invoke-direct {p3, p0, p4}, Lgu2;-><init>(Lhu2;B)V

    new-instance p0, Lug;

    invoke-direct {p0, p3, p6}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, p2, p0}, Lh42;->s(Lekc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 2

    const/4 v0, 0x0

    iget-object p0, p0, Lhu2;->f:Lzg7;

    invoke-virtual {p0, v0}, Loy;->i(Lj1c;)V

    invoke-virtual {p0}, Lzg7;->m()V

    return-void
.end method

.method public final f()V
    .registers 4

    iget-object v0, p0, Lhu2;->h:Loml;

    if-eqz v0, :cond_8

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    :cond_8
    iget-object v0, p0, Lhu2;->f:Lzg7;

    iget-object v0, v0, Loy;->f:Ljava/lang/Object;

    check-cast v0, Lh42;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    new-instance v1, Lrml;

    iget-object v2, p0, Lhu2;->g:Lumi;

    invoke-direct {v1, v0, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lgu2;

    const/4 v2, 0x2

    invoke-direct {v0, p0, v2}, Lgu2;-><init>(Lhu2;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    new-instance v1, Lgu2;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lgu2;-><init>(Lhu2;B)V

    invoke-virtual {v0, v1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    move-result-object v0

    iput-object v0, p0, Lhu2;->h:Loml;

    return-void
.end method
