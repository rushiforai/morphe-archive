.class public final synthetic Ll/n6n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/e7n;


# direct methods
.method public synthetic constructor <init>(Ll/e7n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n6n;->a:Ll/e7n;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6n;->a:Ll/e7n;

    invoke-static {p0}, Ll/e7n;->h4(Ll/e7n;)V

    return-void
.end method
