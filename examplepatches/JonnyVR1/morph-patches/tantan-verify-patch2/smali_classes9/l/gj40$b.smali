.class public Ll/gj40$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/gj40;->K(Ljava/util/List;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/p1/mobile/putong/core/data/UserTagData;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/gj40;


# direct methods
.method public constructor <init>(Ll/gj40;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gj40$b;->a:Ll/gj40;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/UserTagData;Lcom/p1/mobile/putong/core/data/UserTagData;)I
    .locals 0

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->index:I

    .line 2
    .line 3
    iget p1, p2, Lcom/p1/mobile/putong/core/data/UserTagData;->index:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserTagData;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/UserTagData;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/gj40$b;->a(Lcom/p1/mobile/putong/core/data/UserTagData;Lcom/p1/mobile/putong/core/data/UserTagData;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
