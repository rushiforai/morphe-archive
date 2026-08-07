.class Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public newInstance()Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;-><init>(Ll/zhi;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse$2;->newInstance()Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string p0, "action"

    .line 5
    .line 6
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 p4, 0x1

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    const-string p0, "code"

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    iput p0, p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;->code:I

    .line 28
    .line 29
    return p4

    .line 30
    :cond_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iput-object p0, p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;->action:Ljava/lang/String;

    .line 35
    .line 36
    return p4
.end method

.method public bridge synthetic parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse$2;->parseField(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0

    .line 7
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse$2;->serializeFields(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
