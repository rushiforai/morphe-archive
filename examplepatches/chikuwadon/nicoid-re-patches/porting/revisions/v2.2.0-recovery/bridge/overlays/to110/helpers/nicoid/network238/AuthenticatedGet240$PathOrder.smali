.class final Lnicoid/network238/AuthenticatedGet240$PathOrder;
.super Ljava/lang/Object;
.source "AuthenticatedGet240.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/AuthenticatedGet240;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PathOrder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lnicoid/network238/okhttp3/Cookie;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnicoid/network238/AuthenticatedGet240$1;)V
    .registers 2

    .line 54
    invoke-direct {p0}, Lnicoid/network238/AuthenticatedGet240$PathOrder;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 54
    check-cast p1, Lnicoid/network238/okhttp3/Cookie;

    check-cast p2, Lnicoid/network238/okhttp3/Cookie;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/AuthenticatedGet240$PathOrder;->compare(Lnicoid/network238/okhttp3/Cookie;Lnicoid/network238/okhttp3/Cookie;)I

    move-result p1

    return p1
.end method

.method public compare(Lnicoid/network238/okhttp3/Cookie;Lnicoid/network238/okhttp3/Cookie;)I
    .registers 3

    .line 54
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->path()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie;->path()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p1

    return p1
.end method
