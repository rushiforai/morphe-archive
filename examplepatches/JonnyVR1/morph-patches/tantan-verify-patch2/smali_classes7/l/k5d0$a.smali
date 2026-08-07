.class public final Ll/k5d0$a;
.super Ll/k5d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/k5d0;->create(Ll/e7y;JLokio/BufferedSource;)Ll/k5d0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/e7y;

.field public final synthetic b:J

.field public final synthetic c:Lokio/BufferedSource;


# direct methods
.method public constructor <init>(Ll/e7y;JLokio/BufferedSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k5d0$a;->a:Ll/e7y;

    .line 2
    .line 3
    iput-wide p2, p0, Ll/k5d0$a;->b:J

    .line 4
    .line 5
    iput-object p4, p0, Ll/k5d0$a;->c:Lokio/BufferedSource;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/k5d0;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/k5d0$a;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public contentType()Ll/e7y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5d0$a;->a:Ll/e7y;

    .line 2
    .line 3
    return-object p0
.end method

.method public source()Lokio/BufferedSource;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5d0$a;->c:Lokio/BufferedSource;

    .line 2
    .line 3
    return-object p0
.end method
