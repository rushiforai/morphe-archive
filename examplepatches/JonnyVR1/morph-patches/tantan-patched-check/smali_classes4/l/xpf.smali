.class public final synthetic Ll/xpf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aqf$a;


# direct methods
.method public synthetic constructor <init>(Ll/aqf$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xpf;->a:Ll/aqf$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xpf;->a:Ll/aqf$a;

    invoke-static {p0}, Ll/aqf$a;->c(Ll/aqf$a;)V

    return-void
.end method
