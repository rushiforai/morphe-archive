.class public Ll/as60$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/as60;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/as60$a;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/as60$a;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/as60$a;->c:I

    .line 9
    .line 10
    return-void
.end method

.method public synthetic constructor <init>(IIILl/bs60;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3}, Ll/as60$a;-><init>(III)V

    return-void
.end method
