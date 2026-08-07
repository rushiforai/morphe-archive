.class public final synthetic Ll/znm0;
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
    check-cast p1, Ll/fom0;

    check-cast p2, Ll/fom0;

    invoke-static {p1, p2}, Ll/dom0;->c4(Ll/fom0;Ll/fom0;)I

    move-result p0

    return p0
.end method
