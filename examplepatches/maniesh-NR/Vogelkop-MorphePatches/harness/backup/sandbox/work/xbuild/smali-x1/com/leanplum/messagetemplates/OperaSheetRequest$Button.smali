.class public final Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/messagetemplates/OperaSheetRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Button"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0081\u0008\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\t\u0010\u000b\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u000c\u001a\u00020\u0005H\u00c6\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0007H\u00c6\u0003J)\u0010\u000e\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u00c6\u0001J\u0014\u0010\u000f\u001a\u00020\u00102\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u0010\u0012\u001a\u00020\u0013H\u00d6\u0081\u0004J\u0006\u0010\u0014\u001a\u00020\u0003R\u0015\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\n\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\n\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u0006\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\n\u00a2\u0006\u0002\n\u0000\u00ca\u0001\u000c\u0008\u0016\u0012\u0008\u0008\u0017\u0012\u0004\u0008\u0003\u0010\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;",
        "",
        "label",
        "",
        "action",
        "Ljava/lang/Runnable;",
        "promoUrl",
        "Landroid/net/Uri;",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/Runnable;Landroid/net/Uri;)V",
        "Lkotlin/jvm/JvmField;",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
        "app",
        "Landroidx/compose/runtime/internal/StabilityInferred;",
        "parameters"
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
.field public static final $stable:I = 0x8


# instance fields
.field public final action:Ljava/lang/Runnable;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final label:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final promoUrl:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Runnable;Landroid/net/Uri;)V
    .registers 4
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->label:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->action:Ljava/lang/Runnable;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->promoUrl:Landroid/net/Uri;

    return-void
.end method

.method public static synthetic copy$default(Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Ljava/lang/String;Ljava/lang/Runnable;Landroid/net/Uri;ILjava/lang/Object;)Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;
    .registers 6

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_6

    iget-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->label:Ljava/lang/String;

    :cond_6
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_c

    iget-object p2, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->action:Ljava/lang/Runnable;

    :cond_c
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_12

    iget-object p3, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->promoUrl:Landroid/net/Uri;

    :cond_12
    invoke-virtual {p0, p1, p2, p3}, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->copy(Ljava/lang/String;Ljava/lang/Runnable;Landroid/net/Uri;)Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->label:Ljava/lang/String;

    return-object p0
.end method

.method public final component2()Ljava/lang/Runnable;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->action:Ljava/lang/Runnable;

    return-object p0
.end method

.method public final component3()Landroid/net/Uri;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->promoUrl:Landroid/net/Uri;

    return-object p0
.end method

.method public final copy(Ljava/lang/String;Ljava/lang/Runnable;Landroid/net/Uri;)Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;
    .registers 4
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    invoke-direct {p0, p1, p2, p3}, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;-><init>(Ljava/lang/String;Ljava/lang/Runnable;Landroid/net/Uri;)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->label:Ljava/lang/String;

    iget-object v3, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->label:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->action:Ljava/lang/Runnable;

    iget-object v3, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->action:Ljava/lang/Runnable;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->promoUrl:Landroid/net/Uri;

    iget-object p1, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->promoUrl:Landroid/net/Uri;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2d

    return v2

    :cond_2d
    return v0
.end method

.method public hashCode()I
    .registers 3

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->label:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->action:Ljava/lang/Runnable;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->promoUrl:Landroid/net/Uri;

    if-nez p0, :cond_17

    const/4 p0, 0x0

    goto :goto_1b

    :cond_17
    invoke-virtual {p0}, Landroid/net/Uri;->hashCode()I

    move-result p0

    :goto_1b
    add-int/2addr v1, p0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string p0, ""

    return-object p0
.end method
