.class public final synthetic Ll/jil0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yil0;

.field public final synthetic b:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Ll/yil0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jil0;->a:Ll/yil0;

    iput-object p2, p0, Ll/jil0;->b:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jil0;->a:Ll/yil0;

    iget-object p0, p0, Ll/jil0;->b:Landroid/os/Bundle;

    invoke-static {v0, p0}, Ll/yil0;->w(Ll/yil0;Landroid/os/Bundle;)V

    return-void
.end method
