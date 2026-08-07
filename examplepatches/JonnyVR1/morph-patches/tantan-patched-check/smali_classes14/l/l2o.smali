.class public final synthetic Ll/l2o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/h3o;


# direct methods
.method public synthetic constructor <init>(Ll/h3o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l2o;->a:Ll/h3o;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l2o;->a:Ll/h3o;

    invoke-static {p0}, Ll/h3o;->o(Ll/h3o;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
