.class public final synthetic Ll/usr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vsr;


# direct methods
.method public synthetic constructor <init>(Ll/vsr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/usr;->a:Ll/vsr;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/usr;->a:Ll/vsr;

    invoke-static {p0}, Ll/vsr;->k(Ll/vsr;)V

    return-void
.end method
