.class public final synthetic Ll/nll;
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
    check-cast p1, Ll/tll;

    check-cast p2, Ll/tll;

    invoke-static {p1, p2}, Ll/rll;->W3(Ll/tll;Ll/tll;)I

    move-result p0

    return p0
.end method
