.class public final Lcom/leanplum/messagetemplates/ResourceWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\n\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0007\u0008\u0081\u0008\u0018\u0000 \u001f2\u00020\u0001:\u0001\u001fB#\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\r\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0012\u0010\r\u001a\u0004\u0018\u00010\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0012\u0010\u000f\u001a\u0004\u0018\u00010\u0004H\u00c6\u0003\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0006H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J2\u0010\u0013\u001a\u00020\u00002\n\u0008\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u00022\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0006H\u00c6\u0001\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0010\u0010\u0016\u001a\u00020\u0015H\u00d6\u0001\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u001a\u0010\u001a\u001a\u00020\u00192\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008\u001a\u0010\u001bR\u0016\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0003\u0010\u001cR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006X\u0087\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010\u001dR\u0014\u0010\u0007\u001a\u00020\u00068\u0006X\u0087\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010\u001e\u00a8\u0006 "
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/ResourceWrapper;",
        "",
        "Landroid/graphics/Bitmap;",
        "image",
        "Lp2d;",
        "lottieComposition",
        "Ldg0;",
        "status",
        "<init>",
        "(Landroid/graphics/Bitmap;Lp2d;Ldg0;)V",
        "",
        "toString",
        "()Ljava/lang/String;",
        "component1",
        "()Landroid/graphics/Bitmap;",
        "component2",
        "()Lp2d;",
        "component3",
        "()Ldg0;",
        "copy",
        "(Landroid/graphics/Bitmap;Lp2d;Ldg0;)Lcom/leanplum/messagetemplates/ResourceWrapper;",
        "",
        "hashCode",
        "()I",
        "other",
        "",
        "equals",
        "(Ljava/lang/Object;)Z",
        "Landroid/graphics/Bitmap;",
        "Lp2d;",
        "Ldg0;",
        "Companion",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I

.field public static final Companion:Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final EMPTY:Lcom/leanplum/messagetemplates/ResourceWrapper;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final image:Landroid/graphics/Bitmap;

.field public final lottieComposition:Lp2d;

.field public final status:Ldg0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/leanplum/messagetemplates/ResourceWrapper;->Companion:Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/leanplum/messagetemplates/ResourceWrapper;->$stable:I

    new-instance v0, Lcom/leanplum/messagetemplates/ResourceWrapper;

    sget-object v2, Ldg0;->b:Ldg0;

    invoke-direct {v0, v1, v1, v2}, Lcom/leanplum/messagetemplates/ResourceWrapper;-><init>(Landroid/graphics/Bitmap;Lp2d;Ldg0;)V

    sput-object v0, Lcom/leanplum/messagetemplates/ResourceWrapper;->EMPTY:Lcom/leanplum/messagetemplates/ResourceWrapper;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;Lp2d;Ldg0;)V
    .registers 4
    .param p3    # Ldg0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->image:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->lottieComposition:Lp2d;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    return-void
.end method

.method public static synthetic copy$default(Lcom/leanplum/messagetemplates/ResourceWrapper;Landroid/graphics/Bitmap;Lp2d;Ldg0;ILjava/lang/Object;)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 6

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_6

    iget-object p1, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->image:Landroid/graphics/Bitmap;

    :cond_6
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_c

    iget-object p2, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->lottieComposition:Lp2d;

    :cond_c
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_12

    iget-object p3, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    :cond_12
    invoke-virtual {p0, p1, p2, p3}, Lcom/leanplum/messagetemplates/ResourceWrapper;->copy(Landroid/graphics/Bitmap;Lp2d;Ldg0;)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0
.end method

.method public static final getResourceFromInputStream(Ljava/io/InputStream;Z)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/leanplum/messagetemplates/ResourceWrapper;->Companion:Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;

    invoke-virtual {v0, p0, p1}, Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;->getResourceFromInputStream(Ljava/io/InputStream;Z)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Landroid/graphics/Bitmap;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->image:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method public final component2()Lp2d;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->lottieComposition:Lp2d;

    return-object p0
.end method

.method public final component3()Ldg0;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    return-object p0
.end method

.method public final copy(Landroid/graphics/Bitmap;Lp2d;Ldg0;)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 4
    .param p3    # Ldg0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance p0, Lcom/leanplum/messagetemplates/ResourceWrapper;

    invoke-direct {p0, p1, p2, p3}, Lcom/leanplum/messagetemplates/ResourceWrapper;-><init>(Landroid/graphics/Bitmap;Lp2d;Ldg0;)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lcom/leanplum/messagetemplates/ResourceWrapper;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lcom/leanplum/messagetemplates/ResourceWrapper;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->image:Landroid/graphics/Bitmap;

    iget-object v3, p1, Lcom/leanplum/messagetemplates/ResourceWrapper;->image:Landroid/graphics/Bitmap;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->lottieComposition:Lp2d;

    iget-object v3, p1, Lcom/leanplum/messagetemplates/ResourceWrapper;->lottieComposition:Lp2d;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object p0, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    iget-object p1, p1, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2d

    return v2

    :cond_2d
    return v0
.end method

.method public hashCode()I
    .registers 4

    iget-object v0, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->image:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    if-nez v0, :cond_7

    move v0, v1

    goto :goto_b

    :cond_7
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_b
    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->lottieComposition:Lp2d;

    if-eqz v2, :cond_15

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_15
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string p0, ""

    return-object p0
.end method
