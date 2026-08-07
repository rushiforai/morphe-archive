.class public final synthetic Ll/fm70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gm70;


# direct methods
.method public synthetic constructor <init>(Ll/gm70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fm70;->a:Ll/gm70;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fm70;->a:Ll/gm70;

    invoke-static {p0}, Ll/gm70;->C(Ll/gm70;)V

    return-void
.end method
