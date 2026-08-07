.class public final synthetic Ll/tbb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/dcb;


# direct methods
.method public synthetic constructor <init>(Ll/dcb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tbb;->a:Ll/dcb;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tbb;->a:Ll/dcb;

    invoke-static {p0}, Ll/dcb;->j3(Ll/dcb;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
