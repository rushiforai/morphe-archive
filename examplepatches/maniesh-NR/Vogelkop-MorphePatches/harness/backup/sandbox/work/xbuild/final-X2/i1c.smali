.class public final synthetic Li1c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lj1c;


# direct methods
.method public synthetic constructor <init>(Lj1c;B)V
    .registers 3

    iput-byte p2, p0, Li1c;->a:B

    iput-object p1, p0, Li1c;->b:Lj1c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Li1c;->a:B

    iget-object p0, p0, Li1c;->b:Lj1c;

    packed-switch v0, :pswitch_data_20

    check-cast p1, Ljava/util/Set;

    iget-object v0, p0, Lj1c;->g:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    iput-object p1, p0, Lj1c;->g:Ljava/lang/Object;

    invoke-virtual {p0}, Lj1c;->k()V

    :cond_18
    return-void

    :pswitch_19
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0}, Lj1c;->k()V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
