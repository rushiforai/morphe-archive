.class public final synthetic Ll/jv20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mw20;


# direct methods
.method public synthetic constructor <init>(Ll/mw20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jv20;->a:Ll/mw20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jv20;->a:Ll/mw20;

    invoke-static {p0}, Ll/mw20;->q0(Ll/mw20;)V

    return-void
.end method
