.class public final Lk16;
.super Ln1;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final c:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Ljava/util/ArrayList;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ln1;-><init>(Landroid/content/Context;Lumi;)V

    iput-object p3, p0, Lk16;->c:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-object v0, p0, Lk16;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v1, :cond_20

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lh16;

    iget-object v4, p0, Ln1;->b:Ljava/lang/Object;

    check-cast v4, Li16;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v5, v3, Lh16;->a:Ljava/lang/String;

    iget-object v3, v3, Lh16;->b:Ljava/lang/String;

    invoke-virtual {v4, v5, v3}, Li16;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    :cond_20
    return-void
.end method
