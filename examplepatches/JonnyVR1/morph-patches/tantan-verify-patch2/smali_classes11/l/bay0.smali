.class public final synthetic Ll/bay0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic a:Ll/fay0;

.field public synthetic b:I

.field public synthetic c:Ljava/lang/Exception;

.field public synthetic d:[B

.field public synthetic e:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Ll/fay0;ILjava/lang/Exception;[BLjava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bay0;->a:Ll/fay0;

    .line 5
    .line 6
    iput p2, p0, Ll/bay0;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/bay0;->c:Ljava/lang/Exception;

    .line 9
    .line 10
    iput-object p4, p0, Ll/bay0;->d:[B

    .line 11
    .line 12
    iput-object p5, p0, Ll/bay0;->e:Ljava/util/Map;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bay0;->a:Ll/fay0;

    .line 2
    .line 3
    iget v1, p0, Ll/bay0;->b:I

    .line 4
    .line 5
    iget-object v2, p0, Ll/bay0;->c:Ljava/lang/Exception;

    .line 6
    .line 7
    iget-object v3, p0, Ll/bay0;->d:[B

    .line 8
    .line 9
    iget-object p0, p0, Ll/bay0;->e:Ljava/util/Map;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/fay0;->a(ILjava/lang/Exception;[BLjava/util/Map;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
