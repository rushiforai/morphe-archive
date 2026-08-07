.class public Lcom/appsflyer/AFVersionDeclaration;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static googleSdkIdentifier:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static init()V
    .locals 1

    .line 1
    const-string v0, "!SDK-VERSION-STRING!:com.appsflyer:af-android-sdk:6.15.0"

    .line 2
    .line 3
    sput-object v0, Lcom/appsflyer/AFVersionDeclaration;->googleSdkIdentifier:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method
