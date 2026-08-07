.class public Ll/t0r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/r0r0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/t0r0$b;
    }
.end annotation


# instance fields
.field private a:Ll/r0r0;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/t0r0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/t0r0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/t0r0;
    .locals 1

    .line 1
    invoke-static {}, Ll/t0r0$b;->a()Ll/t0r0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 9
    iget-object p0, p0, Ll/t0r0;->a:Ll/r0r0;

    if-eqz p0, :cond_0

    .line 10
    invoke-interface {p0, p1, p2}, Ll/r0r0;->a(Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method public a(Ll/q0r0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t0r0;->a:Ll/r0r0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/r0r0;->a(Ll/q0r0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
