.class public final synthetic Lst6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldsk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lst6;->a:B

    iput-object p1, p0, Lst6;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lst6;->a:B

    iget-object p0, p0, Lst6;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1e

    check-cast p0, Ljx6;

    return-object p0

    :pswitch_a
    check-cast p0, Ljava/lang/Class;

    const/4 v0, 0x0

    :try_start_d
    invoke-virtual {p0, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lird;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_17} :catch_19

    move-object v0, p0

    goto :goto_1d

    :catch_19
    move-exception p0

    invoke-static {p0}, Lh9o;->o(Ljava/lang/Throwable;)V

    :goto_1d
    return-object v0

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
