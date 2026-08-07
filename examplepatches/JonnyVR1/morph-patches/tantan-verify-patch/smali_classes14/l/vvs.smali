.class public final synthetic Ll/vvs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bws;


# direct methods
.method public synthetic constructor <init>(Ll/bws;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vvs;->a:Ll/bws;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vvs;->a:Ll/bws;

    check-cast p1, Ll/sys;

    invoke-static {p0, p1}, Ll/bws;->V2(Ll/bws;Ll/sys;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
