.class public final synthetic Ll/oya;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/cza;


# direct methods
.method public synthetic constructor <init>(Ll/cza;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oya;->a:Ll/cza;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oya;->a:Ll/cza;

    invoke-static {p0}, Ll/cza;->u3(Ll/cza;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
