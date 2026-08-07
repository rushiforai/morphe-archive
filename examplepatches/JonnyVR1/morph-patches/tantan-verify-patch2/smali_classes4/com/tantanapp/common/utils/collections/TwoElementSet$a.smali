.class public Lcom/tantanapp/common/utils/collections/TwoElementSet$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/utils/collections/TwoElementSet;->iterator()Ljava/util/Iterator;
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

.field public final synthetic b:Lcom/tantanapp/common/utils/collections/TwoElementSet;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/utils/collections/TwoElementSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/utils/collections/TwoElementSet$a;->b:Lcom/tantanapp/common/utils/collections/TwoElementSet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/tantanapp/common/utils/collections/TwoElementSet$a;->a:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/tantanapp/common/utils/collections/TwoElementSet$a;->a:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-gt p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public next()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/tantanapp/common/utils/collections/TwoElementSet$a;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, Lcom/tantanapp/common/utils/collections/TwoElementSet$a;->a:I

    .line 7
    .line 8
    iget-object p0, p0, Lcom/tantanapp/common/utils/collections/TwoElementSet$a;->b:Lcom/tantanapp/common/utils/collections/TwoElementSet;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tantanapp/common/utils/collections/TwoElementSet;->element1:Ljava/lang/Object;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    iput v0, p0, Lcom/tantanapp/common/utils/collections/TwoElementSet$a;->a:I

    .line 17
    .line 18
    iget-object p0, p0, Lcom/tantanapp/common/utils/collections/TwoElementSet$a;->b:Lcom/tantanapp/common/utils/collections/TwoElementSet;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tantanapp/common/utils/collections/TwoElementSet;->element2:Ljava/lang/Object;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    invoke-static {}, Ll/mor;->a()V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
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
