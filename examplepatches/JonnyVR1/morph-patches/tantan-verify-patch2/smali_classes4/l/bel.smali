.class public final synthetic Ll/bel;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/tel;


# direct methods
.method public synthetic constructor <init>(Ll/tel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bel;->a:Ll/tel;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bel;->a:Ll/tel;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Ll/tel;->d1(Ll/tel;Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
