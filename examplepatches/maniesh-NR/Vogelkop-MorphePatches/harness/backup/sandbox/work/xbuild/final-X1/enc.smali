.class public final Lenc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lorb;

.field public final synthetic b:Lhnc;

.field public final synthetic c:Lz1h;


# direct methods
.method public constructor <init>(JLhnc;Lz1h;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lenc;->b:Lhnc;

    iput-object p4, p0, Lenc;->c:Lz1h;

    return-void
.end method


# virtual methods
.method public final a(Lorb;)V
    .registers 4

    :try_start_0
    iget-object p0, p0, Lenc;->c:Lz1h;

    sget-object v0, Lzme;->Companion:Lome;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lzme;->j:Lcrb;

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lome;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v1, p1, v0}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzme;

    invoke-virtual {p0, p1}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_21
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_21} :catch_21

    :catch_21
    return-void
.end method

.method public final b(Ljava/lang/RuntimeException;Lorb;)V
    .registers 5

    sget-boolean v0, Lhnc;->s:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    sput-boolean v0, Lhnc;->s:Z

    iget-object v0, p0, Lenc;->b:Lhnc;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lenc;->a:Lorb;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lkotlin/Pair;

    const-string v1, "o"

    invoke-direct {v0, v1, p0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, p2, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p2, Lkotlin/Pair;

    const-string v1, "p"

    invoke-direct {p2, v1, p0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v0, p2}, [Lkotlin/Pair;

    move-result-object p0

    invoke-static {p0}, Lrbd;->c([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object p0

    if-eqz p0, :cond_35

    invoke-static {p1, p0}, Lks3;->E(Ljava/lang/Throwable;Ljava/util/Map;)V

    return-void

    :cond_35
    invoke-static {p1}, Lks3;->D(Ljava/lang/Throwable;)V

    return-void
.end method
