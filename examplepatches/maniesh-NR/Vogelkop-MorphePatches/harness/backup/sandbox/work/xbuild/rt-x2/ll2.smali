.class public final synthetic Lll2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldh4;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lll2;->a:B

    iput-object p1, p0, Lll2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCancel()V
    .registers 2

    iget-byte v0, p0, Lll2;->a:B

    iget-object p0, p0, Lll2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1c

    check-cast p0, Lz43;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lz43;->a:Z

    iget-object p0, p0, Lz43;->i:Ljava/lang/Object;

    check-cast p0, Lgbf;

    iget-object p0, p0, Lgbf;->j:Lvbf;

    iput-boolean v0, p0, Lvbf;->F:Z

    return-void

    :pswitch_15
    check-cast p0, Lql2;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lql2;->c:Z

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
