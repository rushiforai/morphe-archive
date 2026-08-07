.class public final Lcom/clevertap/android/sdk/inapp/pipsdk/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0006\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u00081\u0008\u0086\u0008\u0018\u00002\u00020\u0001B\u00e7\u0001\u0008\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0002\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\u0008\u0012\u0008\u0008\u0002\u0010\u000b\u001a\u00020\n\u0012\u0008\u0008\u0002\u0010\u000c\u001a\u00020\n\u0012\u0008\u0008\u0002\u0010\u000e\u001a\u00020\r\u0012\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u0008\u0012\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u0008\u0012\u0008\u0008\u0002\u0010\u0012\u001a\u00020\u0011\u0012\n\u0008\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\u0008\u0008\u0002\u0010\u0016\u001a\u00020\u0015\u0012\u0008\u0008\u0002\u0010\u0017\u001a\u00020\u0015\u0012\u0008\u0008\u0002\u0010\u0018\u001a\u00020\u0015\u0012\u0008\u0008\u0002\u0010\u0019\u001a\u00020\u0015\u0012\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u0015\u0012\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u0008\u0012\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u0015\u0012\u0008\u0008\u0002\u0010\u001d\u001a\u00020\u0008\u0012\u0008\u0008\u0002\u0010\u001e\u001a\u00020\u0008\u0012\n\u0008\u0002\u0010 \u001a\u0004\u0018\u00010\u001f\u00a2\u0006\u0004\u0008!\u0010\"J\u0010\u0010#\u001a\u00020\u0002H\u00d6\u0001\u00a2\u0006\u0004\u0008#\u0010$J\u0010\u0010%\u001a\u00020\u0008H\u00d6\u0001\u00a2\u0006\u0004\u0008%\u0010&J\u001a\u0010(\u001a\u00020\u00152\u0008\u0010\'\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008(\u0010)R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008*\u0010+\u001a\u0004\u0008,\u0010$R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008-\u0010.\u001a\u0004\u0008/\u00100R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006\u00a2\u0006\u000c\n\u0004\u00081\u0010+\u001a\u0004\u00082\u0010$R\u0017\u0010\u0007\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u00083\u0010+\u001a\u0004\u00084\u0010$R\u0017\u0010\t\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u00085\u00106\u001a\u0004\u00087\u0010&R\u0017\u0010\u000b\u001a\u00020\n8\u0006\u00a2\u0006\u000c\n\u0004\u00088\u00109\u001a\u0004\u00083\u0010:R\u0017\u0010\u000c\u001a\u00020\n8\u0006\u00a2\u0006\u000c\n\u0004\u0008;\u00109\u001a\u0004\u00081\u0010:R\u0017\u0010\u000e\u001a\u00020\r8\u0006\u00a2\u0006\u000c\n\u0004\u0008<\u0010=\u001a\u0004\u0008>\u0010?R\u0017\u0010\u000f\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008@\u00106\u001a\u0004\u0008A\u0010&R\u0017\u0010\u0010\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008B\u00106\u001a\u0004\u0008C\u0010&R\u0017\u0010\u0012\u001a\u00020\u00118\u0006\u00a2\u0006\u000c\n\u0004\u00082\u0010D\u001a\u0004\u0008-\u0010ER\u001c\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0000X\u0080\u0004\u00a2\u0006\u000c\n\u0004\u0008A\u0010F\u001a\u0004\u0008*\u0010GR\u0017\u0010\u0016\u001a\u00020\u00158\u0006\u00a2\u0006\u000c\n\u0004\u0008>\u0010H\u001a\u0004\u0008I\u0010JR\u0017\u0010\u0017\u001a\u00020\u00158\u0006\u00a2\u0006\u000c\n\u0004\u00084\u0010H\u001a\u0004\u0008B\u0010JR\u0017\u0010\u0018\u001a\u00020\u00158\u0006\u00a2\u0006\u000c\n\u0004\u0008/\u0010H\u001a\u0004\u0008K\u0010JR\u0017\u0010\u0019\u001a\u00020\u00158\u0006\u00a2\u0006\u000c\n\u0004\u0008,\u0010H\u001a\u0004\u0008L\u0010JR\u0017\u0010\u001a\u001a\u00020\u00158\u0006\u00a2\u0006\u000c\n\u0004\u0008I\u0010H\u001a\u0004\u0008M\u0010JR\u0017\u0010\u001b\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008M\u00106\u001a\u0004\u0008@\u0010&R\u0017\u0010\u001c\u001a\u00020\u00158\u0006\u00a2\u0006\u000c\n\u0004\u0008L\u0010H\u001a\u0004\u00088\u0010JR\u0017\u0010\u001d\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008K\u00106\u001a\u0004\u00085\u0010&R\u0017\u0010\u001e\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008C\u00106\u001a\u0004\u0008;\u0010&R\u0019\u0010 \u001a\u0004\u0018\u00010\u001f8\u0006\u00a2\u0006\u000c\n\u0004\u00087\u0010N\u001a\u0004\u0008<\u0010O\u00a8\u0006P"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/pipsdk/a;",
        "",
        "",
        "mediaUrl",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;",
        "mediaType",
        "fallbackUrl",
        "mediaContentDescription",
        "",
        "widthPercent",
        "",
        "aspectRatioNumerator",
        "aspectRatioDenominator",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;",
        "initialPosition",
        "horizontalEdgeMarginPercent",
        "verticalEdgeMarginPercent",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;",
        "animationConfig",
        "Lcom/clevertap/android/sdk/inapp/CTInAppAction;",
        "action",
        "",
        "showCloseButton",
        "dragEnabled",
        "showPlayPauseButton",
        "showMuteButton",
        "showExpandCollapseButton",
        "cornerRadiusDp",
        "borderEnabled",
        "borderColor",
        "borderWidthDp",
        "Ll/m960;",
        "callbacks",
        "<init>",
        "(Ljava/lang/String;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;Ljava/lang/String;Ljava/lang/String;IDDLcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;IILcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;Lcom/clevertap/android/sdk/inapp/CTInAppAction;ZZZZZIZIILl/m960;)V",
        "toString",
        "()Ljava/lang/String;",
        "hashCode",
        "()I",
        "other",
        "equals",
        "(Ljava/lang/Object;)Z",
        "a",
        "Ljava/lang/String;",
        "p",
        "b",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;",
        "o",
        "()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;",
        "c",
        "k",
        "d",
        "n",
        "e",
        "I",
        "v",
        "f",
        "D",
        "()D",
        "g",
        "h",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;",
        "m",
        "()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;",
        "i",
        "l",
        "j",
        "u",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;",
        "()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;",
        "Lcom/clevertap/android/sdk/inapp/CTInAppAction;",
        "()Lcom/clevertap/android/sdk/inapp/CTInAppAction;",
        "Z",
        "q",
        "()Z",
        "t",
        "s",
        "r",
        "Ll/m960;",
        "()Ll/m960;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private final a:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final c:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final d:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final e:I

