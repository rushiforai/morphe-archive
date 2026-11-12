.class public final Liy0;
.super Lxph;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lgn3;Lxm3;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Liy0;->c:B

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Liy0;->d:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lxph;-><init>(Landroidx/recyclerview/widget/d;)V

    return-void
.end method

.method public constructor <init>(Ljy0;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Liy0;->c:B

    iput-object p1, p0, Liy0;->d:Ljava/lang/Object;

    .line 13
    invoke-direct {p0, p1}, Lxph;-><init>(Landroidx/recyclerview/widget/d;)V

    return-void
.end method

.method public constructor <init>(Lwg7;Landroidx/recyclerview/widget/d;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Liy0;->c:B

    .line 12
    iput-object p1, p0, Liy0;->d:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lxph;-><init>(Landroidx/recyclerview/widget/d;)V

    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 5

    iget-byte v0, p0, Liy0;->c:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Liy0;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_40

    check-cast p0, Lwg7;

    iget-object p0, p0, Lwg7;->z:Lze7;

    iget-object p0, p0, Lze7;->b:Lxvj;

    invoke-virtual {p0, p1}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxe7;

    iget-object p0, p0, Lxe7;->d:Lre7;

    if-eqz p0, :cond_1a

    move v1, v2

    :cond_1a
    return v1

    :pswitch_1b
    check-cast p0, Lgn3;

    iget-object p0, p0, Lgn3;->s:Lxm3;

    invoke-virtual {p0, p1}, Lxm3;->H(I)Lqhc;

    move-result-object p0

    invoke-virtual {p0}, Lqhc;->a()Z

    move-result p0

    return p0

    :pswitch_28
    check-cast p0, Ljy0;

    iget-object p0, p0, Ljy0;->f:Lwjh;

    iget-object p0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfy0;

    invoke-virtual {p0}, Lfy0;->c()Ley0;

    move-result-object p0

    sget-object p1, Ley0;->b:Ley0;

    if-ne p0, p1, :cond_3f

    move v1, v2

    :cond_3f
    return v1

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_28
        :pswitch_1b
    .end packed-switch
.end method
