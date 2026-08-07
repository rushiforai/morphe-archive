.class public final synthetic Ll/ubh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vbh;


# direct methods
.method public synthetic constructor <init>(Ll/vbh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ubh;->a:Ll/vbh;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ubh;->a:Ll/vbh;

    invoke-static {p0}, Ll/vbh;->e(Ll/vbh;)V

    return-void
.end method
