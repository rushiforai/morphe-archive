.class public final Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/messagetemplates/OperaSheetRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Model"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0081\u0008\u0018\u00002\u00020\u0001BU\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u0012\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\t\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u0010\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\t\u0010\u0014\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0015\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0016\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0017\u001a\u00020\u0005H\u00c6\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\tH\u00c6\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\tH\u00c6\u0003J\t\u0010\u001a\u001a\u00020\u000cH\u00c6\u0003J\t\u0010\u001b\u001a\u00020\u000eH\u00c6\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0010H\u00c6\u0003Ji\u0010\u001d\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00052\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\t2\n\u0008\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\r\u001a\u00020\u000e2\n\u0008\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0010H\u00c6\u0001J\u0014\u0010\u001e\u001a\u00020\u000e2\u0008\u0010\u001f\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u0010 \u001a\u00020!H\u00d6\u0081\u0004J\u0006\u0010\"\u001a\u00020\u0005R\u0015\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\u0013\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\u0013\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\u0013\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u0007\u001a\u00020\u00058\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\u0013\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u0008\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\u0013\u00a2\u0006\u0002\n\u0000R\u0017\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\u0013\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u000b\u001a\u00020\u000c8\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\u0013\u00a2\u0006\u0002\n\u0000R\u0015\u0010\r\u001a\u00020\u000e8\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\u0013\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u000f\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\u0013\u00a2\u0006\u0002\n\u0000\u00ca\u0001\u000c\u0008$\u0012\u0008\u0008%\u0012\u0004\u0008\u0003\u0010\u0000\u00a8\u0006#"
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;",
        "",
        "type",
        "Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;",
        "id",
        "",
        "title",
        "message",
        "primaryButton",
        "Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;",
        "secondaryButton",
        "resourceWrapper",
        "Lcom/leanplum/messagetemplates/ResourceWrapper;",
        "fullWidthButtons",
        "",
        "closeButtonAction",
        "Ljava/lang/Runnable;",
        "<init>",
        "(Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/ResourceWrapper;ZLjava/lang/Runnable;)V",
        "Lkotlin/jvm/JvmField;",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "component7",
        "component8",
        "component9",
        "copy",
        "equals",
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
.field public final closeButtonAction:Ljava/lang/Runnable;

.field public final fullWidthButtons:Z

.field public final id:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final message:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final primaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

.field public final resourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final secondaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

.field public final title:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final type:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/ResourceWrapper;ZLjava/lang/Runnable;)V
    .registers 10
    .param p1    # Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Lcom/leanplum/messagetemplates/ResourceWrapper;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->type:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->title:Ljava/lang/String;

    iput-object p4, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->message:Ljava/lang/String;

    iput-object p5, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->primaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    iput-object p6, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->secondaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    iput-object p7, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->resourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    iput-boolean p8, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->fullWidthButtons:Z

    iput-object p9, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->closeButtonAction:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic copy$default(Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/ResourceWrapper;ZLjava/lang/Runnable;ILjava/lang/Object;)Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;
    .registers 12

    and-int/lit8 p11, p10, 0x1

    if-eqz p11, :cond_6

    iget-object p1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->type:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    :cond_6
    and-int/lit8 p11, p10, 0x2

    if-eqz p11, :cond_c

    iget-object p2, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    :cond_c
    and-int/lit8 p11, p10, 0x4

    if-eqz p11, :cond_12

    iget-object p3, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->title:Ljava/lang/String;

    :cond_12
    and-int/lit8 p11, p10, 0x8

    if-eqz p11, :cond_18

    iget-object p4, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->message:Ljava/lang/String;

    :cond_18
    and-int/lit8 p11, p10, 0x10

    if-eqz p11, :cond_1e

    iget-object p5, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->primaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    :cond_1e
    and-int/lit8 p11, p10, 0x20

    if-eqz p11, :cond_24

    iget-object p6, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->secondaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    :cond_24
    and-int/lit8 p11, p10, 0x40

    if-eqz p11, :cond_2a

    iget-object p7, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->resourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    :cond_2a
    and-int/lit16 p11, p10, 0x80

    if-eqz p11, :cond_30

    iget-boolean p8, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->fullWidthButtons:Z

    :cond_30
    and-int/lit16 p10, p10, 0x100

    if-eqz p10, :cond_36

    iget-object p9, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->closeButtonAction:Ljava/lang/Runnable;

    :cond_36
    move p10, p8

    move-object p11, p9

    move-object p8, p6

    move-object p9, p7

    move-object p6, p4

    move-object p7, p5

    move-object p4, p2

    move-object p5, p3

    move-object p2, p0

    move-object p3, p1

    invoke-virtual/range {p2 .. p11}, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->copy(Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/ResourceWrapper;ZLjava/lang/Runnable;)Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->type:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    return-object p0
