.class public final synthetic Ll/py50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gae0;


# direct methods
.method public synthetic constructor <init>(Ll/gae0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/py50;->a:Ll/gae0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/py50;->a:Ll/gae0;

    invoke-static {p0}, Ll/qy50;->b(Ll/gae0;)V

    return-void
.end method
