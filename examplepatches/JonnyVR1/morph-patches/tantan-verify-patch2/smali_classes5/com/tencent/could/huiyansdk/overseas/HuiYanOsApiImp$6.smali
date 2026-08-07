.class public synthetic Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$6;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1009
    name = null
.end annotation


# static fields
.field public static final synthetic $SwitchMap$com$tencent$could$huiyansdk$enums$FaceAngleValidation:[I


# direct methods
.method public static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;->values()[Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v0, v0

    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    sput-object v0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$6;->$SwitchMap$com$tencent$could$huiyansdk$enums$FaceAngleValidation:[I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    :try_start_0
    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    :catch_0
    const/4 v0, 0x2

    .line 15
    :try_start_1
    sget-object v1, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$6;->$SwitchMap$com$tencent$could$huiyansdk$enums$FaceAngleValidation:[I

    .line 16
    .line 17
    sget-object v3, Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;->LevelLoose:Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;

    .line 18
    .line 19
    aput v0, v1, v2
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    .line 20
    .line 21
    :catch_1
    :try_start_2
    sget-object v1, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$6;->$SwitchMap$com$tencent$could$huiyansdk$enums$FaceAngleValidation:[I

    .line 22
    .line 23
    sget-object v2, Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;->LevelLoose:Lcom/tencent/could/huiyansdk/enums/FaceAngleValidation;

    .line 24
    .line 25
    const/4 v2, 0x3

    .line 26
    aput v2, v1, v0
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 27
    .line 28
    :catch_2
    return-void
.end method
