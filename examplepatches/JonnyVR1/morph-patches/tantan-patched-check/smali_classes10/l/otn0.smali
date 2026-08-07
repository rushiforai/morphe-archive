.class public final synthetic Ll/otn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/stn0;


# direct methods
.method public synthetic constructor <init>(Ll/stn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/otn0;->a:Ll/stn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/otn0;->a:Ll/stn0;

    check-cast p1, Ll/gvn0;

    invoke-static {p0, p1}, Ll/stn0;->K3(Ll/stn0;Ll/gvn0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
