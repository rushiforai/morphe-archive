.class public final synthetic Llmk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltmk;

.field public final synthetic c:Lzzh;


# direct methods
.method public synthetic constructor <init>(Ltmk;Lzzh;B)V
    .registers 4

    iput-byte p3, p0, Llmk;->a:B

    iput-object p1, p0, Llmk;->b:Ltmk;

    iput-object p2, p0, Llmk;->c:Lzzh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Llmk;->a:B

    iget-object v1, p0, Llmk;->c:Lzzh;

    iget-object p0, p0, Llmk;->b:Ltmk;

    check-cast p1, Lprh;

    packed-switch v0, :pswitch_data_14

    invoke-virtual {p0, p1, v1}, Ltmk;->d(Lprh;Lzzh;)V

    return-void

    :pswitch_f
    invoke-virtual {p0, p1, v1}, Ltmk;->d(Lprh;Lzzh;)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
