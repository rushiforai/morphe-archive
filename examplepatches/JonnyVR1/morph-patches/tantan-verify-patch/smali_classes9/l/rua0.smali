.class public final synthetic Ll/rua0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/sua0;


# direct methods
.method public synthetic constructor <init>(Ll/sua0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rua0;->a:Ll/sua0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rua0;->a:Ll/sua0;

    invoke-static {p0}, Ll/sua0;->b(Ll/sua0;)V

    return-void
.end method
