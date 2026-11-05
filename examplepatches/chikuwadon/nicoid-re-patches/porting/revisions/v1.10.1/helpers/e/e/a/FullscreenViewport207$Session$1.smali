.class Le/e/a/FullscreenViewport207$Session$1;
.super Ljava/lang/Object;
.source "FullscreenViewport207.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/FullscreenViewport207$Session;->restoreParents()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Le/e/a/FullscreenViewport207$Moved;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/FullscreenViewport207$Session;


# direct methods
.method constructor <init>(Le/e/a/FullscreenViewport207$Session;)V
    .registers 2

    .line 163
    iput-object p1, p0, Le/e/a/FullscreenViewport207$Session$1;->this$1:Le/e/a/FullscreenViewport207$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Le/e/a/FullscreenViewport207$Moved;Le/e/a/FullscreenViewport207$Moved;)I
    .registers 3

    .line 163
    iget p1, p1, Le/e/a/FullscreenViewport207$Moved;->index:I

    iget p2, p2, Le/e/a/FullscreenViewport207$Moved;->index:I

    sub-int/2addr p1, p2

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 1
    check-cast p1, Le/e/a/FullscreenViewport207$Moved;

    check-cast p2, Le/e/a/FullscreenViewport207$Moved;

    invoke-virtual {p0, p1, p2}, Le/e/a/FullscreenViewport207$Session$1;->compare(Le/e/a/FullscreenViewport207$Moved;Le/e/a/FullscreenViewport207$Moved;)I

    move-result p1

    return p1
.end method
