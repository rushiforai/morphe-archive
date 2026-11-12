.class public final Lmlj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lysj;

.field public final b:Landroid/view/View;

.field public c:Lo93;


# direct methods
.method public constructor <init>(Lysj;Landroid/view/View;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmlj;->a:Lysj;

    iput-object p2, p0, Lmlj;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final a(Lrxh;I)V
    .registers 6

    iget-object v0, p0, Lmlj;->c:Lo93;

    if-eqz v0, :cond_a

    sget-object v1, Lhjm;->b:Lhjm;

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lo93;->b(Lhjm;I)V

    :cond_a
    new-instance v0, Lklj;

    invoke-direct {v0, p1, p2, p0}, Lklj;-><init>(Lrxh;ILmlj;)V

    iget-object p1, p0, Lmlj;->a:Lysj;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lijm;->b:Lijm;

    invoke-virtual {p1, v0, p2}, Lr22;->b(Ljjm;Lijm;)V

    iput-object v0, p0, Lmlj;->c:Lo93;

    return-void
.end method

.method public final b(Lrxh;ILrxh;Lkotlin/jvm/functions/Function0;)V
    .registers 14

    iget-object v0, p0, Lmlj;->c:Lo93;

    if-eqz v0, :cond_a

    sget-object v1, Lhjm;->b:Lhjm;

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lo93;->b(Lhjm;I)V

    :cond_a
    new-instance v3, Lllj;

    move-object v6, p0

    move-object v4, p1

    move v5, p2

    move-object v7, p3

    move-object v8, p4

    invoke-direct/range {v3 .. v8}, Lllj;-><init>(Lrxh;ILmlj;Lrxh;Lkotlin/jvm/functions/Function0;)V

    iget-object p0, v6, Lmlj;->a:Lysj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v3, p1}, Lr22;->b(Ljjm;Lijm;)V

    iput-object v3, v6, Lmlj;->c:Lo93;

    return-void
.end method
