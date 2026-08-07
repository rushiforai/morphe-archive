.class public final synthetic Ll/lj2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mj2;


# direct methods
.method public synthetic constructor <init>(Ll/mj2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lj2;->a:Ll/mj2;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lj2;->a:Ll/mj2;

    invoke-static {p0}, Ll/mj2;->a(Ll/mj2;)V

    return-void
.end method
