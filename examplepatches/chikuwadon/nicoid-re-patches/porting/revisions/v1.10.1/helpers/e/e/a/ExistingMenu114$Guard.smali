.class final Le/e/a/ExistingMenu114$Guard;
.super Ljava/lang/Object;
.source "ExistingMenu114.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ExistingMenu114;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Guard"
.end annotation


# instance fields
.field final entries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/ExistingMenu114$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/ExistingMenu114$Guard;->entries:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method restore()V
    .registers 6

    .line 26
    iget-object v0, p0, Le/e/a/ExistingMenu114$Guard;->entries:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_12

    iget-object v0, p0, Le/e/a/ExistingMenu114$Guard;->entries:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void

    :cond_12
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ExistingMenu114$Entry;

    const/4 v2, 0x0

    :goto_19
    iget-object v3, v1, Le/e/a/ExistingMenu114$Entry;->list:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt v2, v3, :cond_22

    goto :goto_6

    :cond_22
    iget-object v3, v1, Le/e/a/ExistingMenu114$Entry;->list:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    iget-object v4, v1, Le/e/a/ExistingMenu114$Entry;->replacement:Ljava/lang/Object;

    if-ne v3, v4, :cond_34

    iget-object v3, v1, Le/e/a/ExistingMenu114$Entry;->list:Ljava/util/List;

    iget-object v1, v1, Le/e/a/ExistingMenu114$Entry;->original:Ljava/lang/Object;

    invoke-interface {v3, v2, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    :cond_34
    add-int/lit8 v2, v2, 0x1

    goto :goto_19
.end method
