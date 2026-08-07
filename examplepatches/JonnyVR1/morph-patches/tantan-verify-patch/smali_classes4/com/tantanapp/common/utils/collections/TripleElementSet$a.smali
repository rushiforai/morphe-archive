.class public Lcom/tantanapp/common/utils/collections/TripleElementSet$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/utils/collections/TripleElementSet;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "TE;>;"
    }
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:Lcom/tantanapp/common/utils/collections/TripleElementSet;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/utils/collections/TripleElementSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet$a;->b:Lcom/tantanapp/common/utils/collections/TripleElementSet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet$a;->a:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet$a;->a:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-gt p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public next()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet$a;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet$a;->a:I

    .line 7
    .line 8
    iget-object p0, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet$a;->b:Lcom/tantanapp/common/utils/collections/TripleElementSet;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet;->element1:Ljava/lang/Object;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 v2, 0x2

    .line 14
    if-ne v0, v1, :cond_1

    .line 15
    .line 16
    iput v2, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet$a;->a:I

    .line 17
    .line 18
    iget-object p0, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet$a;->b:Lcom/tantanapp/common/utils/collections/TripleElementSet;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet;->element2:Ljava/lang/Object;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    if-ne v0, v2, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    iput v0, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet$a;->a:I

    .line 27
    .line 28
    iget-object p0, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet$a;->b:Lcom/tantanapp/common/utils/collections/TripleElementSet;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/tantanapp/common/utils/collections/TripleElementSet;->element3:Ljava/lang/Object;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_2
    invoke-static {}, Ll/mor;->a()V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method public remove()V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method
