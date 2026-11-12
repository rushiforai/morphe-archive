.class public final Lbnk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Lh1b;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lh1b;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbnk;->a:Ljava/lang/String;

    iput-object p2, p0, Lbnk;->b:Ljava/lang/String;

    iput-object p3, p0, Lbnk;->c:Lh1b;

    return-void
.end method


# virtual methods
.method public final a()Lfdn;
    .registers 13

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget-object v2, p0, Lbnk;->a:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f0803c5

    invoke-static {v1, v0}, Lvtp;->K(ILjava/lang/String;)I

    move-result v8

    new-instance v1, Lfdn;

    const/4 v6, 0x0

    iget-object v4, p0, Lbnk;->b:Ljava/lang/String;

    sget-object v5, Lpt0;->f:Lpt0;

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v3, v2

    invoke-direct/range {v1 .. v10}, Lfdn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lpt0;ZIILfdn;Z)V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object p0, p0, Lbnk;->c:Lh1b;

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lh1b;->u(I)La1b;

    move-result-object p0

    :goto_29
    invoke-virtual {p0}, Lq4;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_64

    invoke-virtual {p0}, Lq4;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lank;

    iget-object v4, v3, Lank;->b:Ljava/lang/String;

    iget-object v3, v3, Lank;->b:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_61

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, ":"

    invoke-static {v4, v6, v3}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v9, v1

    new-instance v1, Lfdn;

    const/4 v6, 0x0

    const/4 v7, 0x0

    iget v8, v9, Lfdn;->i:I

    const/4 v10, 0x0

    move-object v11, v4

    move-object v4, v3

    move-object v3, v11

    invoke-direct/range {v1 .. v10}, Lfdn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lpt0;ZIILfdn;Z)V

    move-object v3, v2

    move-object v2, v1

    move-object v1, v9

    iget-object v4, v1, Lfdn;->g:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_62

    :cond_61
    move-object v3, v2

    :goto_62
    move-object v2, v3

    goto :goto_29

    :cond_64
    return-object v1
.end method
