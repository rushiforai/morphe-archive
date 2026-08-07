.class public final synthetic Ll/oio;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pio;


# direct methods
.method public synthetic constructor <init>(Ll/pio;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oio;->a:Ll/pio;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oio;->a:Ll/pio;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/pio;->d(Ll/pio;Ljava/lang/Boolean;)V

    return-void
.end method
