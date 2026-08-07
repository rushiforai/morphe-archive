.class public final synthetic Ll/t6f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/u6f0;


# direct methods
.method public synthetic constructor <init>(Ll/u6f0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t6f0;->a:Ll/u6f0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t6f0;->a:Ll/u6f0;

    invoke-virtual {p0}, Ll/u6f0;->C1()V

    return-void
.end method
