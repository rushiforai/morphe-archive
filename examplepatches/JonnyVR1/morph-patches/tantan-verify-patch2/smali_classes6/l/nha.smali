.class public final synthetic Ll/nha;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;


# direct methods
.method public synthetic constructor <init>(Ll/jka;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nha;->a:Ll/jka;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nha;->a:Ll/jka;

    invoke-static {p0}, Ll/jka;->M0(Ll/jka;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
