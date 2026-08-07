.class final Ll/rgw$b;
.super Ll/pn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/rgw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pn2<",
        "Ll/rgw$a;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pn2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a()Ll/dj80;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rgw$b;->d()Ll/rgw$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Ll/rgw$a;
    .locals 1

    .line 1
    new-instance v0, Ll/rgw$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rgw$a;-><init>(Ll/rgw$b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public e(ILjava/lang/Class;)Ll/rgw$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Class<",
            "*>;)",
            "Ll/rgw$a;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/pn2;->b()Ll/dj80;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rgw$a;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/rgw$a;->b(ILjava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method
