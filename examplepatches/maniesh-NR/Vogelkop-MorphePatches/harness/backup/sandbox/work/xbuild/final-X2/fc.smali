.class public final synthetic Lfc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/internal/VarCache$StreamProvider;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lfc;->a:B

    iput-object p1, p0, Lfc;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final openStream()Ljava/io/InputStream;
    .registers 2

    iget-byte v0, p0, Lfc;->a:B

    iget-object p0, p0, Lfc;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_16

    check-cast p0, Lcom/leanplum/Var;

    invoke-static {p0}, Lcom/leanplum/Var;->a(Lcom/leanplum/Var;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0

    :pswitch_e
    check-cast p0, Lcom/leanplum/internal/ActionArg;

    invoke-virtual {p0}, Lcom/leanplum/internal/ActionArg;->defaultStream()Ljava/io/InputStream;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
