.class public final synthetic Ll/ks10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroidx/room/f;


# direct methods
.method public synthetic constructor <init>(Landroidx/room/f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ks10;->a:Landroidx/room/f;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ks10;->a:Landroidx/room/f;

    invoke-static {p0}, Landroidx/room/f;->b(Landroidx/room/f;)V

    return-void
.end method
