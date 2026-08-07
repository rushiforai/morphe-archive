.class public final synthetic Ll/bl5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/dl5;


# direct methods
.method public synthetic constructor <init>(Ll/dl5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bl5;->a:Ll/dl5;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bl5;->a:Ll/dl5;

    invoke-static {p0}, Ll/dl5;->r(Ll/dl5;)V

    return-void
.end method
