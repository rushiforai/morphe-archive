.class public final synthetic Ll/kda;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/rnl$a;


# direct methods
.method public synthetic constructor <init>(Ll/rnl$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kda;->a:Ll/rnl$a;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kda;->a:Ll/rnl$a;

    invoke-static {p0}, Ll/jka;->S1(Ll/rnl$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
