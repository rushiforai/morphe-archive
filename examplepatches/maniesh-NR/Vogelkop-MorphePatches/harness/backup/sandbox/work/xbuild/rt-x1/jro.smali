.class public final Ljro;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:B

.field public b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Lmjo;

.field public final e:Lwci;

.field public final f:Ljava/io/File;

.field public final g:Lfr;

.field public final h:I

.field public i:I

.field public j:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/io/File;Lwci;)V
    .registers 4

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljro;->b:Ljava/lang/String;

    const/16 p1, 0xb

    iput-byte p1, p0, Ljro;->a:B

    iput-object p2, p0, Ljro;->f:Ljava/io/File;

    iput-object p3, p0, Ljro;->e:Lwci;

    new-instance p1, Lfr;

    const/4 p2, 0x0

    const/16 p3, 0x1d

    invoke-direct {p1, p3, p2}, Lfr;-><init>(BI)V

    iput-object p1, p0, Ljro;->g:Lfr;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IILmjo;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljro;->b:Ljava/lang/String;

    const/16 p1, 0xc

    iput-byte p1, p0, Ljro;->a:B

    iput-object p2, p0, Ljro;->c:Ljava/lang/String;

    new-instance p1, Lfr;

    const/16 p2, 0x1d

    invoke-direct {p1, p2, p3}, Lfr;-><init>(BI)V

    iput-object p1, p0, Ljro;->g:Lfr;

    iput p4, p0, Ljro;->h:I

    iput-object p5, p0, Ljro;->d:Lmjo;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lmjo;II)V
    .registers 5

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljro;->b:Ljava/lang/String;

    const/16 p1, 0xb

    iput-byte p1, p0, Ljro;->a:B

    iput-object p2, p0, Ljro;->d:Lmjo;

    new-instance p1, Lfr;

    const/16 p2, 0x1d

    invoke-direct {p1, p2, p3}, Lfr;-><init>(BI)V

    iput-object p1, p0, Ljro;->g:Lfr;

    iput p4, p0, Ljro;->h:I

    return-void
.end method
