.class public final synthetic Ll/wjk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ikk;


# direct methods
.method public synthetic constructor <init>(Ll/ikk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wjk;->a:Ll/ikk;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wjk;->a:Ll/ikk;

    invoke-static {p0}, Ll/ikk;->n0(Ll/ikk;)V

    return-void
.end method
