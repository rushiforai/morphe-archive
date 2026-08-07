.class public final synthetic Ll/clh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/elh;


# direct methods
.method public synthetic constructor <init>(Ll/elh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/clh;->a:Ll/elh;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clh;->a:Ll/elh;

    invoke-static {p0}, Ll/elh;->e(Ll/elh;)V

    return-void
.end method
