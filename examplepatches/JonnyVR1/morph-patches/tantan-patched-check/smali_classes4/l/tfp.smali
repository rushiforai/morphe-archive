.class public final synthetic Ll/tfp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rfh0$a;


# direct methods
.method public synthetic constructor <init>(Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tfp;->a:Ll/rfh0$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tfp;->a:Ll/rfh0$a;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/ufp;->d(Ll/rfh0$a;Ljava/lang/Throwable;)V

    return-void
.end method
