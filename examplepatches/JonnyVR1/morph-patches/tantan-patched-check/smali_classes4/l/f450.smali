.class public final synthetic Ll/f450;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/k450;


# direct methods
.method public synthetic constructor <init>(Ll/k450;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f450;->a:Ll/k450;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f450;->a:Ll/k450;

    invoke-static {p0}, Ll/k450;->d(Ll/k450;)V

    return-void
.end method
