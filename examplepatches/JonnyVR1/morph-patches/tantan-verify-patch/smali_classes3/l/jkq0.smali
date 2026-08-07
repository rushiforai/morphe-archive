.class public final synthetic Ll/jkq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/quickjs/QuickJS;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/QuickJS;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jkq0;->a:Lcom/quickjs/QuickJS;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jkq0;->a:Lcom/quickjs/QuickJS;

    invoke-virtual {p0}, Lcom/quickjs/QuickJS;->close()V

    return-void
.end method
