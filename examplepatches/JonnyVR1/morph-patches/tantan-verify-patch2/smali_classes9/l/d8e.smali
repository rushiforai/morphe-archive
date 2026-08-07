.class public final synthetic Ll/d8e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/l8e;


# direct methods
.method public synthetic constructor <init>(Ll/l8e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d8e;->a:Ll/l8e;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d8e;->a:Ll/l8e;

    invoke-static {p0}, Ll/l8e;->i(Ll/l8e;)V

    return-void
.end method
