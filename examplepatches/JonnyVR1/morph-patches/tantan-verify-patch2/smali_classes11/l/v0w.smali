.class public final synthetic Ll/v0w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/w0w;

.field public final synthetic b:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Ll/w0w;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v0w;->a:Ll/w0w;

    iput-object p2, p0, Ll/v0w;->b:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v0w;->a:Ll/w0w;

    iget-object p0, p0, Ll/v0w;->b:Landroid/os/Bundle;

    invoke-static {v0, p0}, Ll/w0w;->a(Ll/w0w;Landroid/os/Bundle;)V

    return-void
.end method
