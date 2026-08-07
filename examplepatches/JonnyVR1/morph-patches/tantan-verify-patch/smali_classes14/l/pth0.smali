.class public final synthetic Ll/pth0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/wth0$a;

    check-cast p2, Ll/wth0$a;

    invoke-static {p1, p2}, Ll/wth0;->c(Ll/wth0$a;Ll/wth0$a;)I

    move-result p0

    return p0
.end method
