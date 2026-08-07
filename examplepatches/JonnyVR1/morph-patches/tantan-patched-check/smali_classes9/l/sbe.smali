.class public final synthetic Ll/sbe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/tbe;

.field public final synthetic b:Ll/qbe;


# direct methods
.method public synthetic constructor <init>(Ll/tbe;Ll/qbe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sbe;->a:Ll/tbe;

    iput-object p2, p0, Ll/sbe;->b:Ll/qbe;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sbe;->a:Ll/tbe;

    iget-object p0, p0, Ll/sbe;->b:Ll/qbe;

    invoke-static {v0, p0}, Ll/tbe;->E(Ll/tbe;Ll/qbe;)V

    return-void
.end method
