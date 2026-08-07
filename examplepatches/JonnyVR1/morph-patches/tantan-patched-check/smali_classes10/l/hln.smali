.class public final synthetic Ll/hln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/nln;


# direct methods
.method public synthetic constructor <init>(Ll/nln;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hln;->a:Ll/nln;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hln;->a:Ll/nln;

    check-cast p1, Ll/ib0;

    invoke-static {p0, p1}, Ll/nln;->L3(Ll/nln;Ll/ib0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
