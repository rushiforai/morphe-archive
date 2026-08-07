.class public final synthetic Ll/t0y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/z0y;


# direct methods
.method public synthetic constructor <init>(Ll/z0y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t0y;->a:Ll/z0y;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t0y;->a:Ll/z0y;

    invoke-static {p0}, Ll/z0y;->b(Ll/z0y;)V

    return-void
.end method
