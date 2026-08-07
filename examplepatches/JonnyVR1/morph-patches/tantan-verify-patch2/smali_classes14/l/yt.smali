.class public final synthetic Ll/yt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/du;


# direct methods
.method public synthetic constructor <init>(Ll/du;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yt;->a:Ll/du;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yt;->a:Ll/du;

    invoke-static {p0}, Ll/du;->b(Ll/du;)V

    return-void
.end method
