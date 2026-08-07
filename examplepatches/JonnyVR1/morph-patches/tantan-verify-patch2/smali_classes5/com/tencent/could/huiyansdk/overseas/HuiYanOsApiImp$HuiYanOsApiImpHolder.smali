.class public final Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$HuiYanOsApiImpHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "HuiYanOsApiImpHolder"
.end annotation


# static fields
.field public static final INSTANCE:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$HuiYanOsApiImpHolder;->INSTANCE:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$HuiYanOsApiImpHolder;->INSTANCE:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    return-object v0
.end method
