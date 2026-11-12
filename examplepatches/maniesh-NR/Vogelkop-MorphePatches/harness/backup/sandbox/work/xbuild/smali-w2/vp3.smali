.class public final synthetic Lvp3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkotlin/jvm/functions/Function2;

.field public final synthetic c:Lef;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function2;Lef;B)V
    .registers 4

    iput-byte p3, p0, Lvp3;->a:B

    iput-object p1, p0, Lvp3;->b:Lkotlin/jvm/functions/Function2;

    iput-object p2, p0, Lvp3;->c:Lef;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 5

    iget-byte v0, p0, Lvp3;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Lvp3;->c:Lef;

    iget-object p0, p0, Lvp3;->b:Lkotlin/jvm/functions/Function2;

    packed-switch v0, :pswitch_data_12

    invoke-interface {p0, p1, v2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v1

    :pswitch_e
    invoke-interface {p0, p1, v2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v1

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
