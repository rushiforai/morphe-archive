.class public final synthetic Ls11;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:La21;


# direct methods
.method public synthetic constructor <init>(La21;B)V
    .registers 3

    iput-byte p2, p0, Ls11;->a:B

    iput-object p1, p0, Ls11;->b:La21;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Ls11;->a:B

    iget-object p0, p0, Ls11;->b:La21;

    packed-switch v0, :pswitch_data_94

    invoke-virtual {p0}, La21;->h()Lx9d;

    move-result-object v0

    iget-object p0, p0, La21;->j:Ljava/lang/Object;

    check-cast p0, Li37;

    invoke-virtual {p0}, Li37;->getValue()Ljava/lang/Object;

    move-result-object p0

    new-instance v1, Lkotlin/Pair;

    invoke-direct {v1, v0, p0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    :pswitch_19
    invoke-virtual {p0}, La21;->h()Lx9d;

    move-result-object p0

    return-object p0

    :pswitch_1e
    iget-object v0, p0, La21;->h:Ljava/lang/Object;

    check-cast v0, Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_67

    iget-object v0, p0, La21;->k:Ljava/lang/Object;

    check-cast v0, Lp0g;

    invoke-virtual {v0}, Lp0g;->h()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    iget-object v2, p0, La21;->g:Ljava/lang/Object;

    check-cast v2, Lt0g;

    if-nez v1, :cond_63

    invoke-virtual {v2}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0}, La21;->h()Lx9d;

    move-result-object p0

    invoke-virtual {p0, v1}, Lx9d;->d(Ljava/lang/Object;)F

    move-result v2

    cmpg-float v3, v2, v0

    if-eqz v3, :cond_61

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-nez v2, :cond_61

    if-gez v3, :cond_5a

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v2}, Lx9d;->b(FZ)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_67

    goto :goto_61

    :cond_5a
    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lx9d;->b(FZ)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_67

    :cond_61
    :goto_61
    move-object v0, v1

    goto :goto_67

    :cond_63
    invoke-virtual {v2}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    :cond_67
    :goto_67
    return-object v0

    :pswitch_68
    iget-object v0, p0, La21;->h:Ljava/lang/Object;

    check-cast v0, Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_92

    iget-object v0, p0, La21;->k:Ljava/lang/Object;

    check-cast v0, Lp0g;

    invoke-virtual {v0}, Lp0g;->h()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    iget-object v2, p0, La21;->g:Ljava/lang/Object;

    check-cast v2, Lt0g;

    if-nez v1, :cond_8e

    invoke-virtual {v2}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, La21;->c(FFLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_92

    :cond_8e
    invoke-virtual {v2}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    :cond_92
    :goto_92
    return-object v0

    nop

    :pswitch_data_94
    .packed-switch 0x0
        :pswitch_68
        :pswitch_1e
        :pswitch_19
    .end packed-switch
.end method
