.class public Ll/dml$h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation


# instance fields
.field public a:Ljava/net/Socket;

.field public b:Ljava/lang/String;

.field public c:Lokio/BufferedSource;

.field public d:Lokio/BufferedSink;

.field public e:Ll/dml$j;

.field public f:Ll/vnb0;

.field public g:Z

.field public h:I


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/dml$j;->a:Ll/dml$j;

    .line 5
    .line 6
    iput-object v0, p0, Ll/dml$h;->e:Ll/dml$j;

    .line 7
    .line 8
    sget-object v0, Ll/vnb0;->a:Ll/vnb0;

    .line 9
    .line 10
    iput-object v0, p0, Ll/dml$h;->f:Ll/vnb0;

    .line 11
    .line 12
    iput-boolean p1, p0, Ll/dml$h;->g:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()Ll/dml;
    .locals 1

    .line 1
    new-instance v0, Ll/dml;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dml;-><init>(Ll/dml$h;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public b(Ll/dml$j;)Ll/dml$h;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dml$h;->e:Ll/dml$j;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)Ll/dml$h;
    .locals 0

    .line 1
    iput p1, p0, Ll/dml$h;->h:I

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/net/Socket;Ljava/lang/String;Lokio/BufferedSource;Lokio/BufferedSink;)Ll/dml$h;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dml$h;->a:Ljava/net/Socket;

    .line 2
    .line 3
    iput-object p2, p0, Ll/dml$h;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/dml$h;->c:Lokio/BufferedSource;

    .line 6
    .line 7
    iput-object p4, p0, Ll/dml$h;->d:Lokio/BufferedSink;

    .line 8
    .line 9
    return-object p0
.end method
