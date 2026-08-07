.class public final Ll/xpe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/InputFilter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xpe$a;
    }
.end annotation


# instance fields
.field public final a:I

.field public b:Ll/xpe$a;


# direct methods
.method public constructor <init>(ILl/xpe$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/xpe;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/xpe;->b:Ll/xpe$a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget v0, p0, Ll/xpe;->a:I

    .line 2
    .line 3
    invoke-interface {p4}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    sub-int/2addr p6, p5

    .line 8
    sub-int/2addr p4, p6

    .line 9
    sub-int/2addr v0, p4

    .line 10
    const-string p4, ""

    .line 11
    .line 12
    if-gtz v0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Ll/xpe;->b:Ll/xpe$a;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ll/xpe$a;->a()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-object p4

    .line 22
    :cond_1
    sub-int/2addr p3, p2

    .line 23
    if-lt v0, p3, :cond_2

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0

    .line 27
    :cond_2
    iget-object p0, p0, Ll/xpe;->b:Ll/xpe$a;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    invoke-interface {p0}, Ll/xpe$a;->a()V

    .line 32
    .line 33
    .line 34
    :cond_3
    add-int/2addr v0, p2

    .line 35
    add-int/lit8 p0, v0, -0x1

    .line 36
    .line 37
    invoke-interface {p1, p0}, Ljava/lang/CharSequence;->charAt(I)C

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-static {p0}, Ljava/lang/Character;->isHighSurrogate(C)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_4

    .line 46
    .line 47
    add-int/lit8 v0, v0, -0x1

    .line 48
    .line 49
    if-ne v0, p2, :cond_4

    .line 50
    .line 51
    return-object p4

    .line 52
    :cond_4
    invoke-interface {p1, p2, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method
