.class Lcom/google/common/base/Converter$1;
.super Ljava/lang/Object;
.source "Converter.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/base/Converter;->convertAll(Ljava/lang/Iterable;)Ljava/lang/Iterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "TB;>;"
    }
.end annotation


# instance fields
.field final fromIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "+TA;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/common/base/Converter;

.field final synthetic val$fromIterable:Ljava/lang/Iterable;


# direct methods
.method constructor <init>(Lcom/google/common/base/Converter;Ljava/lang/Iterable;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$fromIterable"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 276
    iput-object p2, p0, Lcom/google/common/base/Converter$1;->val$fromIterable:Ljava/lang/Iterable;

    iput-object p1, p0, Lcom/google/common/base/Converter$1;->this$0:Lcom/google/common/base/Converter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 277
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/base/Converter$1;->fromIterator:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 1

    .line 281
    iget-object p0, p0, Lcom/google/common/base/Converter$1;->fromIterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    return p0
.end method

.method public next()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TB;"
        }
    .end annotation

    .line 286
    iget-object v0, p0, Lcom/google/common/base/Converter$1;->this$0:Lcom/google/common/base/Converter;

    iget-object p0, p0, Lcom/google/common/base/Converter$1;->fromIterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/common/base/Converter;->convert(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public remove()V
    .registers 1

    .line 291
    iget-object p0, p0, Lcom/google/common/base/Converter$1;->fromIterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    return-void
.end method
