.class public final synthetic Ll/hc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/lc9;


# direct methods
.method public synthetic constructor <init>(Ll/lc9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hc9;->a:Ll/lc9;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hc9;->a:Ll/lc9;

    invoke-static {p0}, Ll/lc9;->d3(Ll/lc9;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
