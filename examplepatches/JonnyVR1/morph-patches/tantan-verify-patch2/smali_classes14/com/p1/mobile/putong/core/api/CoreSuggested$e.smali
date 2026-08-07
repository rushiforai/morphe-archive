.class public Lcom/p1/mobile/putong/core/api/CoreSuggested$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/CoreSuggested;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/p1/mobile/putong/core/api/CoreSuggested$e;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$e;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$e;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/api/CoreSuggested$e;)I
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$e;->b:I

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$e;->b:I

    .line 4
    .line 5
    sub-int/2addr p1, p0

    .line 6
    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$e;->a(Lcom/p1/mobile/putong/core/api/CoreSuggested$e;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
