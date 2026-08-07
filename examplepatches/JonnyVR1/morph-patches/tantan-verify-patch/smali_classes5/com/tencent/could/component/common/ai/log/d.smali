.class public Lcom/tencent/could/component/common/ai/log/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:J

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/tencent/could/component/common/ai/log/d;->a:I

    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iput-wide v0, p0, Lcom/tencent/could/component/common/ai/log/d;->b:J

    .line 11
    .line 12
    iput-object p2, p0, Lcom/tencent/could/component/common/ai/log/d;->c:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/tencent/could/component/common/ai/log/d;->d:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method
