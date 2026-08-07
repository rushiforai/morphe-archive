.class public final synthetic Ll/mve;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/sve;


# direct methods
.method public synthetic constructor <init>(Ll/sve;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mve;->a:Ll/sve;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mve;->a:Ll/sve;

    invoke-static {p0}, Ll/sve;->a1(Ll/sve;)V

    return-void
.end method
