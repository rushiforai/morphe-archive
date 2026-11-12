.class public final synthetic Ljgc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lks3;


# direct methods
.method public synthetic constructor <init>(Lks3;B)V
    .registers 3

    iput-byte p2, p0, Ljgc;->a:B

    iput-object p1, p0, Ljgc;->b:Lks3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)Landroid/text/style/ClickableSpan;
    .registers 3

    iget-byte p1, p0, Ljgc;->a:B

    iget-object p0, p0, Ljgc;->b:Lks3;

    packed-switch p1, :pswitch_data_1c

    iget-object p0, p0, Lks3;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    new-instance p1, Lsgc;

    invoke-direct {p1, p0}, Lagc;-><init>(Landroid/content/Context;)V

    return-object p1

    :pswitch_11
    iget-object p0, p0, Lks3;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    new-instance p1, Lrgc;

    invoke-direct {p1, p0}, Lagc;-><init>(Landroid/content/Context;)V

    return-object p1

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
