.class public final synthetic Lfm6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgm6;

.field public final synthetic c:Llm6;


# direct methods
.method public synthetic constructor <init>(Lgm6;Llm6;B)V
    .registers 4

    iput-byte p3, p0, Lfm6;->a:B

    iput-object p1, p0, Lfm6;->b:Lgm6;

    iput-object p2, p0, Lfm6;->c:Llm6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lfm6;->a:B

    iget-object v0, p0, Lfm6;->c:Llm6;

    iget-object p0, p0, Lfm6;->b:Lgm6;

    packed-switch p1, :pswitch_data_18

    invoke-interface {p0}, Lgm6;->z()V

    invoke-virtual {v0}, Ldej;->b()V

    return-void

    :pswitch_10
    invoke-interface {p0}, Lgm6;->q()V

    invoke-virtual {v0}, Ldej;->b()V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
