.class public final synthetic Lem6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmm6;

.field public final synthetic c:Leej;


# direct methods
.method public synthetic constructor <init>(Lmm6;Leej;B)V
    .registers 4

    iput-byte p3, p0, Lem6;->a:B

    iput-object p1, p0, Lem6;->b:Lmm6;

    iput-object p2, p0, Lem6;->c:Leej;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-byte v0, p0, Lem6;->a:B

    sget-object v1, Lijm;->b:Lijm;

    const/4 v2, 0x0

    iget-object v3, p0, Lem6;->c:Leej;

    iget-object p0, p0, Lem6;->b:Lmm6;

    packed-switch v0, :pswitch_data_50

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lxm5;

    invoke-direct {v0, p0}, Lxm5;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lmm6;->a()Lyl6;

    move-result-object p0

    iget-object v4, p0, Lyl6;->c:Lb59;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    iget-object v3, v3, Leej;->a:Lnej;

    new-instance v5, Lim6;

    invoke-direct {v5, v0, p0, v4, v2}, Lim6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v5, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_2e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lxm5;

    invoke-direct {v0, p0}, Lxm5;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lmm6;->a()Lyl6;

    move-result-object p0

    iget-object v4, p0, Lyl6;->c:Lb59;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    iget-object v3, v3, Leej;->a:Lnej;

    new-instance v5, Lim6;

    invoke-direct {v5, v0, p0, v4, v2}, Lim6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v5, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_2e
    .end packed-switch
.end method