.end method

.method public final component2()Ljava/lang/String;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    return-object p0
.end method

.method public final component3()Ljava/lang/String;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->title:Ljava/lang/String;

    return-object p0
.end method

.method public final component4()Ljava/lang/String;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->message:Ljava/lang/String;

    return-object p0
.end method

.method public final component5()Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->primaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    return-object p0
.end method

.method public final component6()Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->secondaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    return-object p0
.end method

.method public final component7()Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->resourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    return-object p0
.end method

.method public final component8()Z
    .registers 1

    iget-boolean p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->fullWidthButtons:Z

    return p0
.end method

.method public final component9()Ljava/lang/Runnable;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->closeButtonAction:Ljava/lang/Runnable;

    return-object p0
.end method

.method public final copy(Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/ResourceWrapper;ZLjava/lang/Runnable;)Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;
    .registers 10
    .param p1    # Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Lcom/leanplum/messagetemplates/ResourceWrapper;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    invoke-direct/range {p0 .. p9}, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;-><init>(Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/ResourceWrapper;ZLjava/lang/Runnable;)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->type:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    iget-object v3, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->type:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    iget-object v3, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->title:Ljava/lang/String;

    iget-object v3, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->title:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    return v2

    :cond_29
    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->message:Ljava/lang/String;

    iget-object v3, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->message:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    return v2

    :cond_34
    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->primaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    iget-object v3, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->primaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3f

    return v2

    :cond_3f
    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->secondaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    iget-object v3, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->secondaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4a

    return v2

    :cond_4a
    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->resourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    iget-object v3, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->resourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_55

    return v2

    :cond_55
    iget-boolean v1, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->fullWidthButtons:Z

    iget-boolean v3, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->fullWidthButtons:Z

    if-eq v1, v3, :cond_5c

    return v2

    :cond_5c
    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->closeButtonAction:Ljava/lang/Runnable;

    iget-object p1, p1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->closeButtonAction:Ljava/lang/Runnable;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_67

    return v2

    :cond_67
    return v0
.end method

.method public hashCode()I
    .registers 5

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->type:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->title:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->message:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->primaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    const/4 v3, 0x0

    if-nez v2, :cond_22

    move v2, v3

    goto :goto_26

    :cond_22
    invoke-virtual {v2}, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->hashCode()I

    move-result v2

    :goto_26
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->secondaryButton:Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    if-nez v2, :cond_2e

    move v2, v3

    goto :goto_32

    :cond_2e
    invoke-virtual {v2}, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;->hashCode()I

    move-result v2

    :goto_32
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->resourceWrapper:Lcom/leanplum/messagetemplates/ResourceWrapper;

    invoke-virtual {v2}, Lcom/leanplum/messagetemplates/ResourceWrapper;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->fullWidthButtons:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->closeButtonAction:Ljava/lang/Runnable;

    if-eqz p0, :cond_4a

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :cond_4a
    add-int/2addr v0, v3

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string p0, ""

    return-object p0
.end method
