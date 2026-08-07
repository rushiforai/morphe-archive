.class public Ll/bcg$a;
.super Ll/gk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/bcg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/gk2;-><init>(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ll/bcg;
    .locals 2

    .line 1
    new-instance v0, Ll/bcg;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/bcg;-><init>(Ll/bcg$a;Ll/ccg;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public b(Ljava/lang/String;)Ll/bcg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bcg$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
