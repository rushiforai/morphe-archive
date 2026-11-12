.class public final synthetic Lzwl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldxl;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbf9;

.field public final synthetic c:Lvz;

.field public final synthetic d:Lzzh;


# direct methods
.method public synthetic constructor <init>(Lbf9;Lvz;Lzzh;B)V
    .registers 5

    iput-byte p4, p0, Lzwl;->a:B

    iput-object p1, p0, Lzwl;->b:Lbf9;

    iput-object p2, p0, Lzwl;->c:Lvz;

    iput-object p3, p0, Lzwl;->d:Lzzh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final f()Lmgh;
    .registers 5

    iget-byte v0, p0, Lzwl;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lzwl;->d:Lzzh;

    iget-object v3, p0, Lzwl;->c:Lvz;

    iget-object p0, p0, Lzwl;->b:Lbf9;

    packed-switch v0, :pswitch_data_16

    invoke-virtual {p0, v3, v2, v1}, Lbf9;->I(Lvz;Lzzh;Z)Lmgh;

    move-result-object p0

    return-object p0

    :pswitch_11
    invoke-virtual {p0, v3, v2, v1}, Lbf9;->I(Lvz;Lzzh;Z)Lmgh;

    move-result-object p0

    return-object p0

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
