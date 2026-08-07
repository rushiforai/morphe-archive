.class public Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight$Data;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Data"
.end annotation


# instance fields
.field public lightData:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "LightData"
    .end annotation
.end field

.field public final synthetic this$0:Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight$Data;->this$0:Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getLightData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight$Data;->lightData:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setLightData(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight$Data;->lightData:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
