.class public final LSudchar/Sudif;
.super Ljava/io/IOException;
.source "SourceFile"


# static fields
.field public static final Suddo:LSudchar/Sudif;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LSudchar/Sudif;

    .line 2
    .line 3
    invoke-direct {v0}, LSudchar/Sudif;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LSudchar/Sudif;->Suddo:LSudchar/Sudif;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "File busy after run"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
