.class public abstract Lcom/appsflyer/internal/AFh1hSDK;
.super Lcom/appsflyer/internal/AFh1jSDK;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, v0, v0}, Lcom/appsflyer/internal/AFh1hSDK;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Boolean;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0, p2}, Lcom/appsflyer/internal/AFh1jSDK;-><init>(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final areAllFieldsValid()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final component1()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final component2()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
