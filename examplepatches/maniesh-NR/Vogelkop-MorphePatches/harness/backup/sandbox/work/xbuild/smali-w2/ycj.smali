.class public final synthetic Lycj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lzcj;

.field public final synthetic c:Landroid/content/Intent;

.field public final synthetic d:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Lzcj;Landroid/content/Intent;Ljava/util/HashMap;B)V
    .registers 5

    iput-byte p4, p0, Lycj;->a:B

    iput-object p1, p0, Lycj;->b:Lzcj;

    iput-object p2, p0, Lycj;->c:Landroid/content/Intent;

    iput-object p3, p0, Lycj;->d:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lycj;->a:B

    iget-object v1, p0, Lycj;->d:Ljava/util/HashMap;

    iget-object v2, p0, Lycj;->c:Landroid/content/Intent;

    iget-object p0, p0, Lycj;->b:Lzcj;

    packed-switch v0, :pswitch_data_28

    iget-object v0, p0, Lzcj;->d:Loji;

    invoke-virtual {p0, v2, v1}, Lzcj;->b(Landroid/content/Intent;Ljava/util/HashMap;)V

    const-string p0, "time > 0"

    const/4 v2, 0x0

    const-string v3, "time DESC"

    invoke-virtual {v0, v1, v3, p0, v2}, Loji;->F(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :pswitch_1a
    iget-object v0, p0, Lzcj;->d:Loji;

    invoke-virtual {p0, v2, v1}, Lzcj;->b(Landroid/content/Intent;Ljava/util/HashMap;)V

    const/4 p0, 0x0

    const/4 v2, 0x1

    const-string v3, "priority DESC"

    invoke-virtual {v0, v1, v3, p0, v2}, Loji;->F(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1a
    .end packed-switch
.end method
