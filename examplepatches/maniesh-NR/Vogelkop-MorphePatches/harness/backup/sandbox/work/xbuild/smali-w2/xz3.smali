.class public final synthetic Lxz3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:S

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/bubbleview/BubbleView;JLjava/lang/Runnable;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lxz3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxz3;->c:Ljava/lang/Object;

    long-to-int p1, p2

    iput-short p1, p0, Lxz3;->b:S

    iput-object p4, p0, Lxz3;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lp7p;ILjava/lang/String;)V
    .registers 5

    .line 14
    const/4 v0, 0x1

    iput-byte v0, p0, Lxz3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxz3;->c:Ljava/lang/Object;

    iput-short p2, p0, Lxz3;->b:S

    iput-object p3, p0, Lxz3;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 12

    iget-byte v0, p0, Lxz3;->a:B

    iget-object v1, p0, Lxz3;->d:Ljava/lang/Object;

    iget-object v2, p0, Lxz3;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_86

    check-cast v2, Lp7p;

    move-object v10, v1

    check-cast v10, Ljava/lang/String;

    new-instance v3, Lr5p;

    iget-object v0, v2, Lp7p;->a:Lvoo;

    iget-object v6, v0, Lvoo;->c:Ljava/lang/String;

    iget-object v1, v0, Lvoo;->b:Lpro;

    iget-object v7, v1, Lpro;->a:Ljava/lang/String;

    iget-object v8, v0, Lvoo;->j:Ljava/lang/String;

    invoke-static {}, Ld1p;->e()Lt5p;

    move-result-object v0

    invoke-virtual {v0}, Lt5p;->a()Ljava/lang/String;

    move-result-object v9

    invoke-static {}, Ld1p;->e()Lt5p;

    move-result-object v0

    iget-boolean v0, v0, Lt5p;->c:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    iget-short v4, p0, Lxz3;->b:S

    invoke-direct/range {v3 .. v10}, Lr5p;-><init>(ILjava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 p0, 0x2332

    const/4 v0, 0x0

    if-eq v4, p0, :cond_53

    const/16 p0, 0x2333

    if-eq v4, p0, :cond_53

    packed-switch v4, :pswitch_data_8c

    packed-switch v4, :pswitch_data_98

    packed-switch v4, :pswitch_data_b0

    invoke-static {v3}, Lp8p;->a(Lp8p;)V

    goto :goto_77

    :pswitch_47
    iget-object p0, v2, Lp7p;->b:Ljava/util/LinkedHashSet;

    invoke-static {v3, v0, p0}, Lp7p;->e(Lp8p;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    goto :goto_77

    :pswitch_4d
    sget-object p0, Lp7p;->c:Ljava/util/LinkedHashSet;

    invoke-static {v3, v0, p0}, Lp7p;->e(Lp8p;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    goto :goto_77

    :cond_53
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, v3, Lr5p;->i:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":error:"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Lp7p;->d:Ljava/util/LinkedHashSet;

    invoke-interface {v1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_74

    invoke-static {v3}, Lp8p;->a(Lp8p;)V

    :cond_74
    invoke-static {p0, v0, v1}, Lp7p;->c(Ljava/lang/String;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    :goto_77
    return-void

    :pswitch_78
    check-cast v2, Lcom/opera/android/bubbleview/BubbleView;

    iget-short p0, p0, Lxz3;->b:S

    int-to-long v3, p0

    check-cast v1, Ljava/lang/Runnable;

    sget p0, Lcom/opera/android/bubbleview/BubbleView;->D:I

    invoke-virtual {v2, v1, v3, v4}, Lcom/opera/android/bubbleview/BubbleView;->a(Ljava/lang/Runnable;J)V

    return-void

    nop

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_78
    .end packed-switch

    :pswitch_data_8c
    .packed-switch 0x3eb
        :pswitch_4d
        :pswitch_4d
        :pswitch_47
        :pswitch_47
    .end packed-switch

    :pswitch_data_98
    .packed-switch 0x3f2
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
    .end packed-switch

    :pswitch_data_b0
    .packed-switch 0x2391
        :pswitch_47
        :pswitch_47
        :pswitch_47
    .end packed-switch
.end method
