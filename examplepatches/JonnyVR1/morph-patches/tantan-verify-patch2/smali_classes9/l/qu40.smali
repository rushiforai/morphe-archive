.class public final synthetic Ll/qu40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tu40;


# direct methods
.method public synthetic constructor <init>(Ll/tu40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qu40;->a:Ll/tu40;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qu40;->a:Ll/tu40;

    invoke-static {p0}, Ll/tu40;->m(Ll/tu40;)V

    return-void
.end method
