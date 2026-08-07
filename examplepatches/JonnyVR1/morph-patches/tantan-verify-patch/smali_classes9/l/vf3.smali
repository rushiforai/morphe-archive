.class public Ll/vf3;
.super Ll/hk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vf3$d;,
        Ll/vf3$a;,
        Ll/vf3$c;,
        Ll/vf3$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hk2<",
        "Ll/g4$a;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/lang/String;

.field public d:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hk2;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d()Ll/g4$a;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public e(I)Ll/vf3;
    .locals 0

    .line 1
    iput p1, p0, Ll/vf3;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;)Ll/vf3;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vf3;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
