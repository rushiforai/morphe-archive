.class public final synthetic Llz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Le00;

.field public final synthetic c:Lmz;

.field public final synthetic d:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Le00;Lmz;)V
    .registers 5

    .line 13
    const/4 v0, 0x0

    iput-byte v0, p0, Llz;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llz;->d:Landroid/content/Context;

    iput-object p2, p0, Llz;->b:Le00;

    iput-object p3, p0, Llz;->c:Lmz;

    return-void
.end method

.method public synthetic constructor <init>(Le00;Lmz;Landroid/content/Context;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Llz;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llz;->b:Le00;

    iput-object p2, p0, Llz;->c:Lmz;

    iput-object p3, p0, Llz;->d:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Llz;->a:B

    iget-object v1, p0, Llz;->d:Landroid/content/Context;

    iget-object v2, p0, Llz;->c:Lmz;

    iget-object p0, p0, Llz;->b:Le00;

    packed-switch v0, :pswitch_data_22

    new-instance v0, Lwx;

    const/4 v3, 0x2

    invoke-direct {v0, v2, v1, v3}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Le00;->a(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_15
    invoke-static {v1}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v0

    new-instance v3, Llz;

    invoke-direct {v3, p0, v2, v1}, Llz;-><init>(Le00;Lmz;Landroid/content/Context;)V

    invoke-virtual {v0, v3}, Lno7;->b(Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
