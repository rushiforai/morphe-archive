.class public final synthetic Ll/mev;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cfv;


# direct methods
.method public synthetic constructor <init>(Ll/cfv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mev;->a:Ll/cfv;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mev;->a:Ll/cfv;

    check-cast p1, Ll/bcg0;

    invoke-static {p0, p1}, Ll/cfv;->U3(Ll/cfv;Ll/bcg0;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
