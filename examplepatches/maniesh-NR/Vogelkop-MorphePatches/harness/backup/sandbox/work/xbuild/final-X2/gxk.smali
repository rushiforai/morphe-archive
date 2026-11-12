.class public final Lgxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lgxk;->a:B

    iput-object p1, p0, Lgxk;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 4

    iget-byte v0, p0, Lgxk;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lgxk;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_32

    const-class v0, Ltpn;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_17

    new-instance v1, Ltpn;

    check-cast p0, Lgjm;

    invoke-direct {v1, p0}, Ltpn;-><init>(Lgjm;)V

    :cond_17
    return-object v1

    :pswitch_18
    const-class v0, Lc49;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_31

    new-instance v1, Lc49;

    check-cast p0, Lki;

    iget-object p0, p0, Lki;->b:Ljava/lang/Object;

    check-cast p0, Lli;

    invoke-virtual {p0}, Lli;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldb;

    invoke-direct {v1, p0}, Lc49;-><init>(Ldb;)V

    :cond_31
    return-object v1

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
