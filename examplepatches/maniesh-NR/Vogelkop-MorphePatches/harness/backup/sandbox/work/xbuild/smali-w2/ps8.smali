.class public final synthetic Lps8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lts8;


# direct methods
.method public synthetic constructor <init>(Lts8;B)V
    .registers 3

    iput-byte p2, p0, Lps8;->a:B

    iput-object p1, p0, Lps8;->b:Lts8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lps8;->a:B

    iget-object p0, p0, Lps8;->b:Lts8;

    packed-switch v0, :pswitch_data_12

    invoke-virtual {p0}, Lu5k;->A()V

    return-void

    :pswitch_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lts8;->t:Z

    invoke-virtual {p0}, Lu5k;->A()V

    return-void

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
