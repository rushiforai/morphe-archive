.class public final synthetic Lz0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lk6l;


# direct methods
.method public synthetic constructor <init>(Lk6l;B)V
    .registers 3

    iput-byte p2, p0, Lz0a;->a:B

    iput-object p1, p0, Lz0a;->b:Lk6l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lz0a;->a:B

    iget-object p0, p0, Lz0a;->b:Lk6l;

    packed-switch v0, :pswitch_data_20

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_17

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    if-eqz p0, :cond_17

    const/4 p0, 0x1

    goto :goto_18

    :cond_17
    const/4 p0, 0x0

    :goto_18
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1d
    iget-object p0, p0, Lk6l;->o:Lb2l;

    return-object p0

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
