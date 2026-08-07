.class public Lcom/tantanapp/common/network/NetIgnoredException;
.super Ljava/lang/Exception;
.source "SourceFile"


# instance fields
.field private e:Ljava/lang/Exception;


# direct methods
.method public constructor <init>(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/common/network/NetIgnoredException;->e:Ljava/lang/Exception;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOriginException()Ljava/lang/Exception;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetIgnoredException;->e:Ljava/lang/Exception;

    .line 2
    .line 3
    return-object p0
.end method
