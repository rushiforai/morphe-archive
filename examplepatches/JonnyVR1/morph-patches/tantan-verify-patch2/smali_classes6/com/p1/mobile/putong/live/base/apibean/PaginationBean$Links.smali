.class public Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Links"
.end annotation


# instance fields
.field private next:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "next"
    .end annotation
.end field

.field private previous:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "previous"
    .end annotation
.end field


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

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->next:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->previous:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->next:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->previous:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getNext()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->next:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPrevious()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->previous:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setNext(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->next:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPrevious(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->previous:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
