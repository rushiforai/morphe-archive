.class public final synthetic Lu5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lz5l;


# direct methods
.method public synthetic constructor <init>(Lz5l;B)V
    .registers 3

    iput-byte p2, p0, Lu5l;->a:B

    iput-object p1, p0, Lu5l;->b:Lz5l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lu5l;->a:B

    iget-object p0, p0, Lu5l;->b:Lz5l;

    packed-switch v0, :pswitch_data_1c

    iget-object p0, p0, Lz5l;->p:Lzg;

    iget v0, p0, Lzg;->a:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzg;->a:I

    if-nez v0, :cond_14

    invoke-virtual {p0}, Lzg;->x()V

    :cond_14
    return-void

    :pswitch_15
    iget-object p0, p0, Lz5l;->v:Lx2l;

    sget-object v0, Lp2l;->a:Lp2l;

    iput-object v0, p0, Lx2l;->l:Lp2l;

    return-void

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
