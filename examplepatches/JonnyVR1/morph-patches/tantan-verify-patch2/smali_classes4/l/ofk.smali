.class public final synthetic Ll/ofk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pfk;


# direct methods
.method public synthetic constructor <init>(Ll/pfk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ofk;->a:Ll/pfk;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofk;->a:Ll/pfk;

    invoke-static {p0}, Ll/pfk;->f(Ll/pfk;)V

    return-void
.end method
