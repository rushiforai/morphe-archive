.class public final synthetic Ll/l9s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/f9e;


# direct methods
.method public synthetic constructor <init>(Ll/f9e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l9s;->a:Ll/f9e;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l9s;->a:Ll/f9e;

    invoke-static {p0}, Ll/n9s;->k(Ll/f9e;)V

    return-void
.end method
