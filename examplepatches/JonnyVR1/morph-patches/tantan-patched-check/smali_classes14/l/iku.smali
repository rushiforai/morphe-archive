.class public final synthetic Ll/iku;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jku;


# direct methods
.method public synthetic constructor <init>(Ll/jku;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iku;->a:Ll/jku;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iku;->a:Ll/jku;

    invoke-static {p0}, Ll/jku;->i(Ll/jku;)V

    return-void
.end method
