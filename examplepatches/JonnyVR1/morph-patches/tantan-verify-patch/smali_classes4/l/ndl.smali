.class public final synthetic Ll/ndl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tel;


# direct methods
.method public synthetic constructor <init>(Ll/tel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ndl;->a:Ll/tel;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ndl;->a:Ll/tel;

    invoke-static {p0}, Ll/tel;->x0(Ll/tel;)V

    return-void
.end method
