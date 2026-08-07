.class public final Ll/ja5$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ja5$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Ll/ja5$b$a;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/ja5$b$a;->a:J

    .line 5
    .line 6
    iput-object p3, p0, Ll/ja5$b$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/ja5$b$a;)I
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-wide v1, p0, Ll/ja5$b$a;->a:J

    .line 6
    .line 7
    iget-wide p0, p1, Ll/ja5$b$a;->a:J

    .line 8
    .line 9
    cmp-long v3, v1, p0

    .line 10
    .line 11
    if-lez v3, :cond_1

    .line 12
    .line 13
    return v0

    .line 14
    :cond_1
    cmp-long p0, v1, p0

    .line 15
    .line 16
    if-gez p0, :cond_2

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_2
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/ja5$b$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ja5$b$a;->a(Ll/ja5$b$a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
