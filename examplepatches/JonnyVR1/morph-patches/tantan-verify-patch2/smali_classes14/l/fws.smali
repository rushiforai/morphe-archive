.class public final synthetic Ll/fws;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/dxs;


# direct methods
.method public synthetic constructor <init>(Ll/dxs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fws;->a:Ll/dxs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fws;->a:Ll/dxs;

    check-cast p1, Ll/jcs;

    invoke-static {p0, p1}, Ll/dxs;->c3(Ll/dxs;Ll/jcs;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
