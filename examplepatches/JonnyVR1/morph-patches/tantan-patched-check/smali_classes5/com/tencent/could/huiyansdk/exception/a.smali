.class public Lcom/tencent/could/huiyansdk/exception/a;
.super Ljava/lang/Exception;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 10
    invoke-direct {p0, p2}, Lcom/tencent/could/huiyansdk/exception/a;-><init>(Ljava/lang/String;)V

    .line 11
    iput p1, p0, Lcom/tencent/could/huiyansdk/exception/a;->a:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/tencent/could/huiyansdk/exception/a;->a:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/exception/a;->b:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method
