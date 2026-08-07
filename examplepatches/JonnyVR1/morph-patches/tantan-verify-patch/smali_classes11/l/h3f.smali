.class public final synthetic Ll/h3f;
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
    check-cast p1, Ll/g3f;

    check-cast p2, Ll/g3f;

    invoke-static {p1, p2}, Ll/k3f;->c(Ll/g3f;Ll/g3f;)I

    move-result p0

    return p0
.end method
