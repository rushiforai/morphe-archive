.class public final Ll/gsg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ljava/lang/String;


# instance fields
.field public final a:Ll/slg0;

.field public final b:Ll/zkg0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/gsg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/gsg0;->c:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Ll/slg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gsg0;->a:Ll/slg0;

    .line 5
    .line 6
    new-instance p1, Ll/zkg0;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/zkg0;-><init>(Ll/gsg0;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/gsg0;->b:Ll/zkg0;

    .line 12
    .line 13
    return-void
.end method
