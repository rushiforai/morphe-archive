.class public final La3c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly2c;


# instance fields
.field public final synthetic a:B

.field public final b:Lx2c;


# direct methods
.method public constructor <init>(B)V
    .registers 4

    iput-byte p1, p0, La3c;->a:B

    packed-switch p1, :pswitch_data_20

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lx2c;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p1, v0, v0, v1, v1}, Lx2c;-><init>(ZZZZ)V

    iput-object p1, p0, La3c;->b:Lx2c;

    return-void

    :pswitch_12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lx2c;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p1, v0, v0, v1, v1}, Lx2c;-><init>(ZZZZ)V

    iput-object p1, p0, La3c;->b:Lx2c;

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x1
        :pswitch_12
    .end packed-switch
.end method

.method private final b()V
    .registers 1

    return-void
.end method

.method private final c()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/i;)Lx2c;
    .registers 2

    iget-byte p1, p0, La3c;->a:B

    iget-object p0, p0, La3c;->b:Lx2c;

    return-object p0
.end method

.method public final invalidate()V
    .registers 1

    iget-byte p0, p0, La3c;->a:B

    return-void
.end method
