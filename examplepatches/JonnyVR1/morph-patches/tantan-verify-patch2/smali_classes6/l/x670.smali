.class public final synthetic Ll/x670;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y670;


# direct methods
.method public synthetic constructor <init>(Ll/y670;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x670;->a:Ll/y670;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x670;->a:Ll/y670;

    invoke-virtual {p0}, Ll/y670;->F()V

    return-void
.end method
