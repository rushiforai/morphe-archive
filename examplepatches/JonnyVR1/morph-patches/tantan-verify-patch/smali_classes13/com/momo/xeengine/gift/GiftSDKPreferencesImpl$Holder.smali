.class Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl$Holder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Holder"
.end annotation


# static fields
.field static instance:Lcom/momo/xeengine/gift/GiftSDKPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl;-><init>(Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl$1;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl$Holder;->instance:Lcom/momo/xeengine/gift/GiftSDKPreferences;

    .line 8
    .line 9
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
