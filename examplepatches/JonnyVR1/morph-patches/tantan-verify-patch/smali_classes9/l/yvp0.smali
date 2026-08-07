.class public final synthetic Ll/yvp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/awp0;


# direct methods
.method public synthetic constructor <init>(Ll/awp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yvp0;->a:Ll/awp0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yvp0;->a:Ll/awp0;

    invoke-static {p0}, Ll/awp0;->G(Ll/awp0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
