.class public final synthetic Ll/e2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/z1g$b;


# direct methods
.method public synthetic constructor <init>(Ll/z1g$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e2g;->a:Ll/z1g$b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2g;->a:Ll/z1g$b;

    invoke-static {p0}, Ll/z1g$b;->e(Ll/z1g$b;)V

    return-void
.end method
