.class public LSudthrow/Sudfor;
.super Ljava/lang/Exception;
.source "SourceFile"


# instance fields
.field public final Suddo:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 12
    iput p1, p0, LSudthrow/Sudfor;->Suddo:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 9
    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 10
    iput p1, p0, LSudthrow/Sudfor;->Suddo:I

    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/CharacterCodingException;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x3ef

    .line 5
    .line 6
    iput p1, p0, LSudthrow/Sudfor;->Suddo:I

    .line 7
    .line 8
    return-void
.end method
