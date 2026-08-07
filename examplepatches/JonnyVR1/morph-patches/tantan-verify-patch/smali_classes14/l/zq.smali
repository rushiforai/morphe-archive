.class public final synthetic Ll/zq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/dr;


# direct methods
.method public synthetic constructor <init>(Ll/dr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zq;->a:Ll/dr;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zq;->a:Ll/dr;

    invoke-static {p0}, Ll/dr;->l(Ll/dr;)V

    return-void
.end method
