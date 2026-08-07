.class public final synthetic Ll/gla;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/pla;


# direct methods
.method public synthetic constructor <init>(Ll/pla;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gla;->a:Ll/pla;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gla;->a:Ll/pla;

    invoke-static {p0}, Ll/pla;->d3(Ll/pla;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
