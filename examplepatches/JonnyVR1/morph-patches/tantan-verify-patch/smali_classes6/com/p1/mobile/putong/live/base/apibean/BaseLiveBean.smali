.class public Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private code:I

.field private data:Ljava/lang/String;

.field private msg:Ljava/lang/String;

.field private pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static hasNextPage(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;)Z
    .locals 0

    if-eqz p0, :cond_0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->getProcessedNext()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->code:I

    .line 2
    .line 3
    return p0
.end method

.method public getData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->data:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMsg()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->msg:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNextPageUntil()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->getProcessedNext()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 2
    .line 3
    return-object p0
.end method

.method public hasNextPage()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->getProcessedNext()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public setCode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->code:I

    .line 2
    .line 3
    return-void
.end method

.method public setData(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->data:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMsg(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->msg:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPagination(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 2
    .line 3
    return-void
.end method
