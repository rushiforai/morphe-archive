.class public final synthetic Lkp9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leua;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Lkp9;->a:B

    iput-object p1, p0, Lkp9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lkp9;->c:Ljava/lang/Object;

    iput-object p3, p0, Lkp9;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lkp9;->a:B

    iget-object v1, p0, Lkp9;->d:Ljava/lang/Object;

    iget-object v2, p0, Lkp9;->c:Ljava/lang/Object;

    iget-object p0, p0, Lkp9;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3a

    check-cast p0, Landroidx/fragment/app/w;

    check-cast v2, Ldb;

    check-cast v1, Ltmi;

    new-instance v0, Lmni;

    const/16 v3, 0xb

    invoke-direct {v0, v1, v3}, Lmni;-><init>(Ljava/lang/Object;B)V

    const-string v1, "password-section"

    invoke-static {p0, v2, v1, v0}, Lxih;->v(Landroidx/fragment/app/w;Ldb;Ljava/lang/String;Lmni;)V

    return-void

    :pswitch_1e
    check-cast p0, Lpf;

    check-cast v2, Llp9;

    check-cast v1, Lb2l;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lpf;->b:Z

    iget-object p0, v2, Llp9;->a:Lwv1;

    iget-object p0, p0, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lydn;

    invoke-virtual {p0, v0}, Lydn;->C(Z)V

    check-cast v1, Ld7l;

    invoke-virtual {v1}, Ld7l;->b()V

    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
