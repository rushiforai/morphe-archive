.class public Lcom/vivo/push/ups/CodeResult;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field returnCode:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/vivo/push/ups/CodeResult;->returnCode:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getReturnCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/vivo/push/ups/CodeResult;->returnCode:I

    .line 2
    .line 3
    return p0
.end method
