.class public final synthetic Lvu1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmzk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lvu1;->a:B

    iput-object p1, p0, Lvu1;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final k(Z)V
    .registers 2

    iget-byte p1, p0, Lvu1;->a:B

    iget-object p0, p0, Lvu1;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_20

    check-cast p0, Lien;

    invoke-virtual {p0}, Lien;->o()V

    return-void

    :pswitch_d
    check-cast p0, Latb;

    sget p1, Leif;->a:I

    iget-object p0, p0, Latb;->a:Landroid/content/Context;

    const-class p1, Lcom/opera/android/minigame/appwidget/JumpMinigameAppWidget;

    invoke-static {p0, p1}, Lkfo;->k0(Landroid/content/Context;Ljava/lang/Class;)V

    return-void

    :pswitch_19
    check-cast p0, Lyu1;

    invoke-virtual {p0}, Lyu1;->c()V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_19
        :pswitch_d
    .end packed-switch
.end method
