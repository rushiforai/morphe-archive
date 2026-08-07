.class public final Ll/dgg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vrg0;


# instance fields
.field public final synthetic a:Ll/wyg0;


# direct methods
.method public constructor <init>(Ll/wyg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dgg0;->a:Ll/wyg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/gfg0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dgg0;->a:Ll/wyg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wyg0;->m:Ll/bfg0;

    .line 4
    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    new-instance p1, Ll/nwg0;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/nwg0;-><init>(Ll/bfg0;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/bfg0;->b:Ll/dhg0;

    .line 13
    .line 14
    iget-object p2, p0, Ll/dhg0;->z:Ljava/util/ArrayList;

    .line 15
    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    new-instance p2, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Ll/dhg0;->z:Ljava/util/ArrayList;

    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Ll/dhg0;->z:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    invoke-static {p4, p1}, Ll/nhg0;->b(Ljava/lang/String;Ll/qtg0;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    const-string p0, "{\"ret_code\":0, \"ret_msg\":\"success\"}"

    .line 34
    .line 35
    invoke-virtual {p5, p0}, Ll/gfg0;->success(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
