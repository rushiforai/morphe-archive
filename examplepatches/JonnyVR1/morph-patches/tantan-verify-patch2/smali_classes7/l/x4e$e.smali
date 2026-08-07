.class public final Ll/x4e$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/x4e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "e"
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J

.field public final c:[Lokio/Source;

.field public final d:[J

.field public final synthetic e:Ll/x4e;


# direct methods
.method public constructor <init>(Ll/x4e;Ljava/lang/String;J[Lokio/Source;[J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x4e$e;->e:Ll/x4e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/x4e$e;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Ll/x4e$e;->b:J

    .line 9
    .line 10
    iput-object p5, p0, Ll/x4e$e;->c:[Lokio/Source;

    .line 11
    .line 12
    iput-object p6, p0, Ll/x4e$e;->d:[J

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/x4e$e;->c:[Lokio/Source;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-static {v2}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public k()Ll/x4e$b;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/x4e$e;->e:Ll/x4e;

    .line 2
    .line 3
    iget-object v1, p0, Ll/x4e$e;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-wide v2, p0, Ll/x4e$e;->b:J

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2, v3}, Ll/x4e;->u(Ljava/lang/String;J)Ll/x4e$b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public m(I)Lokio/Source;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x4e$e;->c:[Lokio/Source;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method
