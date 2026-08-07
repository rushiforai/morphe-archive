.class public final Ll/wow0;
.super Ll/bpw0;
.source "SourceFile"


# instance fields
.field public final synthetic g:Ll/xow0;


# direct methods
.method public constructor <init>(Ll/xow0;Ll/dpw0;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wow0;->g:Ll/xow0;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Ll/bpw0;-><init>(Ll/dpw0;Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(I)I
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    return p1
.end method

.method public final c(I)I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bpw0;->c:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, "index"

    .line 8
    .line 9
    invoke-static {p1, v1, v2}, Ll/tow0;->b(IILjava/lang/String;)I

    .line 10
    .line 11
    .line 12
    :goto_0
    if-ge p1, v1, :cond_1

    .line 13
    .line 14
    iget-object v2, p0, Ll/wow0;->g:Ll/xow0;

    .line 15
    .line 16
    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    iget-object v2, v2, Ll/xow0;->a:Ll/bow0;

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Ll/bow0;->a(C)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    return p1

    .line 29
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 p0, -0x1

    .line 33
    return p0
.end method
