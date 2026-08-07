.class public final synthetic Ll/uw4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mw4;


# direct methods
.method public synthetic constructor <init>(Ll/mw4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uw4;->a:Ll/mw4;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uw4;->a:Ll/mw4;

    invoke-static {p0}, Ll/ix4;->G(Ll/mw4;)V

    return-void
.end method
