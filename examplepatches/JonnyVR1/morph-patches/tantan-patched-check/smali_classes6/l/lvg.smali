.class public final synthetic Ll/lvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pvg;


# direct methods
.method public synthetic constructor <init>(Ll/pvg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lvg;->a:Ll/pvg;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lvg;->a:Ll/pvg;

    invoke-static {p0}, Ll/pvg;->c(Ll/pvg;)V

    return-void
.end method
