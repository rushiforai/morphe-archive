.class public final synthetic Ll/tkp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rfh0$a;


# direct methods
.method public synthetic constructor <init>(Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tkp;->a:Ll/rfh0$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tkp;->a:Ll/rfh0$a;

    invoke-static {p0}, Ll/vkp;->i(Ll/rfh0$a;)V

    return-void
.end method
