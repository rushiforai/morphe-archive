.class public final synthetic Ll/hna;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/ina;


# direct methods
.method public synthetic constructor <init>(Ll/ina;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hna;->a:Ll/ina;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hna;->a:Ll/ina;

    invoke-static {p0}, Ll/ina;->l3(Ll/ina;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
