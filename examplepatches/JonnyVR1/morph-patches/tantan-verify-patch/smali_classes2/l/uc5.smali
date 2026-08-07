.class public final synthetic Ll/uc5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vc5;


# direct methods
.method public synthetic constructor <init>(Ll/vc5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uc5;->a:Ll/vc5;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uc5;->a:Ll/vc5;

    invoke-static {p0}, Ll/vc5;->a(Ll/vc5;)V

    return-void
.end method
