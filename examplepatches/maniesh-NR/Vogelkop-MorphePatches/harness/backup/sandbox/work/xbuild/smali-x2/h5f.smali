.class public final synthetic Lh5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:S

.field public final synthetic c:Z

.field public final synthetic d:Lubk;


# direct methods
.method public synthetic constructor <init>(Lhd;JZ)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Lh5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh5f;->d:Lubk;

    long-to-int p1, p2

    iput-short p1, p0, Lh5f;->b:S

    iput-boolean p4, p0, Lh5f;->c:Z

    return-void
.end method

.method public synthetic constructor <init>(Lhd;JZB)V
    .registers 6

    .line 14
    const/4 p5, 0x4

    iput-byte p5, p0, Lh5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh5f;->d:Lubk;

    long-to-int p1, p2

    iput-short p1, p0, Lh5f;->b:S

    iput-boolean p4, p0, Lh5f;->c:Z

    return-void
.end method

.method public synthetic constructor <init>(Losf;JZ)V
    .registers 6

    .line 16
    const/4 v0, 0x1

    iput-byte v0, p0, Lh5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh5f;->d:Lubk;

    long-to-int p1, p2

    iput-short p1, p0, Lh5f;->b:S

    iput-boolean p4, p0, Lh5f;->c:Z

    return-void
.end method

.method public synthetic constructor <init>(Lwsf;JZ)V
    .registers 6

    .line 17
    const/4 v0, 0x3

    iput-byte v0, p0, Lh5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh5f;->d:Lubk;

    long-to-int p1, p2

    iput-short p1, p0, Lh5f;->b:S

    iput-boolean p4, p0, Lh5f;->c:Z

    return-void
.end method

.method public synthetic constructor <init>(Lx5f;JZ)V
    .registers 6

    .line 15
    const/4 v0, 0x0

    iput-byte v0, p0, Lh5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh5f;->d:Lubk;

    long-to-int p1, p2

    iput-short p1, p0, Lh5f;->b:S

    iput-boolean p4, p0, Lh5f;->c:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lh5f;->a:B

    iget-boolean v1, p0, Lh5f;->c:Z

    iget-short v2, p0, Lh5f;->b:S

    iget-object p0, p0, Lh5f;->d:Lubk;

    packed-switch v0, :pswitch_data_50

    check-cast p0, Lhd;

    int-to-long v2, v2

    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {p0, v2, v3, v1}, Lshf;->P(JZ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a
    check-cast p0, Lwsf;

    int-to-long v2, v2

    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Lwsf;->c:Lshf;

    invoke-virtual {p0, v2, v3, v1}, Lshf;->P(JZ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27
    check-cast p0, Lhd;

    int-to-long v2, v2

    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {p0, v2, v3, v1}, Lshf;->P(JZ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_36
    check-cast p0, Losf;

    int-to-long v2, v2

    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Losf;->c:Lshf;

    invoke-virtual {p0, v2, v3, v1}, Lshf;->P(JZ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_43
    check-cast p0, Lx5f;

    int-to-long v2, v2

    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Lx5f;->g:Lf11;

    invoke-virtual {p0, v2, v3, v1}, Lshf;->P(JZ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_43
        :pswitch_36
        :pswitch_27
        :pswitch_1a
    .end packed-switch
.end method
