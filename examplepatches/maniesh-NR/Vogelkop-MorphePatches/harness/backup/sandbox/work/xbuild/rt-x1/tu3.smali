.class public final Ltu3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, Ltu3;->a:B

    iput-object p1, p0, Ltu3;->b:Ljava/lang/String;

    iput-object p2, p0, Ltu3;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Ltu3;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Ltu3;->b:Ljava/lang/String;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Ltu3;->b:Ljava/lang/String;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
