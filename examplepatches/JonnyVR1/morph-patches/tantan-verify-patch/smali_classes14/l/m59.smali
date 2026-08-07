.class public final synthetic Ll/m59;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/s59;


# direct methods
.method public synthetic constructor <init>(Ll/s59;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m59;->a:Ll/s59;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m59;->a:Ll/s59;

    invoke-static {p0}, Ll/s59;->c3(Ll/s59;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
