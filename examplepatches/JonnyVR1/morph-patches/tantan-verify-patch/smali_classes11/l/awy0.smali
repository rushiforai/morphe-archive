.class public final Ll/awy0;
.super Ll/w9r;
.source "SourceFile"


# direct methods
.method public synthetic constructor <init>(Ll/yvy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w9r;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    check-cast p1, Ll/avy0;

    .line 2
    .line 3
    new-instance p0, Ll/jvy0;

    .line 4
    .line 5
    invoke-static {}, Ll/rd00;->c()Ll/rd00;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/bvy0;

    .line 10
    .line 11
    invoke-static {}, Ll/rd00;->c()Ll/rd00;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Ll/rd00;->b()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-direct {v1, v2, p1}, Ll/bvy0;-><init>(Landroid/content/Context;Ll/avy0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ll/avy0;->b()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0}, Ll/rd00;->b()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-class v3, Ll/h4f0;

    .line 31
    .line 32
    invoke-virtual {v0, v3}, Ll/rd00;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/h4f0;

    .line 37
    .line 38
    invoke-direct {p0, v2, v0, v1, p1}, Ll/jvy0;-><init>(Landroid/content/Context;Ll/h4f0;Ll/iuy0;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-object p0
.end method
