.class public final Le56;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Lk56;


# direct methods
.method public synthetic constructor <init>(Lk56;Ljava/util/ArrayList;B)V
    .registers 4

    iput-byte p3, p0, Le56;->a:B

    iput-object p2, p0, Le56;->b:Ljava/util/ArrayList;

    iput-object p1, p0, Le56;->c:Lk56;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 10

    iget-byte v0, p0, Le56;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Le56;->b:Ljava/util/ArrayList;

    packed-switch v0, :pswitch_data_50

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_c
    iget-object v3, p0, Le56;->c:Lk56;

    if-ge v1, v0, :cond_1c

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v1, v1, 0x1

    check-cast v4, Landroidx/recyclerview/widget/i;

    invoke-virtual {v3, v4}, Lk56;->s(Landroidx/recyclerview/widget/i;)V

    goto :goto_c

    :cond_1c
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iget-object p0, v3, Lk56;->m:Ljava/util/ArrayList;

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void

    :pswitch_25
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_29
    iget-object v3, p0, Le56;->c:Lk56;

    if-ge v1, v0, :cond_47

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v1, v1, 0x1

    check-cast v4, Lj56;

    move-object v5, v4

    iget-object v4, v5, Lj56;->a:Landroidx/recyclerview/widget/i;

    move-object v6, v5

    iget v5, v6, Lj56;->b:I

    move-object v7, v6

    iget v6, v7, Lj56;->c:I

    move-object v8, v7

    iget v7, v8, Lj56;->d:I

    iget v8, v8, Lj56;->e:I

    invoke-virtual/range {v3 .. v8}, Lk56;->t(Landroidx/recyclerview/widget/i;IIII)V

    goto :goto_29

    :cond_47
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iget-object p0, v3, Lk56;->n:Ljava/util/ArrayList;

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_25
    .end packed-switch
.end method
