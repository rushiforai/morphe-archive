.class Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse$1;
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse$1;->newInstance()Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;

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
    const-string p0, "data"

    .line 5
    .line 6
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 p5, 0x1

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    const-string p0, "meta"

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
    return p5

    .line 24
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;->a()Lcom/tantanapp/common/data/JsonAdapter;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;

    .line 33
    .line 34
    iget p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;->code:I

    .line 35
    .line 36
    iput p2, p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;->code:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;->action:Ljava/lang/String;

    .line 39
    .line 40
    iput-object p0, p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;->action:Ljava/lang/String;

    .line 41
    .line 42
    return p5
.end method

.method public bridge synthetic parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 43
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse$1;->parseField(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse$1;->serializeFields(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