.field private final f:D

.field private final g:D

.field private final h:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final i:I

.field private final j:I

.field private final k:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final l:Lcom/clevertap/android/sdk/inapp/CTInAppAction;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final m:Z

.field private final n:Z

.field private final o:Z

.field private final p:Z

.field private final q:Z

.field private final r:I

.field private final s:Z

.field private final t:I

.field private final u:I

.field private final v:Ll/m960;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;Ljava/lang/String;Ljava/lang/String;IDDLcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;IILcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;Lcom/clevertap/android/sdk/inapp/CTInAppAction;ZZZZZIZIILl/m960;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p10    # Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p13    # Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p14    # Lcom/clevertap/android/sdk/inapp/CTInAppAction;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p24    # Ll/m960;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    move/from16 v0, p20

    move/from16 v1, p23

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->a:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 4
    iput-object p3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->c:Ljava/lang/String;

    .line 5
    iput-object p4, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->d:Ljava/lang/String;

    .line 6
    iput p5, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->e:I

    .line 7
    iput-wide p6, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->f:D

    .line 8
    iput-wide p8, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->g:D

    move-object p2, p10

    .line 9
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    move p2, p11

    .line 10
    iput p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->i:I

    move p2, p12

    .line 11
    iput p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->j:I

    move-object p2, p13

    .line 12
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->k:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    move-object/from16 p2, p14

    .line 13
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->l:Lcom/clevertap/android/sdk/inapp/CTInAppAction;

    move/from16 p2, p15

    .line 14
    iput-boolean p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->m:Z

    move/from16 p2, p16

    .line 15
    iput-boolean p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->n:Z

    move/from16 p2, p17

    .line 16
    iput-boolean p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->o:Z

    move/from16 p2, p18

    .line 17
    iput-boolean p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->p:Z

    move/from16 p2, p19

    .line 18
    iput-boolean p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->q:Z

    .line 19
    iput v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->r:I

    move/from16 p2, p21

    .line 20
    iput-boolean p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->s:Z

    move/from16 p2, p22

    .line 21
    iput p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->t:I

    .line 22
    iput v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->u:I

    move-object/from16 p2, p24

    .line 23
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->v:Ll/m960;

    .line 24
    invoke-static {p1}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_5

    const/16 p0, 0xa

    if-gt p0, p5, :cond_4

    const/16 p0, 0x5b

    if-ge p5, p0, :cond_4

    const-wide/16 p0, 0x0

    cmpl-double p2, p6, p0

    if-lez p2, :cond_3

    cmpl-double p0, p8, p0

    if-lez p0, :cond_2

    if-ltz v0, :cond_1

    if-ltz v1, :cond_0

    return-void

    .line 25
    :cond_0
    const-string p0, "borderWidthDp must be >= 0"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    .line 26
    :cond_1
    const-string p0, "cornerRadiusDp must be >= 0"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    .line 27
    :cond_2
    const-string p0, "aspectRatioDenominator must be > 0"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    .line 28
    :cond_3
    const-string p0, "aspectRatioNumerator must be > 0"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    .line 29
    :cond_4
    const-string p0, "widthPercent must be 10\u201390, got "

    invoke-static {p0, p5}, Ll/plk0;->a(Ljava/lang/String;I)V

    const/4 p0, 0x0

    throw p0

    .line 30
    :cond_5
    const-string p0, "mediaUrl must not be blank"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final a()Lcom/clevertap/android/sdk/inapp/CTInAppAction;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->l:Lcom/clevertap/android/sdk/inapp/CTInAppAction;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->k:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->g:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public final d()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->f:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public final e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->a:Ljava/lang/String;

    iget-object v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    iget-object v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->c:Ljava/lang/String;

    iget-object v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->d:Ljava/lang/String;

    iget-object v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->d:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->e:I

    iget v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->e:I

    if-eq v1, v3, :cond_6

    return v2

    :cond_6
    iget-wide v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->f:D

    iget-wide v5, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->f:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_7

    return v2

    :cond_7
    iget-wide v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->g:D

    iget-wide v5, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->g:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_8

    return v2

    :cond_8
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    iget-object v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    if-eq v1, v3, :cond_9

    return v2

    :cond_9
    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->i:I

    iget v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->i:I

    if-eq v1, v3, :cond_a

    return v2

    :cond_a
    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->j:I

    iget v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->j:I

    if-eq v1, v3, :cond_b

    return v2

    :cond_b
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->k:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    iget-object v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->k:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    return v2

    :cond_c
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->l:Lcom/clevertap/android/sdk/inapp/CTInAppAction;

    iget-object v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->l:Lcom/clevertap/android/sdk/inapp/CTInAppAction;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    return v2

    :cond_d
    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->m:Z

    iget-boolean v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->m:Z

    if-eq v1, v3, :cond_e

    return v2

    :cond_e
    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->n:Z

    iget-boolean v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->n:Z

    if-eq v1, v3, :cond_f

    return v2

    :cond_f
    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->o:Z

    iget-boolean v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->o:Z

    if-eq v1, v3, :cond_10

    return v2

    :cond_10
    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->p:Z

    iget-boolean v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->p:Z

    if-eq v1, v3, :cond_11

    return v2

    :cond_11
    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->q:Z

    iget-boolean v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->q:Z

    if-eq v1, v3, :cond_12

    return v2

    :cond_12
    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->r:I

    iget v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->r:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->s:Z

    iget-boolean v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->s:Z

    if-eq v1, v3, :cond_14

    return v2

    :cond_14
    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->t:I

    iget v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->t:I

    if-eq v1, v3, :cond_15

    return v2

    :cond_15
    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->u:I

    iget v3, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->u:I

    if-eq v1, v3, :cond_16

    return v2

    :cond_16
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->v:Ll/m960;

    iget-object p1, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->v:Ll/m960;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    return v2

    :cond_17
    return v0
