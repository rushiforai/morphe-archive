.class public final synthetic Ll/kqg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/f0r;


# direct methods
.method public synthetic constructor <init>(Ll/f0r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kqg;->a:Ll/f0r;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kqg;->a:Ll/f0r;

    invoke-virtual {p0}, Ll/f0r;->h()V

    return-void
.end method
