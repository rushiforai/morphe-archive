.class Lcom/alibaba/fastjson/JSONValidator$UTF8Validator;
.super Lcom/alibaba/fastjson/JSONValidator;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/fastjson/JSONValidator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UTF8Validator"
.end annotation


# instance fields
.field private final bytes:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSONValidator;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONValidator$UTF8Validator;->bytes:[B

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator$UTF8Validator;->next()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->skipWhiteSpace()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public next()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/JSONValidator;->pos:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Lcom/alibaba/fastjson/JSONValidator;->pos:I

    .line 6
    .line 7
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONValidator$UTF8Validator;->bytes:[B

    .line 8
    .line 9
    array-length v3, v2

    .line 10
    if-lt v0, v3, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 14
    .line 15
    iput-boolean v1, p0, Lcom/alibaba/fastjson/JSONValidator;->eof:Z

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    aget-byte v0, v2, v0

    .line 19
    .line 20
    int-to-char v0, v0

    .line 21
    iput-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 22
    .line 23
    return-void
.end method
