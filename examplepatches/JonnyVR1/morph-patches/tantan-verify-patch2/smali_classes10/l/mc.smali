.class public final synthetic Ll/mc;
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
    check-cast p1, Ll/ely;

    check-cast p2, Ll/ely;

    invoke-static {p1, p2}, Ll/pc;->Y3(Ll/ely;Ll/ely;)I

    move-result p0

    return p0
.end method
