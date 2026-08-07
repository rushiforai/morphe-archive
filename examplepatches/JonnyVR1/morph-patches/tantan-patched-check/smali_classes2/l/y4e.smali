.class public Ll/y4e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z3e$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/y4e$a;
    }
.end annotation


# instance fields
.field private final a:J

.field private final b:Ll/y4e$a;


# direct methods
.method public constructor <init>(Ll/y4e$a;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p2, p0, Ll/y4e;->a:J

    .line 5
    .line 6
    iput-object p1, p0, Ll/y4e;->b:Ll/y4e$a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public build()Ll/z3e;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/y4e;->b:Ll/y4e$a;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/y4e$a;->getCacheDirectory()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_2

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return-object v1

    .line 25
    :cond_2
    :goto_0
    iget-wide v1, p0, Ll/y4e;->a:J

    .line 26
    .line 27
    invoke-static {v0, v1, v2}, Ll/z4e;->c(Ljava/io/File;J)Ll/z3e;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
