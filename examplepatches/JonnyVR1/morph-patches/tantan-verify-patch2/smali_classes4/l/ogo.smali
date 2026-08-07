.class public final synthetic Ll/ogo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tgo;


# direct methods
.method public synthetic constructor <init>(Ll/tgo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ogo;->a:Ll/tgo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogo;->a:Ll/tgo;

    invoke-static {p0}, Ll/tgo;->a(Ll/tgo;)V

    return-void
.end method
