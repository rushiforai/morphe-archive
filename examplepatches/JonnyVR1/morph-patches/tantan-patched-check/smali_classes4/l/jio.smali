.class public final synthetic Ll/jio;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/pio;


# direct methods
.method public synthetic constructor <init>(Ll/pio;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jio;->a:Ll/pio;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jio;->a:Ll/pio;

    invoke-static {p0}, Ll/pio;->m(Ll/pio;)V

    return-void
.end method
