.class public final synthetic Ll/nm2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/an2;


# direct methods
.method public synthetic constructor <init>(Ll/an2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nm2;->a:Ll/an2;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nm2;->a:Ll/an2;

    invoke-virtual {p0}, Ll/an2;->u0()V

    return-void
.end method
