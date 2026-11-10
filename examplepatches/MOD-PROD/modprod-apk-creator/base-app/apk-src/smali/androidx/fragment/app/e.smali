.class public final synthetic Landroidx/fragment/app/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lx/a;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Le/i;


# direct methods
.method public synthetic constructor <init>(Le/i;I)V
    .locals 0

    iput p2, p0, Landroidx/fragment/app/e;->a:I

    iput-object p1, p0, Landroidx/fragment/app/e;->b:Le/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .locals 1

    iget v0, p0, Landroidx/fragment/app/e;->a:I

    packed-switch v0, :pswitch_data_0

    check-cast p1, Landroid/content/Intent;

    iget-object p1, p0, Landroidx/fragment/app/e;->b:Le/i;

    iget-object p1, p1, Le/i;->r:LC/j;

    invoke-virtual {p1}, LC/j;->x()V

    return-void

    :pswitch_0
    check-cast p1, Landroid/content/res/Configuration;

    iget-object p1, p0, Landroidx/fragment/app/e;->b:Le/i;

    iget-object p1, p1, Le/i;->r:LC/j;

    invoke-virtual {p1}, LC/j;->x()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
