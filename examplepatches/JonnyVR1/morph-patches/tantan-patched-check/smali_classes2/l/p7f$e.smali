.class public Ll/p7f$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/p7f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p7f$e;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Ll/p7f$e;->a:I

    .line 7
    .line 8
    iput p3, p0, Ll/p7f$e;->c:I

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    iput p1, p0, Ll/p7f$e;->d:I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;III)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Ll/p7f$e;->b:Ljava/lang/String;

    .line 16
    iput p2, p0, Ll/p7f$e;->a:I

    .line 17
    iput p3, p0, Ll/p7f$e;->c:I

    .line 18
    iput p4, p0, Ll/p7f$e;->d:I

    return-void
.end method


# virtual methods
.method public a(I)Z
    .locals 3

    .line 1
    iget v0, p0, Ll/p7f$e;->c:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x7

    .line 5
    if-eq v0, v2, :cond_8

    .line 6
    .line 7
    if-ne p1, v2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-eq v0, p1, :cond_8

    .line 11
    .line 12
    iget p0, p0, Ll/p7f$e;->d:I

    .line 13
    .line 14
    if-ne p0, p1, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const/4 v2, 0x4

    .line 18
    if-eq v0, v2, :cond_2

    .line 19
    .line 20
    if-ne p0, v2, :cond_3

    .line 21
    .line 22
    :cond_2
    const/4 v2, 0x3

    .line 23
    if-ne p1, v2, :cond_3

    .line 24
    .line 25
    return v1

    .line 26
    :cond_3
    const/16 v2, 0x9

    .line 27
    .line 28
    if-eq v0, v2, :cond_4

    .line 29
    .line 30
    if-ne p0, v2, :cond_5

    .line 31
    .line 32
    :cond_4
    const/16 v2, 0x8

    .line 33
    .line 34
    if-ne p1, v2, :cond_5

    .line 35
    .line 36
    return v1

    .line 37
    :cond_5
    const/16 v2, 0xc

    .line 38
    .line 39
    if-eq v0, v2, :cond_6

    .line 40
    .line 41
    if-ne p0, v2, :cond_7

    .line 42
    .line 43
    :cond_6
    const/16 p0, 0xb

    .line 44
    .line 45
    if-ne p1, p0, :cond_7

    .line 46
    .line 47
    return v1

    .line 48
    :cond_7
    const/4 p0, 0x0

    .line 49
    return p0

    .line 50
    :cond_8
    :goto_0
    return v1
.end method
