.class public final synthetic Lav7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lev7;


# direct methods
.method public synthetic constructor <init>(Lev7;B)V
    .registers 3

    iput-byte p2, p0, Lav7;->a:B

    iput-object p1, p0, Lav7;->b:Lev7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lav7;->a:B

    iget-object p0, p0, Lav7;->b:Lev7;

    packed-switch v0, :pswitch_data_28

    check-cast p1, Luv7;

    iget-object p0, p0, Lev7;->o:Ljava/lang/Object;

    check-cast p0, Lknl;

    iget-object p1, p0, Lknl;->c:Loml;

    if-nez p1, :cond_1d

    iget-object p1, p0, Lknl;->a:Lumi;

    iget-wide v0, p0, Lknl;->b:J

    iget-object v2, p0, Lknl;->d:Lp7l;

    invoke-static {p1, v0, v1, v2}, Lfac;->B(Lumi;JLkotlin/jvm/functions/Function0;)Loml;

    move-result-object p1

    iput-object p1, p0, Lknl;->c:Loml;

    :cond_1d
    return-void

    :pswitch_1e
    check-cast p1, Lhv7;

    iget-object p0, p0, Lev7;->o:Ljava/lang/Object;

    check-cast p0, Lknl;

    invoke-virtual {p0}, Lknl;->c()V

    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
