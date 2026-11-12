.class public final enum Lcom/leanplum/internal/ResourceQualifiers$Qualifier;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/internal/ResourceQualifiers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Qualifier"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/leanplum/internal/ResourceQualifiers$Qualifier;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum AVAILABLE_HEIGHT:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum AVAILABLE_WIDTH:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum KEYBOARD_AVAILABILITY:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum LANGUAGE:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum LAYOUT_DIRECTION:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum MCC:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum MNC:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum NAVIGATION_KEY_AVAILABILITY:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum NIGHT_MODE:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum PLATFORM_VERSION:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum PRIMARY_NON_TOUCH_NAVIGATION_METHOD:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum PRIMARY_TEXT_INPUTMETHOD:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum REGION:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum SCREEN_ASPECT:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum SCREEN_ORIENTATION:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum SCREEN_PIXEL_DENSITY:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum SCREEN_SIZE:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum SMALLEST_WIDTH:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum TOUCHSCREEN_TYPE:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

.field public static final enum UI_MODE:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;


# instance fields
.field private filter:Lcom/leanplum/internal/ResourceQualifiers$QualifierFilter;


# direct methods
.method static constructor <clinit>()V
    .registers 23

    new-instance v1, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$1;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$1;-><init>()V

    const-string v2, "MCC"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v1, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->MCC:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v2, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$2;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$2;-><init>()V

    const-string v3, "MNC"

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v2, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->MNC:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v3, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$3;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$3;-><init>()V

    const-string v4, "LANGUAGE"

    const/4 v5, 0x2

    invoke-direct {v3, v4, v5, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v3, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->LANGUAGE:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v4, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$4;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$4;-><init>()V

    const-string v5, "REGION"

    const/4 v6, 0x3

    invoke-direct {v4, v5, v6, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v4, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->REGION:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v5, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$5;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$5;-><init>()V

    const-string v6, "LAYOUT_DIRECTION"

    const/4 v7, 0x4

    invoke-direct {v5, v6, v7, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v5, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->LAYOUT_DIRECTION:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v6, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$6;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$6;-><init>()V

    const-string v7, "SMALLEST_WIDTH"

    const/4 v8, 0x5

    invoke-direct {v6, v7, v8, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v6, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->SMALLEST_WIDTH:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v7, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$7;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$7;-><init>()V

    const-string v8, "AVAILABLE_WIDTH"

    const/4 v9, 0x6

    invoke-direct {v7, v8, v9, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v7, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->AVAILABLE_WIDTH:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v8, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$8;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$8;-><init>()V

    const-string v9, "AVAILABLE_HEIGHT"

    const/4 v10, 0x7

    invoke-direct {v8, v9, v10, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v8, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->AVAILABLE_HEIGHT:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v9, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$9;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$9;-><init>()V

    const-string v10, "SCREEN_SIZE"

    const/16 v11, 0x8

    invoke-direct {v9, v10, v11, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v9, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->SCREEN_SIZE:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v10, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$10;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$10;-><init>()V

    const-string v11, "SCREEN_ASPECT"

    const/16 v12, 0x9

    invoke-direct {v10, v11, v12, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v10, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->SCREEN_ASPECT:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v11, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$11;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$11;-><init>()V

    const-string v12, "SCREEN_ORIENTATION"

    const/16 v13, 0xa

    invoke-direct {v11, v12, v13, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v11, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->SCREEN_ORIENTATION:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v12, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$12;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$12;-><init>()V

    const-string v13, "UI_MODE"

    const/16 v14, 0xb

    invoke-direct {v12, v13, v14, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v12, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->UI_MODE:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v13, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$13;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$13;-><init>()V

    const-string v14, "NIGHT_MODE"

    const/16 v15, 0xc

    invoke-direct {v13, v14, v15, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v13, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->NIGHT_MODE:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v14, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$14;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$14;-><init>()V

    const-string v15, "SCREEN_PIXEL_DENSITY"

    move-object/from16 v16, v1

    const/16 v1, 0xd

    invoke-direct {v14, v15, v1, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v14, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->SCREEN_PIXEL_DENSITY:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v15, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$15;

    invoke-direct {v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$15;-><init>()V

    const-string v1, "TOUCHSCREEN_TYPE"

    move-object/from16 v17, v2

    const/16 v2, 0xe

    invoke-direct {v15, v1, v2, v0}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v15, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->TOUCHSCREEN_TYPE:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v1, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$16;

    invoke-direct {v1}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$16;-><init>()V

    const-string v2, "KEYBOARD_AVAILABILITY"

    move-object/from16 v18, v3

    const/16 v3, 0xf

    invoke-direct {v0, v2, v3, v1}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->KEYBOARD_AVAILABILITY:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v1, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v2, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$17;

    invoke-direct {v2}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$17;-><init>()V

    const-string v3, "PRIMARY_TEXT_INPUTMETHOD"

    move-object/from16 v19, v0

    const/16 v0, 0x10

    invoke-direct {v1, v3, v0, v2}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v1, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->PRIMARY_TEXT_INPUTMETHOD:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v2, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$18;

    invoke-direct {v2}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$18;-><init>()V

    const-string v3, "NAVIGATION_KEY_AVAILABILITY"

    move-object/from16 v20, v1

    const/16 v1, 0x11

    invoke-direct {v0, v3, v1, v2}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->NAVIGATION_KEY_AVAILABILITY:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v1, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v2, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$19;

    invoke-direct {v2}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$19;-><init>()V

    const-string v3, "PRIMARY_NON_TOUCH_NAVIGATION_METHOD"

    move-object/from16 v21, v0

    const/16 v0, 0x12

    invoke-direct {v1, v3, v0, v2}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v1, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->PRIMARY_NON_TOUCH_NAVIGATION_METHOD:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    new-instance v2, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$20;

    invoke-direct {v2}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier$20;-><init>()V

    const-string v3, "PLATFORM_VERSION"

    move-object/from16 v22, v1

    const/16 v1, 0x13

    invoke-direct {v0, v3, v1, v2}, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;-><init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V

    sput-object v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->PLATFORM_VERSION:Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    move-object/from16 v3, v18

    move-object/from16 v16, v19

    move-object/from16 v17, v20

    move-object/from16 v18, v21

    move-object/from16 v19, v22

    move-object/from16 v20, v0

    filled-new-array/range {v1 .. v20}, [Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    move-result-object v0

    sput-object v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->$VALUES:[Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/leanplum/internal/ResourceQualifiers$QualifierFilter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/internal/ResourceQualifiers$QualifierFilter;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->filter:Lcom/leanplum/internal/ResourceQualifiers$QualifierFilter;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/leanplum/internal/ResourceQualifiers$Qualifier;
    .registers 2

    const-class v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    return-object p0
.end method

.method public static values()[Lcom/leanplum/internal/ResourceQualifiers$Qualifier;
    .registers 1

    sget-object v0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->$VALUES:[Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    invoke-virtual {v0}, [Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/leanplum/internal/ResourceQualifiers$Qualifier;

    return-object v0
.end method


# virtual methods
.method public getFilter()Lcom/leanplum/internal/ResourceQualifiers$QualifierFilter;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/ResourceQualifiers$Qualifier;->filter:Lcom/leanplum/internal/ResourceQualifiers$QualifierFilter;

    return-object p0
.end method
