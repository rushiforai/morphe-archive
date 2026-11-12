.class public final Ln9j;
.super Lh42;
.source "SourceFile"


# instance fields
.field public n:Z

.field public o:Ljava/util/List;

.field public p:Ljava/util/List;

.field public final synthetic q:Lo9j;


# direct methods
.method public constructor <init>(Lo9j;)V
    .registers 7

    iput-object p1, p0, Ln9j;->q:Lo9j;

    invoke-direct {p0}, Lh42;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Ln9j;->n:Z

    sget-object v1, Ll08;->a:Ll08;

    iput-object v1, p0, Ln9j;->o:Ljava/util/List;

    iput-object v1, p0, Ln9j;->p:Ljava/util/List;

    invoke-virtual {p0}, Ln9j;->u()V

    iget-object p1, p1, Lo9j;->c:La21;

    iget-object v1, p1, La21;->h:Ljava/lang/Object;

    check-cast v1, Lh42;

    new-instance v2, Lm9j;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lm9j;-><init>(Ln9j;B)V

    new-instance v3, Lt7d;

    const/16 v4, 0xc

    invoke-direct {v3, v2, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p0, v1, v3}, Lh42;->s(Lekc;Lf7f;)V

    iget-object p1, p1, La21;->i:Ljava/lang/Object;

    check-cast p1, Lkbd;

    new-instance v1, Lm9j;

    invoke-direct {v1, p0, v0}, Lm9j;-><init>(Ln9j;B)V

    new-instance v0, Lt7d;

    invoke-direct {v0, v1, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p0, p1, v0}, Lh42;->s(Lekc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final u()V
    .registers 5

    new-instance v0, Lj9j;

    iget-object v1, p0, Ln9j;->q:Lo9j;

    iget-object v1, v1, Lo9j;->c:La21;

    iget-object v1, v1, La21;->e:Ljava/lang/Object;

    check-cast v1, Lshf;

    iget-object v1, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-boolean v2, p0, Ln9j;->n:Z

    if-eqz v2, :cond_15

    iget-object v3, p0, Ln9j;->p:Ljava/util/List;

    goto :goto_17

    :cond_15
    iget-object v3, p0, Ln9j;->o:Ljava/util/List;

    :goto_17
    invoke-direct {v0, v1, v3, v2}, Lj9j;-><init>(Ljava/lang/String;Ljava/util/List;Z)V

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
