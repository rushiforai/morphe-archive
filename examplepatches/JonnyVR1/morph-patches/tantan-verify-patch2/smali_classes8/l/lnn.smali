.class public final synthetic Ll/lnn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xnn;


# direct methods
.method public synthetic constructor <init>(Ll/xnn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lnn;->a:Ll/xnn;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnn;->a:Ll/xnn;

    invoke-static {p0}, Ll/xnn;->k(Ll/xnn;)V

    return-void
.end method
