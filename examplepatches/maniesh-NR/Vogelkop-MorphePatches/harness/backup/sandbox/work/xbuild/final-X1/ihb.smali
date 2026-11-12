.class public final synthetic Lihb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    const/4 v0, 0x1

    iput-byte v0, p0, Lihb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 7
    iput-byte p2, p0, Lihb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Ljava/lang/Object;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 2

    iget-byte p0, p0, Lihb;->a:B

    packed-switch p0, :pswitch_data_e

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :pswitch_a
    return-void

    :pswitch_b
    check-cast p1, Ley;

    return-void

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
    .end packed-switch
.end method
