.class public final synthetic Lw4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ly4m;


# direct methods
.method public synthetic constructor <init>(Ly4m;B)V
    .registers 3

    iput-byte p2, p0, Lw4m;->a:B

    iput-object p1, p0, Lw4m;->b:Ly4m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lw4m;->a:B

    iget-object p0, p0, Lw4m;->b:Ly4m;

    check-cast p1, Ljava/util/Set;

    packed-switch v0, :pswitch_data_24

    if-nez p1, :cond_10

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    :cond_10
    iput-object p1, p0, Ly4m;->h:Ljava/util/Set;

    invoke-virtual {p0}, Ln1;->v0()V

    return-void

    :pswitch_16
    if-nez p1, :cond_1d

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    :cond_1d
    iput-object p1, p0, Ly4m;->g:Ljava/util/Set;

    invoke-virtual {p0}, Ln1;->v0()V

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
