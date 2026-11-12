.class public final synthetic Luog;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldh4;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lev4;


# direct methods
.method public synthetic constructor <init>(Lev4;B)V
    .registers 3

    iput-byte p2, p0, Luog;->a:B

    iput-object p1, p0, Luog;->b:Lev4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCancel()V
    .registers 2

    iget-byte v0, p0, Luog;->a:B

    iget-object p0, p0, Luog;->b:Lev4;

    packed-switch v0, :pswitch_data_10

    const/4 v0, 0x1

    iput-boolean v0, p0, Lev4;->c:Z

    return-void

    :pswitch_b
    const/4 v0, 0x0

    iput-boolean v0, p0, Lev4;->b:Z

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
