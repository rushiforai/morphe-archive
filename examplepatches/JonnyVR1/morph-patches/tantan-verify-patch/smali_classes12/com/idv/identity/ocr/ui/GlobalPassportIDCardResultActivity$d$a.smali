.class Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;->c(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d$a;->c:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;

    .line 2
    .line 3
    iput p2, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d$a;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d$a;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d$a;->c:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;->c:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->X1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d$a;->a:I

    .line 10
    .line 11
    iget v2, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d$a;->b:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d$a;->c:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;

    .line 14
    .line 15
    if-ne v1, v2, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;->c:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;->b:[B

    .line 21
    .line 22
    invoke-virtual {v1, v0, v2, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->s1(Ljava/util/Map;Z[B)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;->c:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$d;->b:[B

    .line 30
    .line 31
    invoke-virtual {v1, v0, v2, p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->s1(Ljava/util/Map;Z[B)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