.end method

.method public final f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public final g()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public final h()Ll/m960;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->v:Ll/m960;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->c:Ljava/lang/String;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->d:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->e:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->f:D

    invoke-static {v3, v4}, Ljava/lang/Double;->hashCode(D)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->g:D

    invoke-static {v3, v4}, Ljava/lang/Double;->hashCode(D)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->i:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->j:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->k:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->l:Lcom/clevertap/android/sdk/inapp/CTInAppAction;

    if-nez v1, :cond_1

    move v1, v2

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inapp/CTInAppAction;->hashCode()I

    move-result v1

    :goto_1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->m:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->n:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->o:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->p:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->q:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->r:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->s:Z

    invoke-static {v1}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->t:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->u:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->v:Ll/m960;

    if-nez p0, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_2
    add-int/2addr v0, v2

    return v0
.end method

.method public final i()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public final j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public final k()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public final m()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final o()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final p()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public final r()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public final s()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public final t()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PIPConfig(mediaUrl="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mediaType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", fallbackUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mediaContentDescription="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", widthPercent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", aspectRatioNumerator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->f:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", aspectRatioDenominator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->g:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", initialPosition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", horizontalEdgeMarginPercent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->i:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", verticalEdgeMarginPercent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->j:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", animationConfig="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->k:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", action="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->l:Lcom/clevertap/android/sdk/inapp/CTInAppAction;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", showCloseButton="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->m:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", dragEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->n:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", showPlayPauseButton="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->o:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", showMuteButton="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->p:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", showExpandCollapseButton="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->q:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", cornerRadiusDp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->r:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", borderEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->s:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", borderColor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->t:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", borderWidthDp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->u:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", callbacks="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->v:Ll/m960;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final u()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public final v()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->e:I

    .line 2
    .line 3
    return p0
.end method
