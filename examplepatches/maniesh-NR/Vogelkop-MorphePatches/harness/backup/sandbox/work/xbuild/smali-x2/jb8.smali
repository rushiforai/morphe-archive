.class public final Ljb8;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lib8;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lib8;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ljb8;->Companion:Lib8;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 15

    and-int/lit16 v0, p1, 0x7ff

    const/16 v1, 0x7ff

    if-ne v1, v0, :cond_20

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ljb8;->a:Ljava/lang/String;

    iput-object p3, p0, Ljb8;->b:Ljava/lang/String;

    iput-object p4, p0, Ljb8;->c:Ljava/lang/String;

    iput-object p5, p0, Ljb8;->d:Ljava/lang/String;

    iput-object p6, p0, Ljb8;->e:Ljava/lang/String;

    iput-object p7, p0, Ljb8;->f:Ljava/lang/String;

    iput-object p8, p0, Ljb8;->g:Ljava/lang/String;

    iput-object p9, p0, Ljb8;->h:Ljava/lang/String;

    iput-object p10, p0, Ljb8;->i:Ljava/lang/String;

    iput-object p11, p0, Ljb8;->j:Ljava/lang/String;

    iput-object p12, p0, Ljb8;->k:Ljava/lang/String;

    return-void

    :cond_20
    sget-object p0, Lhb8;->a:Lhb8;

    invoke-virtual {p0}, Lhb8;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Ljb8;->a:Ljava/lang/String;

    .line 45
    iput-object p2, p0, Ljb8;->b:Ljava/lang/String;

    .line 46
    iput-object p3, p0, Ljb8;->c:Ljava/lang/String;

    .line 47
    iput-object p4, p0, Ljb8;->d:Ljava/lang/String;

    .line 48
    iput-object p5, p0, Ljb8;->e:Ljava/lang/String;

    .line 49
    iput-object p6, p0, Ljb8;->f:Ljava/lang/String;

    .line 50
    iput-object p7, p0, Ljb8;->g:Ljava/lang/String;

    .line 51
    iput-object p8, p0, Ljb8;->h:Ljava/lang/String;

    .line 52
    iput-object p9, p0, Ljb8;->i:Ljava/lang/String;

    .line 53
    iput-object p10, p0, Ljb8;->j:Ljava/lang/String;

    .line 54
    iput-object p11, p0, Ljb8;->k:Ljava/lang/String;

    return-void
.end method

.method public static final a(Lorb;)Ljb8;
    .registers 14

    sget-object v0, Ljb8;->Companion:Lib8;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "title"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v0, "card_content"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "card_content_color"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "card_content_color_dark"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "bg_image"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "bg_image_dark"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "bg_color"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v0, "bg_color_dark"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v0, "more_link_text"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v0, "more_link_url"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v0, "infra_feedback"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "theme_id"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_62

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    new-instance v1, Ljb8;

    invoke-direct/range {v1 .. v12}, Ljb8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_62
    const-string p0, "theme_id is null"

    invoke-static {p0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ljb8;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ljb8;

    iget-object v1, p0, Ljb8;->a:Ljava/lang/String;

    iget-object v3, p1, Ljb8;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Ljb8;->b:Ljava/lang/String;

    iget-object v3, p1, Ljb8;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Ljb8;->c:Ljava/lang/String;

    iget-object v3, p1, Ljb8;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object v1, p0, Ljb8;->d:Ljava/lang/String;

    iget-object v3, p1, Ljb8;->d:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    return v2

    :cond_38
    iget-object v1, p0, Ljb8;->e:Ljava/lang/String;

    iget-object v3, p1, Ljb8;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_43

    return v2

    :cond_43
    iget-object v1, p0, Ljb8;->f:Ljava/lang/String;

    iget-object v3, p1, Ljb8;->f:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4e

    return v2

    :cond_4e
    iget-object v1, p0, Ljb8;->g:Ljava/lang/String;

    iget-object v3, p1, Ljb8;->g:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_59

    return v2

    :cond_59
    iget-object v1, p0, Ljb8;->h:Ljava/lang/String;

    iget-object v3, p1, Ljb8;->h:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_64

    return v2

    :cond_64
    iget-object v1, p0, Ljb8;->i:Ljava/lang/String;

    iget-object v3, p1, Ljb8;->i:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6f

    return v2

    :cond_6f
    iget-object v1, p0, Ljb8;->j:Ljava/lang/String;

    iget-object v3, p1, Ljb8;->j:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7a

    return v2

    :cond_7a
    iget-object p0, p0, Ljb8;->k:Ljava/lang/String;

    iget-object p1, p1, Ljb8;->k:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_85

    return v2

    :cond_85
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ljb8;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ljb8;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Ljb8;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Ljb8;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Ljb8;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Ljb8;->f:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Ljb8;->g:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Ljb8;->h:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Ljb8;->i:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Ljb8;->j:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Ljb8;->k:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
