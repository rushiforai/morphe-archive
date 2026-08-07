.class public final synthetic Ll/enr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/nnr;


# direct methods
.method public synthetic constructor <init>(Ll/nnr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/enr;->a:Ll/nnr;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/enr;->a:Ll/nnr;

    invoke-static {p0}, Ll/nnr;->k(Ll/nnr;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
