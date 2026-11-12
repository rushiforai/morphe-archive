.class public final Lydj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lru9;


# direct methods
.method public constructor <init>(Landroid/content/Context;B)V
    .registers 3

    packed-switch p2, :pswitch_data_1c

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iput-object p1, p0, Lydj;->a:Lru9;

    return-void

    :pswitch_11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iput-object p1, p0, Lydj;->a:Lru9;

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_11
    .end packed-switch
.end method
