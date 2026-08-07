.class public final Ll/ixh$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ixh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public c:Z

.field public d:Lcom/p1/mobile/putong/feed/data/Moment;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ll/ixh$a;
    .locals 1

    .line 1
    new-instance v0, Ll/ixh$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ixh$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Ll/ixh;
    .locals 2

    .line 1
    new-instance v0, Ll/ixh;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ixh;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Ll/ixh$a;->b:I

    .line 7
    .line 8
    iput v1, v0, Ll/ixh;->a:I

    .line 9
    .line 10
    iget-object v1, p0, Ll/ixh$a;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 11
    .line 12
    iput-object v1, v0, Ll/ixh;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    iget-boolean v1, p0, Ll/ixh$a;->c:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Ll/ixh;->b:Z

    .line 17
    .line 18
    iget-boolean v1, p0, Ll/ixh$a;->a:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Ll/ixh;->d:Z

    .line 21
    .line 22
    iget-object p0, p0, Ll/ixh$a;->e:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p0, v0, Ll/ixh;->e:Ljava/lang/String;

    .line 25
    .line 26
    return-object v0
.end method

.method public c(I)Ll/ixh$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/ixh$a;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/lang/String;)Ll/ixh$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ixh$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/ixh$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ixh$a;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Z)Ll/ixh$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ixh$a;->c:Z

    .line 2
    .line 3
    return-object p0
.end method
