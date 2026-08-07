.class public final synthetic Ll/tdj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/udj;


# direct methods
.method public synthetic constructor <init>(Ll/udj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tdj;->a:Ll/udj;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tdj;->a:Ll/udj;

    invoke-static {p0}, Ll/udj;->b(Ll/udj;)V

    return-void
.end method
