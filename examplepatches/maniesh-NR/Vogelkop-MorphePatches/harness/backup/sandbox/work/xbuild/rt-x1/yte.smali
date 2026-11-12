.class public final synthetic Lyte;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:Lvzk;

.field public final synthetic b:Lg77;

.field public final synthetic c:Lbue;

.field public final synthetic d:Z

.field public final synthetic e:Ll0c;


# direct methods
.method public synthetic constructor <init>(Lvzk;Lg77;Lbue;ZLl0c;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyte;->a:Lvzk;

    iput-object p2, p0, Lyte;->b:Lg77;

    iput-object p3, p0, Lyte;->c:Lbue;

    iput-boolean p4, p0, Lyte;->d:Z

    iput-object p5, p0, Lyte;->e:Ll0c;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 7

    check-cast p1, Ld93;

    iget-object v0, p0, Lyte;->a:Lvzk;

    iget-object v0, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Lwv1;

    invoke-virtual {v0}, Lwv1;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfqe;

    iget-object v0, v0, Lfqe;->a:Landroid/content/Context;

    new-instance v1, Lmp4;

    new-instance v2, Lga6;

    const/4 v3, 0x5

    iget-object v4, p0, Lyte;->b:Lg77;

    invoke-direct {v2, v4, v3}, Lga6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v0, v2, p1}, Lmp4;-><init>(Landroid/content/Context;Lga6;Ld93;)V

    new-instance p1, Lhg7;

    iget-object v0, p0, Lyte;->c:Lbue;

    iget-boolean v2, p0, Lyte;->d:Z

    iget-object p0, p0, Lyte;->e:Ll0c;

    invoke-direct {p1, v0, v2, p0}, Lhg7;-><init>(Ljava/lang/Object;ZLjava/lang/Object;)V

    invoke-virtual {v1, p1}, Lmp4;->Q(Llp4;)V

    return-void
.end method
