.class public final synthetic Ll/b31;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/c31;


# direct methods
.method public synthetic constructor <init>(Ll/c31;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b31;->a:Ll/c31;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b31;->a:Ll/c31;

    invoke-static {p0}, Ll/c31;->a(Ll/c31;)V

    return-void
.end method
