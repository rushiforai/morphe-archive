.class public final synthetic Lbs8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lns8;

.field public final synthetic c:Landroid/content/Context;

.field public final synthetic d:Lhq8;


# direct methods
.method public synthetic constructor <init>(Lns8;Landroid/content/Context;Lhq8;B)V
    .registers 5

    iput-byte p4, p0, Lbs8;->a:B

    iput-object p1, p0, Lbs8;->b:Lns8;

    iput-object p2, p0, Lbs8;->c:Landroid/content/Context;

    iput-object p3, p0, Lbs8;->d:Lhq8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lbs8;->a:B

    iget-object v0, p0, Lbs8;->d:Lhq8;

    iget-object v1, p0, Lbs8;->c:Landroid/content/Context;

    iget-object p0, p0, Lbs8;->b:Lns8;

    packed-switch p1, :pswitch_data_2e

    invoke-virtual {p0, v1, v0}, Lns8;->I(Landroid/content/Context;Lhq8;)V

    return-void

    :pswitch_f
    invoke-virtual {v0}, Lhq8;->j()Z

    move-result p1

    const/4 v2, 0x1

    if-eqz p1, :cond_1c

    check-cast v0, Ltq8;

    invoke-virtual {p0, v0, v2}, Lns8;->Y(Ltq8;Z)V

    goto :goto_2d

    :cond_1c
    invoke-static {v1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    new-instance p1, Lmv;

    invoke-direct {p1, v0, v2}, Lmv;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :goto_2d
    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
