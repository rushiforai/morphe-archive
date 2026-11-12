.class public final Lo16;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;B)V
    .registers 9

    iput-byte p2, p0, Lo16;->a:B

    const/4 v0, 0x0

    packed-switch p2, :pswitch_data_68

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p2, Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {p2, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object p2, p0, Lo16;->b:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    :goto_18
    if-ge v0, p2, :cond_2c

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    check-cast v1, Ln16;

    iget-object v2, p0, Lo16;->b:Ljava/util/HashMap;

    iget-object v3, v1, Ln16;->a:Ljava/lang/String;

    iget-object v1, v1, Ln16;->b:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18

    :cond_2c
    return-void

    :pswitch_2d
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p2, Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {p2, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object p2, p0, Lo16;->b:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    :goto_3f
    if-ge v0, p2, :cond_67

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    check-cast v1, Lu5g;

    iget-object v2, p0, Lo16;->b:Ljava/util/HashMap;

    iget-object v3, v1, Lu5g;->a:Ljava/lang/String;

    new-instance v4, Lmn;

    const/16 v5, 0xe

    invoke-direct {v4, v5}, Lmn;-><init>(B)V

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    new-instance v3, Landroid/util/Pair;

    iget-object v4, v1, Lu5g;->b:Ljava/lang/String;

    iget-object v1, v1, Lu5g;->c:Ljava/lang/String;

    invoke-direct {v3, v4, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3f

    :cond_67
    return-void

    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_2d
    .end packed-switch
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lo16;->a:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_20

    new-instance v0, Lvdf;

    const/16 v2, 0xf

    invoke-direct {v0, p0, v2}, Lvdf;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lcak;->d:Lavj;

    invoke-static {v1, v0}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void

    :pswitch_13
    new-instance v0, Llb4;

    const/16 v2, 0x1c

    invoke-direct {v0, p0, v2}, Llb4;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lcak;->d:Lavj;

    invoke-static {v1, v0}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
