.class public final synthetic Ll/cei;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hei;


# direct methods
.method public synthetic constructor <init>(Ll/hei;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cei;->a:Ll/hei;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cei;->a:Ll/hei;

    invoke-static {p0}, Ll/hei;->A(Ll/hei;)V

    return-void
.end method
