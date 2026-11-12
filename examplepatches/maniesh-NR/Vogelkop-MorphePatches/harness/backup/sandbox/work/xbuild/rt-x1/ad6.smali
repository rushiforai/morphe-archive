.class public final Lad6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu2j;


# static fields
.field public static final a:Lad6;

.field public static final b:Lfdk;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lad6;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lad6;->a:Lad6;

    sget-object v0, Lme6;->b:Lfdk;

    sput-object v0, Lad6;->b:Lfdk;

    return-void
.end method


# virtual methods
.method public final getDefaultValue()Ljava/lang/Object;
    .registers 1

    sget-object p0, Lad6;->b:Lfdk;

    return-object p0
.end method

.method public final readFrom(Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 3

    :try_start_0
    sget-object p0, Lme6;->c:Lcrb;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lfdk;->Companion:Ledk;

    invoke-virtual {v0}, Ledk;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-static {p0, v0, p1}, Lcqp;->L(Lrpb;Lkotlinx/serialization/KSerializer;Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object p0
    :try_end_11
    .catch Lo2j; {:try_start_0 .. :try_end_11} :catch_12

    return-object p0

    :catch_12
    move-exception p0

    new-instance p1, Lwx5;

    const-string v0, "Unable to read ntp"

    invoke-direct {p1, v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public final writeTo(Ljava/lang/Object;Ljava/io/OutputStream;)Lkotlin/Unit;
    .registers 4

    check-cast p1, Lfdk;

    sget-object p0, Lme6;->c:Lcrb;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lfdk;->Companion:Ledk;

    invoke-virtual {v0}, Ledk;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-static {p0, v0, p1, p2}, Lcqp;->O(Lrpb;Lkotlinx/serialization/KSerializer;Ljava/lang/Object;Ljava/io/OutputStream;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
