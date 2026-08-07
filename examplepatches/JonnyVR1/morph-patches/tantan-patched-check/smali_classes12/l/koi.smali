.class public final Ll/koi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/ioi;

.field public final b:Ll/ioi;

.field public final c:Ll/ioi;


# direct methods
.method public constructor <init>([Ll/ioi;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    aget-object v0, p1, v0

    .line 6
    .line 7
    iput-object v0, p0, Ll/koi;->a:Ll/ioi;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aget-object v0, p1, v0

    .line 11
    .line 12
    iput-object v0, p0, Ll/koi;->b:Ll/ioi;

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    aget-object p1, p1, v0

    .line 16
    .line 17
    iput-object p1, p0, Ll/koi;->c:Ll/ioi;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a()Ll/ioi;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/koi;->a:Ll/ioi;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/ioi;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/koi;->b:Ll/ioi;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/ioi;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/koi;->c:Ll/ioi;

    .line 2
    .line 3
    return-object p0
.end method
