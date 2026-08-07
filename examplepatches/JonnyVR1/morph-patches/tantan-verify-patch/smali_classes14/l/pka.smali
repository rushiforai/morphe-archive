.class public final synthetic Ll/pka;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/ela;


# direct methods
.method public synthetic constructor <init>(Ll/ela;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pka;->a:Ll/ela;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pka;->a:Ll/ela;

    invoke-static {p0}, Ll/ela;->k3(Ll/ela;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
