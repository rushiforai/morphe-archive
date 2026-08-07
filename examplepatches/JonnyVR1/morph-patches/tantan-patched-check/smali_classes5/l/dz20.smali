.class public final synthetic Ll/dz20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gz20;


# direct methods
.method public synthetic constructor <init>(Ll/gz20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dz20;->a:Ll/gz20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dz20;->a:Ll/gz20;

    invoke-static {p0}, Ll/gz20;->e(Ll/gz20;)V

    return-void
.end method
