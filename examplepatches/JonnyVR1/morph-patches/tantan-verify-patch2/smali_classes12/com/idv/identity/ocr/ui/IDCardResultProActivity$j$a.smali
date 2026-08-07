.class Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j;->b(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j$a;->b:Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "200"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j$a;->b:Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j;->b:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->Y0()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j$a;->b:Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$j;->b:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->C1()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
