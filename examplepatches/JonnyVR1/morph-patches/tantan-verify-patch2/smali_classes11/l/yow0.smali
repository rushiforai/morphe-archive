.class public final Ll/yow0;
.super Ll/bpw0;
.source "SourceFile"


# instance fields
.field public final synthetic g:Ll/zow0;


# direct methods
.method public constructor <init>(Ll/zow0;Ll/dpw0;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yow0;->g:Ll/zow0;

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
    return p1
.end method

.method public final c(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bpw0;->c:Ljava/lang/CharSequence;

    .line 2
    .line 3
    add-int/lit16 p1, p1, 0xfa0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ge p1, p0, :cond_0

    .line 10
    .line 11
    return p1

    .line 12
    :cond_0
    const/4 p0, -0x1

    .line 13
    return p0
.end method
