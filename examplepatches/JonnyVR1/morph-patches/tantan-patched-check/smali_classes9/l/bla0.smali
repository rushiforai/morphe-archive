.class public final synthetic Ll/bla0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/cla0;


# direct methods
.method public synthetic constructor <init>(Ll/cla0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bla0;->a:Ll/cla0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bla0;->a:Ll/cla0;

    invoke-static {p0}, Ll/cla0;->f1(Ll/cla0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
