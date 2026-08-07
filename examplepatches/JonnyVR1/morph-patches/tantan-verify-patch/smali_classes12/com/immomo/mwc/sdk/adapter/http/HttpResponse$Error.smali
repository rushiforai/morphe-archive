.class public Lcom/immomo/mwc/sdk/adapter/http/HttpResponse$Error;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mwc/sdk/adapter/http/HttpResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Error"
.end annotation


# instance fields
.field public code:I

.field public msg:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/immomo/mwc/sdk/adapter/http/HttpResponse$Error;->code:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/immomo/mwc/sdk/adapter/http/HttpResponse$Error;->msg:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method
