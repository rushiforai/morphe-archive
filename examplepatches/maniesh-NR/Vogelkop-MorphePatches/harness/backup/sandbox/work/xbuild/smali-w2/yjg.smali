.class public final Lyjg;
.super Lcej;
.source "SourceFile"


# instance fields
.field public final a:[Likg;

.field public final b:Likg;

.field public final c:Lcom/opera/api/Callback;

.field public final d:I

.field public final synthetic e:Lakg;


# direct methods
.method public constructor <init>(Lakg;I[Likg;Likg;Lcom/opera/api/Callback;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyjg;->e:Lakg;

    iput p2, p0, Lyjg;->d:I

    iput-object p3, p0, Lyjg;->a:[Likg;

    iput-object p4, p0, Lyjg;->b:Likg;

    iput-object p5, p0, Lyjg;->c:Lcom/opera/api/Callback;

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 9

    new-instance v0, Ljkg;

    iget-object v4, p0, Lyjg;->b:Likg;

    iget-object v5, p0, Lyjg;->c:Lcom/opera/api/Callback;

    iget v2, p0, Lyjg;->d:I

    iget-object v3, p0, Lyjg;->a:[Likg;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Ljkg;-><init>(Lmej;I[Likg;Likg;Lcom/opera/api/Callback;)V

    return-object v0
.end method

.method public final onFinished(Lhjm;)V
    .registers 2

    invoke-super {p0, p1}, Lcej;->onFinished(Lhjm;)V

    iget-object p1, p0, Lyjg;->e:Lakg;

    iget-object p1, p1, Lakg;->n:Ljava/lang/Object;

    check-cast p1, Lga6;

    if-eqz p1, :cond_12

    iget-object p1, p1, Lga6;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    :cond_12
    return-void
.end method
