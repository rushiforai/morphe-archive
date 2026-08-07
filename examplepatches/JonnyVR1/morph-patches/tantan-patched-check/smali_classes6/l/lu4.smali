.class public final synthetic Ll/lu4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mu4;


# direct methods
.method public synthetic constructor <init>(Ll/mu4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lu4;->a:Ll/mu4;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lu4;->a:Ll/mu4;

    invoke-static {p0}, Ll/mu4;->c(Ll/mu4;)V

    return-void
.end method
