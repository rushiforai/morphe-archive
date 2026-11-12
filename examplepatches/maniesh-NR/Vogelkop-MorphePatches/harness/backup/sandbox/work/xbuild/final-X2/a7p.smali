.class public final La7p;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ld7p;


# direct methods
.method public synthetic constructor <init>(Ld7p;B)V
    .registers 3

    iput-byte p2, p0, La7p;->i:B

    iput-object p1, p0, La7p;->j:Ld7p;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, La7p;->i:B

    iget-object p0, p0, La7p;->j:Ld7p;

    packed-switch v0, :pswitch_data_2c

    iget-object p0, p0, Ld7p;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/json/c;

    invoke-virtual {p0}, Lkotlinx/serialization/json/c;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_14
    sget-object v0, Lx9p;->a:Lzyk;

    invoke-static {}, Lfcp;->d()Lrpb;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Ld7p;->Companion:Lb7p;

    invoke-virtual {v1}, Lb7p;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    invoke-static {v0, p0, v1}, Lddh;->A(Lrpb;Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/json/b;

    move-result-object p0

    invoke-static {p0}, Lqqb;->h(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/c;

    move-result-object p0

    return-object p0

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
