.class public final Lg4p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlinx/serialization/KSerializer;


# static fields
.field public static final c:Lg4p;


# instance fields
.field public final a:Ls15;

.field public final b:Ld2j;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lg4p;

    invoke-direct {v0}, Lg4p;-><init>()V

    sput-object v0, Lg4p;->c:Lg4p;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    const-class v0, Lf4p;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lg4p;->a:Ls15;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "JsonContentPolymorphicSerializer<"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ls15;->c()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x3e

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lnng;->c:Lnng;

    const/4 v2, 0x0

    new-array v2, v2, [Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-static {v0, v1, v2}, Lxug;->g(Ljava/lang/String;Lxvg;[Lkotlinx/serialization/descriptors/SerialDescriptor;)Ld2j;

    move-result-object v0

    iput-object v0, p0, Lg4p;->b:Ld2j;

    return-void
.end method


# virtual methods
.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 4

    invoke-static {p1}, Lmkh;->f(Lkotlinx/serialization/encoding/Decoder;)Lmng;

    move-result-object p0

    invoke-interface {p0}, Lmng;->i()Lkotlinx/serialization/json/b;

    move-result-object p1

    invoke-static {p1}, Lqqb;->h(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/c;

    move-result-object v0

    const-string v1, "title"

    invoke-virtual {v0, v1}, Lkotlinx/serialization/json/c;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    sget-object v0, Lg5p;->Companion:Lf5p;

    invoke-virtual {v0}, Lf5p;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    goto :goto_5a

    :cond_1b
    invoke-static {p1}, Lqqb;->h(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/c;

    move-result-object v0

    const-string v1, "img"

    invoke-virtual {v0, v1}, Lkotlinx/serialization/json/c;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    sget-object v0, Lt4p;->Companion:Ls4p;

    invoke-virtual {v0}, Ls4p;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    goto :goto_5a

    :cond_2e
    invoke-static {p1}, Lqqb;->h(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/c;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {v0, v1}, Lkotlinx/serialization/json/c;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_41

    sget-object v0, Ln4p;->Companion:Lm4p;

    invoke-virtual {v0}, Lm4p;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    goto :goto_5a

    :cond_41
    invoke-static {p1}, Lqqb;->h(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/c;

    move-result-object v0

    const-string v1, "video"

    invoke-virtual {v0, v1}, Lkotlinx/serialization/json/c;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    sget-object v0, Lm5p;->Companion:Ll5p;

    invoke-virtual {v0}, Ll5p;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    goto :goto_5a

    :cond_54
    sget-object v0, Lf4p;->Companion:Le4p;

    invoke-virtual {v0}, Le4p;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    :goto_5a
    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-interface {p0}, Lmng;->d()Lrpb;

    move-result-object p0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Ljym;->w(Lrpb;Lkotlinx/serialization/json/b;Lkotlinx/serialization/KSerializer;Lmng;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    iget-object p0, p0, Lg4p;->b:Ld2j;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 6

    invoke-interface {p1}, Lkotlinx/serialization/encoding/Encoder;->a()Lx79;

    move-result-object v0

    iget-object p0, p0, Lg4p;->a:Ls15;

    invoke-virtual {v0, p0, p2}, Lx79;->I(Litb;Ljava/lang/Object;)Lkotlinx/serialization/KSerializer;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-static {v0}, Lzwg;->r(Litb;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    if-eqz v0, :cond_1f

    check-cast v0, Lkotlinx/serialization/KSerializer;

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-interface {v0, p1, p2}, Lkotlinx/serialization/KSerializer;->serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V

    return-void

    :cond_1f
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-static {p1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p1

    invoke-virtual {p1}, Ls15;->c()Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_31

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    :cond_31
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "in the scope of \'"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ls15;->c()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x27

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Lo2j;

    const-string v0, "\' is not registered for polymorphic serialization "

    const-string v1, ".\nMark the base class as \'sealed\' or register the serializer explicitly."

    const-string v2, "Class \'"

    invoke-static {v2, p2, v0, p0, v1}, Lsko;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
