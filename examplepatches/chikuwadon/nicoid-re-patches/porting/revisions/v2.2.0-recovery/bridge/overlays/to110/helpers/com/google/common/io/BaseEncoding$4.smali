.class Lcom/google/common/io/BaseEncoding$4;
.super Ljava/lang/Object;
.source "BaseEncoding.java"

# interfaces
.implements Ljava/lang/Appendable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/io/BaseEncoding;->separatingAppendable(Ljava/lang/Appendable;Ljava/lang/String;I)Ljava/lang/Appendable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field charsUntilSeparator:I

.field final synthetic val$afterEveryChars:I

.field final synthetic val$delegate:Ljava/lang/Appendable;

.field final synthetic val$separator:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/Appendable;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            "val$afterEveryChars",
            "val$delegate",
            "val$separator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1126
    iput p1, p0, Lcom/google/common/io/BaseEncoding$4;->val$afterEveryChars:I

    iput-object p2, p0, Lcom/google/common/io/BaseEncoding$4;->val$delegate:Ljava/lang/Appendable;

    iput-object p3, p0, Lcom/google/common/io/BaseEncoding$4;->val$separator:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1127
    iput p1, p0, Lcom/google/common/io/BaseEncoding$4;->charsUntilSeparator:I

    return-void
.end method


# virtual methods
.method public append(C)Ljava/lang/Appendable;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1131
    iget v0, p0, Lcom/google/common/io/BaseEncoding$4;->charsUntilSeparator:I

    if-nez v0, :cond_0

    .line 1132
    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$4;->val$delegate:Ljava/lang/Appendable;

    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$4;->val$separator:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 1133
    iget v0, p0, Lcom/google/common/io/BaseEncoding$4;->val$afterEveryChars:I

    iput v0, p0, Lcom/google/common/io/BaseEncoding$4;->charsUntilSeparator:I

    .line 1135
    :cond_0
    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$4;->val$delegate:Ljava/lang/Appendable;

    invoke-interface {v0, p1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 1136
    iget p1, p0, Lcom/google/common/io/BaseEncoding$4;->charsUntilSeparator:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/common/io/BaseEncoding$4;->charsUntilSeparator:I

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "chars"
        }
    .end annotation

    .line 1147
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "chars",
            "off",
            "len"
        }
    .end annotation

    .line 1142
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method
