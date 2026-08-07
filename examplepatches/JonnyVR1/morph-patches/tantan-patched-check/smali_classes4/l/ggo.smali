.class public final synthetic Ll/ggo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/hgo;

.field public final synthetic b:Ll/cio;


# direct methods
.method public synthetic constructor <init>(Ll/hgo;Ll/cio;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ggo;->a:Ll/hgo;

    iput-object p2, p0, Ll/ggo;->b:Ll/cio;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ggo;->a:Ll/hgo;

    iget-object p0, p0, Ll/ggo;->b:Ll/cio;

    invoke-static {v0, p0}, Ll/hgo;->F(Ll/hgo;Ll/cio;)V

    return-void
.end method
