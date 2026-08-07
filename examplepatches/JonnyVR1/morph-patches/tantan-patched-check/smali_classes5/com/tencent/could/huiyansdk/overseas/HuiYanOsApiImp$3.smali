.class public Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/api/c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->startHuiYanAuth(Ljava/lang/String;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$3;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getCurrentToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$3;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$200(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getWaitingAnimation()Landroid/graphics/drawable/AnimationDrawable;
    .locals 0

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/utils/d;->a(Landroid/content/res/Resources;)Landroid/graphics/drawable/AnimationDrawable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
