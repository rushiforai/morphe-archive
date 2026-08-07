.class public final synthetic Ll/d7c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/e7c0;


# direct methods
.method public synthetic constructor <init>(Ll/e7c0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d7c0;->a:Ll/e7c0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d7c0;->a:Ll/e7c0;

    invoke-static {p0}, Ll/e7c0;->g(Ll/e7c0;)V

    return-void
.end method
