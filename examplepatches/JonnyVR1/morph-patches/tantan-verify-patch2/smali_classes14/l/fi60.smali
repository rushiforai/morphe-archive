.class public final synthetic Ll/fi60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ii60;


# direct methods
.method public synthetic constructor <init>(Ll/ii60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fi60;->a:Ll/ii60;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fi60;->a:Ll/ii60;

    invoke-static {p0}, Ll/ii60;->i0(Ll/ii60;)V

    return-void
.end method
