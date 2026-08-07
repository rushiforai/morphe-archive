.class public final synthetic Ll/mio;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/pio;


# direct methods
.method public synthetic constructor <init>(Ll/pio;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mio;->a:Ll/pio;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mio;->a:Ll/pio;

    invoke-static {p0}, Ll/pio;->n(Ll/pio;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
