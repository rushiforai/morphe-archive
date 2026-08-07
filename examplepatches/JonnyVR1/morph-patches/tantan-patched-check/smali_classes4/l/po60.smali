.class public final synthetic Ll/po60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/fj1;


# direct methods
.method public synthetic constructor <init>(Ll/fj1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/po60;->a:Ll/fj1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/po60;->a:Ll/fj1;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Ll/fp60;->u(Ll/fj1;Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
