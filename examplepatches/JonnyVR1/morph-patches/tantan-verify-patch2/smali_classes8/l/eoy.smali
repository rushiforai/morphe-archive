.class public final synthetic Ll/eoy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/loy;


# direct methods
.method public synthetic constructor <init>(Ll/loy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eoy;->a:Ll/loy;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eoy;->a:Ll/loy;

    invoke-static {p0}, Ll/loy;->G(Ll/loy;)V

    return-void
.end method
