.class public final LSudchar/Sudfor;
.super Ljava/io/IOException;
.source "SourceFile"


# static fields
.field public static final Suddo:LSudchar/Sudfor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LSudchar/Sudfor;

    .line 2
    .line 3
    invoke-direct {v0}, LSudchar/Sudfor;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LSudchar/Sudfor;->Suddo:LSudchar/Sudfor;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "Interrupted"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final printStackTrace()V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/IllegalAccessError;

    .line 2
    .line 3
    const-string v0, "Stack is ignored for signal"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method
