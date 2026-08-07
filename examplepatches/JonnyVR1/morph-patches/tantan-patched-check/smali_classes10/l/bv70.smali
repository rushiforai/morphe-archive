.class public final synthetic Ll/bv70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/gv70;


# direct methods
.method public synthetic constructor <init>(Ll/gv70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bv70;->a:Ll/gv70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bv70;->a:Ll/gv70;

    check-cast p1, Ll/hv70;

    invoke-static {p0, p1}, Ll/gv70;->L3(Ll/gv70;Ll/hv70;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
