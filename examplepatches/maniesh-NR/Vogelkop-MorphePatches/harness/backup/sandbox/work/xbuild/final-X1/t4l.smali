.class public final Lt4l;
.super Lldk;
.source "SourceFile"


# instance fields
.field public final j:Llrk;

.field public final k:Lcrb;

.field public final l:Lzyk;

.field public final m:Ls4l;


# direct methods
.method public constructor <init>(Lumi;Llrk;)V
    .registers 4

    sget-object v0, Lngh;->a:Lr16;

    invoke-direct {p0, p1}, Lldk;-><init>(Ltcl;)V

    iput-object p2, p0, Lt4l;->j:Llrk;

    new-instance p1, Lbvk;

    const/4 p2, 0x5

    invoke-direct {p1, p2}, Lbvk;-><init>(B)V

    sget-object p2, Lrpb;->d:Lqpb;

    invoke-static {p2, p1}, Lphj;->o(Lrpb;Lkotlin/jvm/functions/Function1;)Lcrb;

    move-result-object p1

    iput-object p1, p0, Lt4l;->k:Lcrb;

    new-instance p1, Lthk;

    const/16 p2, 0x8

    invoke-direct {p1, p2}, Lthk;-><init>(B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lt4l;->l:Lzyk;

    new-instance p1, Ls4l;

    sget-object p2, Ll08;->a:Ll08;

    const/4 v0, 0x0

    invoke-direct {p1, p2, v0}, Ls4l;-><init>(Ljava/util/List;I)V

    iput-object p1, p0, Lt4l;->m:Ls4l;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 4

    :try_start_0
    iget-object v0, p0, Lt4l;->l:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-static {v0}, Ls29;->i(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_28

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_28

    iget-object v1, p0, Lt4l;->k:Lcrb;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Ls4l;->Companion:Lr4l;

    invoke-virtual {v2}, Lr4l;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v1, v0, v2}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ls4l;
    :try_end_27
    .catch Lo2j; {:try_start_0 .. :try_end_27} :catch_28
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_27} :catch_28

    return-object v0

    :catch_28
    :cond_28
    iget-object p0, p0, Lt4l;->m:Ls4l;

    return-object p0
.end method

.method public final b(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Ls4l;

    :try_start_2
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lt4l;->k:Lcrb;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Ls4l;->Companion:Lr4l;

    invoke-virtual {v2}, Lr4l;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v2

    invoke-static {v2}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v1, p1, v2}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object p1

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    iget-object p0, p0, Lt4l;->l:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-static {v0, p0}, Ls29;->k(Ljava/io/InputStream;Ljava/io/File;)V
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2d} :catch_2d

    :catch_2d
    return-void
.end method

.method public final c()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ls4l;

    if-nez p1, :cond_6

    iget-object p1, p0, Lt4l;->m:Ls4l;

    :cond_6
    iget-object p0, p0, Lt4l;->j:Llrk;

    invoke-virtual {p0, p1}, Llrk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
