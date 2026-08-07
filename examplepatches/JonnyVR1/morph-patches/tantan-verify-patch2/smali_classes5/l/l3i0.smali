.class public final synthetic Ll/l3i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ycj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    move-object p0, p1

    check-cast p0, Ljava/util/List;

    move-object p1, p2

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    move-object p2, p3

    check-cast p2, Lcom/google/common/base/Optional;

    check-cast p7, Ljava/lang/String;

    check-cast p8, Ll/uxj0;

    check-cast p9, Ll/uxj0;

    move-object p3, p4

    move-object p4, p5

    move-object p5, p6

    move-object p6, p7

    move-object p7, p8

    move-object p8, p9

    invoke-static/range {p0 .. p8}, Ll/n3i0;->E(Ljava/util/List;Lcom/p1/mobile/putong/data/User;Lcom/google/common/base/Optional;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ll/uxj0;Ll/uxj0;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method
