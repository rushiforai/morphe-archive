.class public final synthetic Ll/if4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qf4;


# direct methods
.method public synthetic constructor <init>(Ll/qf4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/if4;->a:Ll/qf4;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/if4;->a:Ll/qf4;

    invoke-static {p0}, Ll/qf4;->P3(Ll/qf4;)V

    return-void
.end method
