.class public final synthetic Ll/ix5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jx5;


# direct methods
.method public synthetic constructor <init>(Ll/jx5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ix5;->a:Ll/jx5;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ix5;->a:Ll/jx5;

    invoke-static {p0}, Ll/jx5;->c(Ll/jx5;)V

    return-void
.end method
