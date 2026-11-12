.class public final synthetic Lmd9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lod9;


# direct methods
.method public synthetic constructor <init>(Lod9;B)V
    .registers 3

    iput-byte p2, p0, Lmd9;->a:B

    iput-object p1, p0, Lmd9;->b:Lod9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lmd9;->a:B

    iget-object p0, p0, Lmd9;->b:Lod9;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lod9;->y0(Ljava/lang/Boolean;)V

    return-void

    :pswitch_d
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lod9;->z0(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
