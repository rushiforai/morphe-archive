.class public final synthetic Ll/ql1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rl1;


# direct methods
.method public synthetic constructor <init>(Ll/rl1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ql1;->a:Ll/rl1;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ql1;->a:Ll/rl1;

    invoke-static {p0}, Ll/rl1;->c(Ll/rl1;)V

    return-void
.end method
