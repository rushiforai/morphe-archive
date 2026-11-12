.class public final Lwx8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq8j;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Luqe;Ljava/lang/String;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lwx8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwx8;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lwx8;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Luy8;Lstm;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lwx8;->a:B

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwx8;->b:Ljava/lang/Object;

    iput-object p1, p0, Lwx8;->c:Ljava/lang/Object;

    return-void
.end method

.method private final b()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-byte v0, p0, Lwx8;->a:B

    packed-switch v0, :pswitch_data_16

    return-void

    :pswitch_6
    iget-object v0, p0, Lwx8;->b:Ljava/lang/Object;

    check-cast v0, Lstm;

    iget-object p0, p0, Lwx8;->c:Ljava/lang/Object;

    check-cast p0, Luy8;

    invoke-static {p0}, Luy8;->a(Luy8;)Lq8j;

    move-result-object p0

    invoke-virtual {v0, p0}, Lt7j;->b(Lq8j;)V

    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lwx8;->a:B

    iget-object v1, p0, Lwx8;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_34

    check-cast p1, Lnre;

    check-cast v1, Luqe;

    invoke-static {v1}, Luqe;->a(Luqe;)Lq8j;

    move-result-object v0

    if-ne v0, p0, :cond_1d

    invoke-static {v1}, Luqe;->b(Luqe;)V

    if-eqz p1, :cond_1d

    iget-object p0, p0, Lwx8;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v1, p1, p0}, Luqe;->c(Lnre;Ljava/lang/String;)V

    :cond_1d
    return-void

    :pswitch_1e
    check-cast p1, Lqtm;

    check-cast v1, Luy8;

    iput-object p1, v1, Luy8;->a:Lqtm;

    iget-boolean p0, v1, Luy8;->j:Z

    const/4 p1, 0x0

    if-eqz p0, :cond_2e

    iget-object p0, v1, Luy8;->o:Lqy8;

    invoke-virtual {p0, p1}, Lqy8;->c(Z)V

    :cond_2e
    iget-object p0, v1, Luy8;->p:Lqy8;

    invoke-virtual {p0, p1}, Lqy8;->c(Z)V

    return-void

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
