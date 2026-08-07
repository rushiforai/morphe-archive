.class public final synthetic Ll/x2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/b3g;


# direct methods
.method public synthetic constructor <init>(Ll/b3g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x2g;->a:Ll/b3g;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x2g;->a:Ll/b3g;

    invoke-static {p0}, Ll/b3g;->i0(Ll/b3g;)V

    return-void
.end method
