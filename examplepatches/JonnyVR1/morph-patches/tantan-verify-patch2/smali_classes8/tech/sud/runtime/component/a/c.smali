.class Ltech/sud/runtime/component/a/c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/String;

.field private b:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ltech/sud/runtime/component/a/c;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p1, p0, Ltech/sud/runtime/component/a/c;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/a/c;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/runtime/component/a/c;->b:I

    .line 2
    .line 3
    return p0
.end method
