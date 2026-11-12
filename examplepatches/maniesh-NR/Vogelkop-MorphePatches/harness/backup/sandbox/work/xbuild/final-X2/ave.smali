.class public final synthetic Lave;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx5f;


# direct methods
.method public synthetic constructor <init>(Lx5f;B)V
    .registers 3

    iput-byte p2, p0, Lave;->a:B

    iput-object p1, p0, Lave;->b:Lx5f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lave;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lave;->b:Lx5f;

    packed-switch v0, :pswitch_data_20

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_11

    sget-object v0, Lf90;->c:Lf90;

    invoke-virtual {p0, v0, v1}, Lx5f;->w(Lf90;I)V

    :cond_11
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_14
    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_1d

    sget-object v0, Lf90;->d:Lf90;

    invoke-virtual {p0, v0, v1}, Lx5f;->w(Lf90;I)V

    :cond_1d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
