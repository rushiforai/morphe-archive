.class public final Ll/igj0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/igj0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Ll/igj0$b;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/x20;

.field public final b:Ljava/lang/Long;

.field public final c:I


# direct methods
.method public constructor <init>(Ll/x20;Ljava/lang/Long;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/igj0$b;->a:Ll/x20;

    .line 5
    .line 6
    iput-object p2, p0, Ll/igj0$b;->b:Ljava/lang/Long;

    .line 7
    .line 8
    iput p3, p0, Ll/igj0$b;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/igj0$b;)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/igj0$b;->b:Ljava/lang/Long;

    .line 2
    .line 3
    iget-object v1, p1, Ll/igj0$b;->b:Ljava/lang/Long;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget p0, p0, Ll/igj0$b;->c:I

    .line 12
    .line 13
    iget p1, p1, Ll/igj0$b;->c:I

    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/igj0;->a(II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/igj0$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/igj0$b;->a(Ll/igj0$b;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
