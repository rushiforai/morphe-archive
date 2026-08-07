.class public final Ll/df5$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/df5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:[B
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 22
    iput v0, p0, Ll/df5$b;->a:I

    .line 23
    iput v0, p0, Ll/df5$b;->b:I

    .line 24
    iput v0, p0, Ll/df5$b;->c:I

    return-void
.end method

.method public constructor <init>(Ll/df5;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Ll/df5;->a:I

    .line 5
    .line 6
    iput v0, p0, Ll/df5$b;->a:I

    .line 7
    .line 8
    iget v0, p1, Ll/df5;->b:I

    .line 9
    .line 10
    iput v0, p0, Ll/df5$b;->b:I

    .line 11
    .line 12
    iget v0, p1, Ll/df5;->c:I

    .line 13
    .line 14
    iput v0, p0, Ll/df5$b;->c:I

    .line 15
    .line 16
    iget-object p1, p1, Ll/df5;->d:[B

    .line 17
    .line 18
    iput-object p1, p0, Ll/df5$b;->d:[B

    .line 19
    .line 20
    return-void
.end method

.method public synthetic constructor <init>(Ll/df5;Ll/df5$a;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Ll/df5$b;-><init>(Ll/df5;)V

    return-void
.end method


# virtual methods
.method public a()Ll/df5;
    .locals 4

    .line 1
    new-instance v0, Ll/df5;

    .line 2
    .line 3
    iget v1, p0, Ll/df5$b;->a:I

    .line 4
    .line 5
    iget v2, p0, Ll/df5$b;->b:I

    .line 6
    .line 7
    iget v3, p0, Ll/df5$b;->c:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/df5$b;->d:[B

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, p0}, Ll/df5;-><init>(III[B)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public b(I)Ll/df5$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/df5$b;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)Ll/df5$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/df5$b;->a:I

    .line 2
    .line 3
    return-object p0
.end method

.method public d(I)Ll/df5$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/df5$b;->c:I

    .line 2
    .line 3
    return-object p0
.end method
