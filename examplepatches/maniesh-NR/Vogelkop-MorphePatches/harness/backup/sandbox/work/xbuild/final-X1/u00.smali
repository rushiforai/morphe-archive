.class public final synthetic Lu00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv00;

.field public final synthetic c:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lv00;Landroid/content/Context;B)V
    .registers 4

    iput-byte p3, p0, Lu00;->a:B

    iput-object p1, p0, Lu00;->b:Lv00;

    iput-object p2, p0, Lu00;->c:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lu00;->a:B

    iget-object v1, p0, Lu00;->c:Landroid/content/Context;

    iget-object p0, p0, Lu00;->b:Lv00;

    packed-switch v0, :pswitch_data_14

    const/4 v0, 0x0

    iput-object v0, p0, Lv00;->d:Loml;

    invoke-virtual {p0, v1}, Lv00;->c(Landroid/content/Context;)V

    return-void

    :pswitch_10
    invoke-virtual {p0, v1}, Lv00;->c(Landroid/content/Context;)V

    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
