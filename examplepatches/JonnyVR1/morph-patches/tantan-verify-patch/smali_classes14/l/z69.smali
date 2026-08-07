.class public final synthetic Ll/z69;
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
    check-cast p1, Ll/d79$a;

    check-cast p2, Ll/d79$a;

    invoke-static {p1, p2}, Ll/d79;->c(Ll/d79$a;Ll/d79$a;)I

    move-result p0

    return p0
.end method
