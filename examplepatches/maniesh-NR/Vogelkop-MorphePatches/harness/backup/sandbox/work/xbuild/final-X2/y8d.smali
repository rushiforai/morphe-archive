.class public final Ly8d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhpf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljg4;


# direct methods
.method public synthetic constructor <init>(Ljg4;B)V
    .registers 3

    iput-byte p2, p0, Ly8d;->a:B

    iput-object p1, p0, Ly8d;->b:Ljg4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Lepf;)V
    .registers 2

    return-void
.end method

.method private final b(Lepf;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final I(Lfpf;)V
    .registers 3

    iget-byte v0, p0, Ly8d;->a:B

    iget-object p0, p0, Ly8d;->b:Ljg4;

    packed-switch v0, :pswitch_data_20

    sget-object v0, Lf8a;->h:Lf8a;

    iget-object p1, p1, Lfpf;->b:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljg4;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_13
    sget-object v0, Lf8a;->h:Lf8a;

    iget-object p1, p1, Lfpf;->b:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljg4;->accept(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method

.method public final h(Lcpf;)V
    .registers 3

    iget-byte p1, p0, Ly8d;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Ly8d;->b:Ljg4;

    packed-switch p1, :pswitch_data_10

    invoke-virtual {p0, v0}, Ljg4;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_c
    invoke-virtual {p0, v0}, Ljg4;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final n(Lepf;)V
    .registers 2

    iget-byte p0, p0, Ly8d;->a:B

    return-void
.end method

.method public final r(Lgpf;)V
    .registers 3

    iget-byte p1, p0, Ly8d;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Ly8d;->b:Ljg4;

    packed-switch p1, :pswitch_data_10

    invoke-virtual {p0, v0}, Ljg4;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_c
    invoke-virtual {p0, v0}, Ljg4;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
