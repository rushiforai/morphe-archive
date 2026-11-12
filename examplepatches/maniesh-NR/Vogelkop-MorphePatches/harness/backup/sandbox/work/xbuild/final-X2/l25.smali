.class public final synthetic Ll25;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ln25;

.field public final synthetic c:Ls25;

.field public final synthetic d:Liu2;


# direct methods
.method public synthetic constructor <init>(Ln25;Ls25;Liu2;B)V
    .registers 5

    iput-byte p4, p0, Ll25;->a:B

    iput-object p1, p0, Ll25;->b:Ln25;

    iput-object p2, p0, Ll25;->c:Ls25;

    iput-object p3, p0, Ll25;->d:Liu2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Ll25;->a:B

    iget-object v1, p0, Ll25;->d:Liu2;

    iget-object v2, p0, Ll25;->c:Ls25;

    iget-object p0, p0, Ll25;->b:Ln25;

    check-cast p1, Ljava/util/List;

    packed-switch v0, :pswitch_data_22

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iput p1, p0, Ln25;->h:I

    invoke-virtual {p0, v2, v1}, Ln25;->e(Ls25;Liu2;)V

    return-void

    :pswitch_17
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iput p1, p0, Ln25;->g:I

    invoke-virtual {p0, v2, v1}, Ln25;->e(Ls25;Liu2;)V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method
