.class public final synthetic Ll/v410;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/e510;


# direct methods
.method public synthetic constructor <init>(Ll/e510;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v410;->a:Ll/e510;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v410;->a:Ll/e510;

    check-cast p1, Ll/r410;

    invoke-static {p0, p1}, Ll/e510;->L3(Ll/e510;Ll/r410;)Ll/xzl;

    move-result-object p0

    return-object p0
.end method
