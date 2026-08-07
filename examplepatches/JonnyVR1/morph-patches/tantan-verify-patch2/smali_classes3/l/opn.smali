.class public final synthetic Ll/opn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/spn;


# direct methods
.method public synthetic constructor <init>(Ll/spn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/opn;->a:Ll/spn;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/opn;->a:Ll/spn;

    invoke-static {p0}, Ll/spn;->l0(Ll/spn;)V

    return-void
.end method
