.class public final synthetic Lmy9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpy9;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/opera/api/Callback;


# direct methods
.method public synthetic constructor <init>(Lpy9;Ljava/lang/String;Lcom/opera/api/Callback;B)V
    .registers 5

    iput-byte p4, p0, Lmy9;->a:B

    iput-object p1, p0, Lmy9;->b:Lpy9;

    iput-object p2, p0, Lmy9;->c:Ljava/lang/String;

    iput-object p3, p0, Lmy9;->d:Lcom/opera/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lmy9;->a:B

    iget-object v1, p0, Lmy9;->d:Lcom/opera/api/Callback;

    iget-object v2, p0, Lmy9;->c:Ljava/lang/String;

    iget-object p0, p0, Lmy9;->b:Lpy9;

    check-cast p1, Ldy9;

    packed-switch v0, :pswitch_data_16

    invoke-virtual {p0, v2, p1, v1}, Lpy9;->d(Ljava/lang/String;Ldy9;Lcom/opera/api/Callback;)V

    return-void

    :pswitch_11
    invoke-virtual {p0, v2, p1, v1}, Lpy9;->d(Ljava/lang/String;Ldy9;Lcom/opera/api/Callback;)V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
