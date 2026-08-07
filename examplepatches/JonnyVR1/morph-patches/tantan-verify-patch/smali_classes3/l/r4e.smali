.class public final synthetic Ll/r4e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/u4e;


# direct methods
.method public synthetic constructor <init>(Ll/u4e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r4e;->a:Ll/u4e;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r4e;->a:Ll/u4e;

    invoke-static {p0}, Ll/u4e;->b(Ll/u4e;)V

    return-void
.end method
